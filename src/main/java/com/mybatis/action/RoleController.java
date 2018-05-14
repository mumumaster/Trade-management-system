package com.mybatis.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mybatis.bean.Provider;
import com.mybatis.bean.Role;
import com.mybatis.bean.RoleExample;
import com.mybatis.bean.RoleExample.Criteria;
import com.mybatis.service.role.RoleService;
import com.mybatis.utils.Msg;
import com.mybatis.utils.StateInfo;
import com.mybatis.utils.WriteJsonUtil;

@Controller
@RequestMapping("/sys/role")
public class RoleController {

	private Logger logger = Logger.getLogger(RoleController.class);

	@Resource
	private RoleService role;

	public RoleService getRole() {
		return role;
	}

	public void setRole(RoleService role) {
		this.role = role;
	}

	@RequestMapping("/list.html")
	public String list() {
		return "rolelist";
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@RequiresPermissions("6") // 执行queryItems需要"2"权限
	public String showResponseBody(Model model, @RequestParam("rolename") String roleName,
			@RequestParam(value = "pn", required = false, defaultValue = "0") String pn, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 当前页数
		int currentPageInt = Integer.parseInt(pn);
		// 每页显示条数
		int rowPerPage = 5;

		// 分页对象
		PageHelper.startPage(currentPageInt, rowPerPage);

		RoleExample example = new RoleExample();

		if (null != roleName && !"".equals(roleName)) {
			Criteria criteria = example.createCriteria();
			criteria.andRolenameLike("%" + roleName + "%");
		}

		List<Role> list = new ArrayList<Role>();

		list = role.selectByExample(example);
		Map<String, Object> map = new HashMap<>();
		if (list == null) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		PageInfo<Role> pageInfo = new PageInfo<Role>(list);
		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		WriteJsonUtil.putInfoNoCODE(map, "pageInfo", pageInfo);
		WriteJsonUtil.putInfoNoCODE(map, "selectName", roleName);
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}

	// 添加信息
	@RequestMapping(value = "/addShow", method = RequestMethod.POST)
	@RequiresPermissions("6") // 执行queryItems需要"2"权限
	public String adds(@Valid @ModelAttribute("role") Role roles, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		int result = role.insert(roles);
		if (result != 0) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
					StateInfo.SystemConstants.SUCCESS.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		} else {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}

	}

	/**
	 * 单个批量二合一 批量删除：1-2-3 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{ids}", method = RequestMethod.DELETE)
	@RequiresPermissions("6") // 执行queryItems需要"2"权限
	public String deleteEmp(@PathVariable("ids") String ids, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println(ids + "\n");
		// 批量删除
		if (ids.contains("-")) {

			String[] str_ids = ids.split("-");
			// 组装id的集合
			for (String string : str_ids) {
				Integer id = Integer.parseInt(string);
				role.deleteByPrimaryKey(id);
			}
		} else {
			Integer id = Integer.parseInt(ids);
			role.deleteByPrimaryKey(id);
		}
		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}

	/**
	 * 根据id查询信息
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	@RequiresPermissions("6") // 执行queryItems需要"2"权限
	public Msg getEmp(@Param("id") Integer id) {
		Role roleInfo = role.selectByPrimaryKey(id);
		return Msg.success().add("role", roleInfo);
	}

	/**
	 * 更新信息
	 * 
	 * @param student
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
	@RequiresPermissions("6") // 执行queryItems需要"2"权限
	public String modify(Role proinfo, HttpServletRequest request, HttpServletResponse response) throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println("学生的ID:" + proinfo.getId());
		System.out.println("将要更新的员工数据：" + proinfo);
		role.updateByPrimaryKeySelective(proinfo);

		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}

}