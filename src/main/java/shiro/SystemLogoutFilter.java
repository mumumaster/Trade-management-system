package shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;

import com.mybatis.utils.Constants;

public class SystemLogoutFilter extends LogoutFilter {

	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession session = httpServletRequest.getSession();
		session.removeAttribute(Constants.USER_SESSION);
		String redirectUrl = getRedirectUrl(request, response, subject);
		try {

			subject.logout();

		} catch (SessionException ise) {

			ise.printStackTrace();

		}

		issueRedirect(request, response, redirectUrl);
		// 返回false表示不执行后续的过滤器，直接返回跳转到登录页面

		return false;

	}

}
