package com.mybatis.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mybatis.bean.Role;
import com.mybatis.bean.User;
import com.mybatis.service.role.RoleService;
import com.mybatis.service.user.UserService;
import com.mybatis.utils.Msg;

@Controller
@RequestMapping("/sys/user")
public class UserControl extends BaseController {
	@Resource
	private UserService userService; 	 
	@Resource
	private RoleService roleService;	
	
	@RequestMapping(value = "/list.html")
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	public String list() {		
		return "userlist";
	}
	
	
	/**
	 * 查询用户信息
	 */
	@RequestMapping("/list")
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	@ResponseBody
	public Msg showResponseBody(Model model, @Param("name") String name,
			@RequestParam(value = "pn", required = false, defaultValue = "1") String pn) {				

		// 当前页数
		int currentPageInt = Integer.parseInt(pn);
		// 每页显示条数
		int rowPerPage = 5;

		// 分页对象
		PageHelper.startPage(currentPageInt, rowPerPage);

		User info = new User();
		if (null != name && !"".equals(name)) {
			
			info.setUsername("%" + name + "%");
		}					

		List<User> list = new ArrayList<User>();

		list = userService.selectByExample(info);		

		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		PageInfo<User> pageInfo = new PageInfo<User>(list,5);
		

		return Msg.success().add("pageInfo", pageInfo).add("selectName", name);
	}
	
	/**
	 * 返回所有的角色信息
	 */
	@RequestMapping("/role")
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	@ResponseBody
	public Msg getDepts(){
		//查出的所有部门信息
		List<Role> list = roleService.selectByExample(null);
		return Msg.success().add("role", list);
	}
	
	/**
	 * 员工保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * 
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	@ResponseBody
	public Msg saveEmp(@Valid User user,BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			System.out.println(user.getUserrole()+"========");
			userService.insert(user);
			return Msg.success();
		}
		
	}
	
	/**
	 * 检查用户名是否可用
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	public Msg checkuser(@RequestParam("name")String name){
		//先判断用户名是否是合法的表达式;
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
		if(!name.matches(regx)){
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		
		boolean b = false;
		//数据库用户名重复校验
		User info = new User();
		if (null != name && !"".equals(name)) {						
			info= userService.checkName(name);
			if(info==null) {
				b=true;
			}
		}
		
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "用户名已存在");
		}
	}
	
	/**
	 * 根据id查询学生
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/select/{id}",method=RequestMethod.GET)
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id){
				
		User user = userService.selectByPrimaryKey(id);
		
		return Msg.success().add("user", user);
	}
	
	/* 
	 * 解决方案；
	 * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
	 * 1、配置上HttpPutFormContentFilter；在web.xml中设置
	 * 2、他的作用；将请求体中的数据解析包装成一个map。
	 * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
	 * 修改学生信息
	 * 
	 */
	@ResponseBody
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	@RequestMapping(value="/update/{id}",method=RequestMethod.PUT)
	public Msg modify(User user,BindingResult result,HttpServletRequest request){
		
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			System.out.println("学生的ID:"+user.getId());
			System.out.println("请求体中的值："+request.getParameter("gender"));
			System.out.println("将要更新的员工数据："+user);
			userService.updateByPrimaryKeySelective(user); 
			return Msg.success();
		}
		
		
	}
	
	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete/{ids}",method=RequestMethod.DELETE)
	@RequiresPermissions("5")//执行queryItems需要"2"权限
	public Msg deleteEmp(@PathVariable("ids")String ids){
		
		System.out.println(ids);
		//批量删除
		if(ids.contains("-")){
			
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				Integer id=Integer.parseInt(string);
				userService.deleteByPrimaryKey(id);
			}
			
		}else{
			Integer id = Integer.parseInt(ids);
			userService.deleteByPrimaryKey(id);
		}
		return Msg.success().add("message", "删除成功！");
	}
	
	
	
}
