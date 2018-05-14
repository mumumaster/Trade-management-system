package com.mybatis.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@WebServlet(urlPatterns={"/init"},loadOnStartup=1)
public class InitAction extends HttpServlet {

	//在最初，打算加载的是 角色信息表 然后以type作为键值载入到application作用域
	//而获得了这个根本没啥用， 还是得去找别的东西
	//根据这个的键值去找角色权限表里所对应的权限，将角色id都一样的都找出来 角色也不会特别多，都先根据id查吧
	//查到后，得去准备资源，所有资源路径不可能一样，所以，可以装载在一个map里，键是路径，值是资源的具体信息
	//再之后，准备用户权限表 里面有用户所持有的角色，但现在一个用户只能持有一个角色，所以，这个也是可以用一个map存 键为用户，值为角色？
	//恩，没有多少可能会通过角色查用户的，如果有，再加吧，到此为止，这是所有要加载的资源

	/**
	 * 
	 */
	private static final long serialVersionUID = 4073971755395897429L;

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();//application作用域
		String path = servletContext.getContextPath();
		servletContext.setAttribute("path", path);
		System.out.println(path);
	}

	



}
