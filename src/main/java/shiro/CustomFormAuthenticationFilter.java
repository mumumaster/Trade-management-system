package shiro;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.mybatis.bean.Resources;
import com.mybatis.bean.User;
import com.mybatis.bean.UserJurisdiction;
import com.mybatis.dao.ResourcesMapper;
import com.mybatis.dao.RoleJurisdictionMapper;
import com.mybatis.dao.RoleMapper;
import com.mybatis.dao.UserJurisdictionMapper;
import com.mybatis.dao.UserMapper;
import com.mybatis.service.resource.ResourceService;
import com.mybatis.utils.Constants;
import com.mybatis.utils.StateInfo;
import com.mybatis.utils.WriteJsonUtil;

import net.sf.json.JSONObject;

/**
 * 
 * <p>
 * Title: CustomFormAuthenticationFilter
 * </p>
 * <p>
 * Description:自定义FormAuthenticationFilter，认证之前实现 验证码校验
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * @author 传智.燕青
 * @date 2015-3-25下午4:53:15
 * @version 1.0
 */
public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {
	
	@Resource
	UserMapper uDao ;
	@Resource
	private ResourcesMapper resDao;	
	@Resource
	private ResourceService resService;
	@Resource
	private RoleMapper rDao;
	@Resource
	private RoleJurisdictionMapper rjDao;
	@Resource
	private UserJurisdictionMapper ujDao;
	// @Autowired
	// CustomRealm cus;

	// 原FormAuthenticationFilter的认证方法
	// protected boolean onAccessDenied(ServletRequest request,
	// ServletResponse response) throws Exception {
	// 在这里进行验证码的校验

	// 从session获取正确验证码
	// HttpServletRequest httpServletRequest = (HttpServletRequest) request;
	// HttpSession session =httpServletRequest.getSession();
	// //取出session的验证码（正确的验证码）
	// String validateCode = (String) session.getAttribute("validateCode");
	//
	// //取出页面的验证码
	// //输入的验证和session中的验证进行对比
	// String randomcode = httpServletRequest.getParameter("randomcode");
	// if(randomcode!=null && validateCode!=null &&
	// !randomcode.equals(validateCode)){
	// //如果校验失败，将验证码错误失败信息，通过shiroLoginFailure设置到request中
	// httpServletRequest.setAttribute("shiroLoginFailure", "randomCodeError");
	// //拒绝访问，不再校验账号和密码
	// return true;
	// }
	// return super.onAccessDenied(request, response);
	// }

	@Override
	public void setUsernameParam(String usernameParam) {
		// TODO Auto-generated method stub
		super.setUsernameParam(usernameParam);
	}

	@Override
	public void setPasswordParam(String passwordParam) {
		// TODO Auto-generated method stub
		super.setPasswordParam(passwordParam);
	}

	public void setMenu(User sysUser) {
		// 从数据库获取到权限数据
		List<Resources> menuAll = new ArrayList<Resources>();
		try {
			List<UserJurisdiction> selectById = ujDao.selectById(sysUser.getId());
			for (UserJurisdiction userJurisdictionInfo : selectById) {
				// 如果有多个角色，那下面就一并进行集合的添加
				List<Resources> selectResourceMenuInfo = resService.selectResourceMenuInfo(userJurisdictionInfo.getRoleid());
				if(selectResourceMenuInfo != null && selectResourceMenuInfo.size()>0) {
					menuAll.addAll(selectResourceMenuInfo);
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sysUser.setMenuInfo(menuAll);
	}
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
			ServletResponse response) throws Exception {
		// 将user对象放入session，这里你可能用不到，可以删除
		// Map<String,String> params = new HashMap<String,String>();
		// params.put("username",token.getPrincipal().toString());
		// PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		// ----------以上代码你可以删除-------------------
		
		boolean hasRole = SecurityUtils.getSubject().isPermitted("error");
		Map<String, Object> result = new HashMap<String, Object>();
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		if (!hasRole) {
			PrincipalCollection previousPrincipals = SecurityUtils.getSubject().getPrincipals();
			User activeUser = (User) previousPrincipals.getPrimaryPrincipal();
//			User selectByName = uDao.selectByName(token.getPrincipal().toString());
//			setMenu(selectByName);
			((HttpServletRequest) request).getSession().setAttribute(Constants.USER_SESSION, activeUser);
//			Session session = subject.getSession();
//			Object attribute = session.getAttribute("userSession");
//			System.err.println(attribute);
		} else {
			result.put(Constants.CODE, StateInfo.SystemConstants.ERROR_JURISDICTION.getCode());
			result.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.ERROR_JURISDICTION.getMessage());
			subject.logout();
			returnJsonInfo(request, response, httpServletRequest, httpServletResponse, result);
			return false;
		}

		result.put(Constants.CODE, StateInfo.SystemConstants.SUCCESS.getCode());
		returnJsonInfo(request, response, httpServletRequest, httpServletResponse, result);
		return false;
	}

	public void returnJsonInfo(ServletRequest request, ServletResponse response, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, Map<String, Object> result) throws Exception, IOException {
		if (!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest.getHeader("X-Requested-With"))) {// 不是ajax请求
			issueSuccessRedirect(request, response);
		} else {
			httpServletResponse.setContentType("application/json; charset=utf-8");

			JSONObject json = JSONObject.fromObject(result);
			PrintWriter out = httpServletResponse.getWriter();
			out.println(json);
			out.flush();
			out.close();
		}
	}

	/**
	 * 当登录失败
	 * 
	 * @param token
	 * @param e
	 * @param request
	 * @param response
	 * @return
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request,
			ServletResponse response) {
		if (!"XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"))) {// 不是ajax请求
			setFailureAttribute(request, e);
			return true;
		}
		try {
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			String message = e.getClass().getSimpleName();
			Map<String, Object> result = new HashMap<String, Object>();
			if ("IncorrectCredentialsException".equals(message)) {
				result.put(Constants.CODE, StateInfo.SystemConstants.USER_PWD_ERROR.getCode());
				result.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.USER_PWD_ERROR.getMessage());
				JSONObject json = JSONObject.fromObject(result);
				out.println(json);
			} else if ("UnknownAccountException".equals(message)) {
				result.put(Constants.CODE, StateInfo.SystemConstants.USER_CODE_UNKNOWN.getCode());
				result.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.USER_CODE_UNKNOWN.getMessage());
				JSONObject json = JSONObject.fromObject(result);
				out.println(json);
			} else if ("LockedAccountException".equals(message)) {
				result.put(Constants.CODE, StateInfo.SystemConstants.USER_STATE_LOCKED.getCode());
				result.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.USER_CODE_UNKNOWN.getMessage());
				JSONObject json = JSONObject.fromObject(result);
				out.println(json);
			}else if("AuthenticationException".equals(message)) {
				WriteJsonUtil.authenticationException(e, (HttpServletRequest)request, (HttpServletResponse)response);
				return false;
			}else {
				result.put(Constants.CODE, StateInfo.SystemConstants.UNKNOWN_ERROR.getCode());
				result.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.UNKNOWN_ERROR.getMessage());
				JSONObject json = JSONObject.fromObject(result);
				out.println(json);
			}
			out.flush();
			out.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	

	

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		 if(this.isLoginRequest(request, response)) {
	            if(this.isLoginSubmission(request, response)) {
	                return this.executeLogin(request, response);
	            } else {
	                return true;
	            }
	        } else {
	            if(isAjax(request)){
	                Map<String,Object> result=new HashMap<String,Object>();
					result.put(Constants.CODE, StateInfo.SystemConstants.NOT_LOGIN.getCode());
					result.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.NOT_LOGIN.getMessage());
	                JSONObject json = JSONObject.fromObject(result);
	    			response.setContentType("application/json; charset=utf-8");
	                response.getWriter().print(json);
	            }else{
	                this.saveRequestAndRedirectToLogin(request, response);
	            }
	            return false;
	        }
	}

	 public static boolean isAjax(ServletRequest request){
	        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
	        if("XMLHttpRequest".equalsIgnoreCase(header)){
	            System.out.println( "当前请求为Ajax请求");
	            return Boolean.TRUE;
	        }
	        System.out.println(  "当前请求非Ajax请求");
	        return Boolean.FALSE;
	    }


	/**
	 * FastJSON的序列化设置
	 */
	private static SerializerFeature[] features = new SerializerFeature[] {
			// 输出Map中为Null的值
			SerializerFeature.WriteMapNullValue,

			// 如果Boolean对象为Null，则输出为false
			SerializerFeature.WriteNullBooleanAsFalse,

			// 如果List为Null，则输出为[]
			SerializerFeature.WriteNullListAsEmpty,

			// 如果Number为Null，则输出为0
			SerializerFeature.WriteNullNumberAsZero,

			// 输出Null字符串
			SerializerFeature.WriteNullStringAsEmpty,

			// 格式化输出日期
			SerializerFeature.WriteDateUseDateFormat };

	/**
	 * 把Java对象JSON序列化
	 * 
	 * @param obj
	 *            需要JSON序列化的Java对象
	 * @return JSON字符串
	 */
	private static String toJSONString(Object obj) {
		return JSON.toJSONString(obj, features);
	}

}
