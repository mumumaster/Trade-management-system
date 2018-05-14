package com.mybatis.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.bean.User;
import com.mybatis.service.user.UserService;
import com.mybatis.utils.Constants;

@Controller
public class LoginController {
	private Logger logger = Logger.getLogger(LoginController.class);

	@Resource
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession httpSession) {
		User user =  (User) httpSession.getAttribute(Constants.USER_SESSION);
		if (null == user) {
			return "login";
		}
		return "redirect:/sys/main.html";
	}

	// 登录验证
//	@RequestMapping(value = "/dologin.html", method = RequestMethod.POST)
	public String doLogin(@RequestParam String userCode, @RequestParam String userPassword, HttpServletRequest request, HttpSession session) throws Exception {
		logger.debug("doLogin====================================");
		// 调用service方法，进行用户匹配
		 User user = userService.selectByName(userCode, userPassword);
		if (null != user) {// 登录成功
			logger.debug("\n登录成功！");
			// 把用户对象放入session
			session.setAttribute(Constants.USER_SESSION, user);
			// 页面跳转（frame.jsp）
			return "redirect:/sys/main.html";
			
		} else {
			logger.debug("\n登录失败！");
			// 页面跳转（login.jsp）带出提示信息--转发
			request.setAttribute("error", "用户名或密码不正确");
			return "login";
		}

	}

	// 退出登录
//	@RequestMapping(value = "/logout.html")
	public String logout(HttpSession session) {
		// 清除session
		session.removeAttribute(Constants.USER_SESSION);
		return "login";
	}

	// 登录成功后跳转到frame.jsp
	@RequiresPermissions("2")//执行queryItems需要"2"权限
	@RequestMapping(value = "/sys/main.html", method = RequestMethod.GET)
	public String main() {
		return "frame";
	}
	
	@RequestMapping(value="/syserror.html")
	public String sysError(){
		return "syserror";
	}

}
