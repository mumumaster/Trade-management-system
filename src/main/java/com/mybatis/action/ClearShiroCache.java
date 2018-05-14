package com.mybatis.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shiro.CustomRealm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;


/**
 * 
 * <p>Title: ClearShiroCache</p>
 * <p>Description: 手动调用controller清除shiro的缓存</p>
 * <p>Company: www.itcast.com</p> 
 * @author	传智.燕青
 * @date	2015-3-25下午4:26:14
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class ClearShiroCache {
	
	//注入realm
	@Autowired
	private CustomRealm customRealm;
	
//	@RequestMapping("/clearShiroCache")
//	public String clearShiroCache(){
//		
//		//清除缓存，将来正常开发要在service调用customRealm.clearCached()
//		customRealm.clearCached();
//		
//		return "redirect:/controller/login/login";
//	}
	
	//@RequestMapping("/clearShiroCache")
	public void clearUserInfo(String userName) {
		// add by jizhun at 重新修改权限后清楚缓存，调用doGetAuthorizationInfo重新取角色的权限信息
		RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
		CustomRealm shiroRealm = (CustomRealm) rsm.getRealms().iterator().next();
		Subject subject = SecurityUtils.getSubject();
		String realmName = subject.getPrincipals().getRealmNames().iterator().next();
		// ogger.info("oper.user="+user.getEmail()+",login.user="+SecurityUtils.getSubject().getPrincipal().toString());
		System.err.println("user:");
		// shiroRealm.clearAllCachedAuthorizationInfo2();//清楚所有用户权限
		// 第一个参数为用户名,第二个参数为realmName,test想要操作权限的用户
		SimplePrincipalCollection principals = new SimplePrincipalCollection(userName, realmName);
		subject.runAs(principals);
		shiroRealm.getAuthorizationCache().remove(subject.getPrincipals());
		shiroRealm.getAuthorizationCache().remove(userName);
		subject.releaseRunAs();
	}

	//@RequestMapping("/clearAll")
	public void clerAll() {
		customRealm.clearAllCachedAuthorizationInfo2();
	}

}
