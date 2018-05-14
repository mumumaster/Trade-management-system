package shiro;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.mybatis.bean.Resources;
import com.mybatis.bean.RoleJurisdiction;
import com.mybatis.bean.User;
import com.mybatis.bean.UserJurisdiction;
import com.mybatis.dao.ResourcesMapper;
import com.mybatis.dao.RoleJurisdictionMapper;
import com.mybatis.dao.RoleMapper;
import com.mybatis.dao.UserJurisdictionMapper;
import com.mybatis.dao.UserMapper;
import com.mybatis.service.resource.ResourceService;
import com.mybatis.utils.StateInfo;


/**
 * 
 * <p>
 * Title: CustomRealm
 * </p>
 * <p>
 * Description:自定义realm
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * @author 传智.燕青
 * @date 2015-3-23下午4:54:47
 * @version 1.0
 */
public class CustomRealm extends AuthorizingRealm {

	public static final String USER_STATE_ERROR = "-365";
	public static final String USER_STATE_LOCKED = "-366";

	// 注入service
	// @Resource(name = "userService")

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

	// 设置realm的名称
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	// realm的认证方法，从数据库查询用户信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//		SecurityUtils.getSubject();
		// token是用户输入的用户名和密码
		// 第一步从token中取出用户名
		String userCode = (String) token.getPrincipal();

		// 第二步：根据用户输入的userCode从数据库查询
		User sysUser = null;
		try {
			sysUser = uDao.selectByName(userCode);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		// 如果查询不到返回null
		if (sysUser == null) {//
			return null;
		}
		Integer state = sysUser.getUserstate();
		if (state == null) {
			throw new AuthenticationException(StateInfo.SystemConstants.USER_STATE_ERROR.getCode());
		}
		if(state < 0) {
			throw new AuthenticationException(StateInfo.SystemConstants.USER_STATE_ERROR.getCode());
		}
		if(state >0) {
			throw new AuthenticationException(StateInfo.SystemConstants.USER_STATE_LOCKED.getCode());
		}
		
		// 从数据库查询到密码
		String password = sysUser.getUserpassword();
		if(password == null || password.trim().equals("")) {
			return null;
		}
		// 盐
//		String salt = sysUser.getSalt();
//		if(salt == null || salt.trim().equals("")) {
//			return null;
//		}
		// 如果查询到返回认证信息AuthenticationInfo

		// activeUser就是用户身份信息
		// UserInfo activeUser = new UserInfo();
		//
		// activeUser.setId(sysUser.getId());
		// activeUser.setAccount(sysUser.getAccount());
		// activeUser.setName(sysUser.getName());
		// ..
		
		// 根据用户id取出菜单
		
		// List<SysPermission> menus = null;
		// try {
		// //通过service取出菜单
		// menus = sysService.findMenuListByUserId(sysUser.getId());
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// //将用户菜单 设置到activeUser
		// activeUser.setMenus(menus);

		// 将activeUser设置simpleAuthenticationInfo
//		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(sysUser, password , this.getName()); 
		AuthenticationInfo Info = new SimpleAuthenticationInfo(sysUser, password,this.getName());
		return Info;
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
	// 用于授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		Subject subject = SecurityUtils.getSubject();  
//		Session session = subject.getSession();
//		Object attribute = session.getAttribute("userSession");
		// 从 principals获取主身份信息
		// 将getPrimaryPrincipal方法返回值转为真实身份类型（在上边的doGetAuthenticationInfo认证通过填充到SimpleAuthenticationInfo中身份类型），
		User activeUser = (User) principals.getPrimaryPrincipal();
		setMenu(activeUser);
		//修改属性  
//		String realmName = principals.getRealmNames().iterator().next();  
//		PrincipalCollection newPrincipalCollection = new SimplePrincipalCollection(activeUser, realmName);  
//		//重新加载Principal  
//		subject.runAs(newPrincipalCollection);
		
//		attribute = session.getAttribute("userSession");
		
		// 根据身份信息获取权限信息
		// 从数据库获取到权限数据
		List<RoleJurisdiction> permissionList = new ArrayList<RoleJurisdiction>();
		try {
			List<UserJurisdiction> selectById = ujDao.selectById(activeUser.getId());
			for (UserJurisdiction userJurisdictionInfo : selectById) {
				// 如果有多个角色，那下面就一并进行集合的添加
				List<RoleJurisdiction> selectRoleJurisdictionInfo = rjDao.selectRoleJurisdictionInfo(userJurisdictionInfo.getRoleid(),null);
				if(selectRoleJurisdictionInfo != null && selectRoleJurisdictionInfo.size()>0) {
					permissionList.addAll(selectRoleJurisdictionInfo);
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 单独定一个集合对象
		List<String> permissions = new ArrayList<String>();
		if (permissionList != null && permissionList.size() >0) {
			for (RoleJurisdiction sysPermission : permissionList) {
				// 将数据库中的权限标签 符放入集合
				permissions.add(sysPermission.getResid().toString());
			}
		}else {
			permissions.add("error");
		}

		/*
		 * List<String> permissions = new ArrayList<String>();
		 * permissions.add("user:create");//用户的创建 permissions.add("item:query");//商品查询权限
		 * permissions.add("item:add");//商品添加权限 permissions.add("item:edit");//商品修改权限
		 */ // ....

		// 查到权限数据，返回授权信息(要包括 上边的permissions)
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		// 将上边查询到授权信息填充到simpleAuthorizationInfo对象中
		simpleAuthorizationInfo.addStringPermissions(permissions);
		
		return simpleAuthorizationInfo;
	}

	// 清除缓存
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}
	/** 
	 * 清空所有关联认证 
	 */  
	public void clearAllCachedAuthorizationInfo2() {  
	    Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();  
	    if (cache != null) {  
	        for (Object key : cache.keys()) {  
	            System.out.println(key+":"+key.toString());  
	            cache.remove(key);  
	        }  
	    }  
	} 
}
