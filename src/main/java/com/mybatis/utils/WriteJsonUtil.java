package com.mybatis.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;

import com.mybatis.utils.StateInfo.ReturnType;
import com.mybatis.utils.StateInfo.SystemConstants;

import net.sf.json.JSONObject;

public class WriteJsonUtil {

	public static String authenticationException(AuthenticationException au, HttpServletRequest request,
			HttpServletResponse response) {
		if ("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
			// 输出JSON
			Map<String, Object> map = new HashMap<>();
			if (au != null) {
				String message = au.getMessage();
				// 获取代码

				// 在switch中使用通常需要先获取枚举类型才判断，因为case中是常量或者int、byte、short、char，写其他代码编译是不通过的

				if (message != null) {
					switch (message.trim()) {
					case Constants.USER_STATE_ERROR:
						map.put(Constants.CODE, StateInfo.SystemConstants.USER_STATE_ERROR.getCode());
						map.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.USER_STATE_ERROR.getMessage());
						break;
					case Constants.USER_STATE_LOCKED:
						map.put(Constants.CODE, StateInfo.SystemConstants.USER_STATE_LOCKED.getCode());
						map.put(Constants.ERROR_MESSAGE, StateInfo.SystemConstants.USER_STATE_LOCKED.getMessage());
						break;
					default:
						put999(map);
						break;
					}
				} else {
					put999(map);
				}
			} else {
				put999(map);
			}
			WriteJsonUtil.writeJson(map, response);
			return null;
		} else {
			return "redirect:" + SystemConstants.ERROR_RETURN_PATH.getCode();
		}
	}

	public static void put999(Map<String, Object> map) {
		map.put(Constants.CODE, SystemConstants.NOT_LOGIN.getCode());
		map.put(Constants.ERROR_MESSAGE, SystemConstants.NOT_LOGIN.getMessage());
	}

	public static String authorizationException(AuthorizationException au, HttpServletRequest request,
			HttpServletResponse response) {
		if ("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
			// 输出JSON
			Map<String, Object> map = new HashMap<>();
			put998(map);
			writeJson(map, response);
			return null;
		} else {
			return "redirect:" + SystemConstants.ERROR_RETURN_PATH.getCode();
		}
	}

	public static void put998(Map<String, Object> map) {
		map.put(Constants.CODE,SystemConstants.NO_JURISDICTION.getCode() );
		map.put(Constants.ERROR_MESSAGE,SystemConstants.NO_JURISDICTION.getMessage());
	}

	public static String writeInfo(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
			StateInfo.ReturnType type) throws IOException {
		if ("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
			// 输出JSON
			writeJson(map, response);
			return null;
		} else {
			if (type == ReturnType.response) {
				response.sendRedirect(request.getContextPath() + SystemConstants.ERROR_RETURN_PATH.getCode()
						+ SystemConstants.ERROR_RETURN_PATH.getMessage());
				return null;
			} else {
				return "redirect:" + SystemConstants.ERROR_RETURN_PATH.getCode();
			}
		}
	}

	/**
	 * @Description: 使用固定死的CODE、ERROR_MESSAGE为键，这是专门用来传递错误信息的
	 * @Title: putInfo
	 * @param map
	 * @param key
	 * @param value  void    (返回类型)
	 */
	public static void putInfo(Map<String, Object> map, String key, Object value) {
		map.put(Constants.CODE, key);
		map.put(Constants.ERROR_MESSAGE, value);
	}
	/**
	 * @Description: 不使用固定死的CODE为键，自定义传值
	 * @Title: putInfoNoCODE
	 * @param map
	 * @param key
	 * @param value  void    (返回类型)
	 */
	public static void putInfoNoCODE(Map<String, Object> map, String key, Object value) {
		map.put(key, value);
	}
	/**
	 * 输出JSON
	 *
	 * @param response
	 * @author SHANHY
	 * @create 2017年4月4日
	 */
	public static void writeJson(Map<String, Object> map, HttpServletResponse response) {
		PrintWriter out = null;
		try {

			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			out = response.getWriter();
			JSONObject json = JSONObject.fromObject(map);
			out.println(json);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
}
