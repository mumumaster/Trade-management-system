package com.mybatis.action;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.session.ExpiredSessionException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mybatis.utils.Constants;
import com.mybatis.utils.StateInfo;
import com.mybatis.utils.WriteJsonUtil;

import net.sf.json.JSONObject;

@Controller
@ControllerAdvice // 全局都可以用到这个类
public class CommonAction {
	/**
	 * 登录认证异常
	 */
	@ExceptionHandler({ UnauthenticatedException.class, AuthenticationException.class })
	public String authenticationException(AuthenticationException au,HttpServletRequest request, HttpServletResponse response) {
		return WriteJsonUtil.authenticationException(au, request, response);
	}

	// ExpiredSessionException
	/**
	 * 登录认证异常
	 * @throws IOException 
	 */
	@ExceptionHandler({ ExpiredSessionException.class })
	public String sessionException(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<>();
		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SESSION_LOST.getCode(),
				StateInfo.SystemConstants.SESSION_LOST.getMessage());
		return WriteJsonUtil.writeInfo(map, request, response,StateInfo.ReturnType.springMVC);
	}

	/**
	 * 权限异常
	 */
	@ExceptionHandler({ UnauthorizedException.class, AuthorizationException.class })
	public String authorizationException(AuthorizationException au, HttpServletRequest request,
			HttpServletResponse response) {
		SecurityUtils.getSubject().logout();
		return WriteJsonUtil.authorizationException(au, request, response);
	}

//	public void put998(Map<String, Object> map) {
//		map.put("code", "-998");
//		map.put("errorMessage", "您暂时无权限访问该资源");
//	}

	/**
	 * 输出JSON
	 *
	 * @param response
	 * @author SHANHY
	 * @create 2017年4月4日
	 */
	// private void writeJson(Map<String, Object> map, HttpServletResponse response)
	// {
	// PrintWriter out = null;
	// try {
	// response.setCharacterEncoding("UTF-8");
	// response.setContentType("application/json; charset=utf-8");
	// out = response.getWriter();
	// JSONObject json = JSONObject.fromObject(map);
	// out.println(json);
	// } catch (IOException e) {
	// e.printStackTrace();
	// } finally {
	// if (out != null) {
	// out.close();
	// }
	// }
	// }

	@RequestMapping(value = "/401", method = RequestMethod.GET)
	public String error401() {
		return StateInfo.SystemConstants.ERROR_RETURN_PATH.getCode();
	}

	@ExceptionHandler(Exception.class)
	public String handlerException(Exception e, HttpServletRequest req) {
		//req.setAttribute("e", e.getMessage());
		//你们看着办，要不要弄个错误页面
		return "redirect:/401";
	}
}
