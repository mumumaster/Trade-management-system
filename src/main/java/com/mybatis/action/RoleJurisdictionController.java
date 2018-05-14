package com.mybatis.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mybatis.bean.Resources;
import com.mybatis.service.resource.ResourceService;
import com.mybatis.utils.StateInfo;
import com.mybatis.utils.WriteJsonUtil;

///sys/roleJurisdiction/list
@Controller
@RequestMapping("/sys/roleJurisdiction")
public class RoleJurisdictionController {

	@Resource
	private ResourceService resService;

	@RequiresUser
	@RequiresPermissions("7") // 执行queryItems需要"2"权限
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "roleJurisdiction/roleJurisdictionList";
	}


	@RequiresUser
	@RequiresPermissions("7") // 执行queryItems需要"7"权限
	@RequestMapping(value = "/getRJRes", method = RequestMethod.POST)
	public String getRJRes(Resources res, Integer have, Integer rjAvailable,
			@RequestParam(value = "checkId[]", required = true) String[] checkDel,
			@RequestParam(value = "pn", required = false, defaultValue = "1") String pn, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 当前页数
		int currentPageInt = Integer.parseInt(pn);
		// 每页显示条数
		int rowPerPage = 5;

		// 分页对象
		PageHelper.startPage(currentPageInt, rowPerPage);
		String name = res.getName();
		String url = res.getUrl();
		Integer type = res.getType();
		// Integer id = res.getId();
		Integer parentid = res.getParentid();
		Integer isavailable = res.getIsavailable();
		Resources info = new Resources();

		if (null != name && !"".equals(name)) {
			info.setName("%" + name + "%");
		}
		if (null != url && !"".equals(url)) {
			info.setUrl("%" + url + "%");
		}
		if (type != null && type < 3 && type > 0) {
			info.setType(type);
			if (type == 1) {
				if(parentid != null && parentid > -1) {
					info.setParentid(parentid);
				}
			}else {
				if(parentid != null && parentid == -1) {
					info.setParentid(parentid);
				}
			}
		}

		List<Resources> list = null;
		if (have != null && have > 0 && have < 3) {

		}
		if (isavailable != null && isavailable > -1 && isavailable < 2) {
			info.setIsavailable(isavailable);
		}
		Map<String, Object> map = new HashMap<>();
		if (checkDel.length < 1) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		if (checkDel.length == 1) {
			Integer roleId = null;
			roleId = Integer.parseInt(checkDel[0]);
			list =resService.selectResInfoToRJChange(info, rjAvailable, roleId, have);
		}else if(checkDel.length > 1) {
			list =resService.selectResInfoToRJChange(info, rjAvailable, null, have);
		}

		if (list == null) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		// Class<? extends List> class1 = list.getClass();

		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		PageInfo<Resources> pageInfo = new PageInfo<Resources>(list, 5);

		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		WriteJsonUtil.putInfoNoCODE(map, "pageInfo", pageInfo);
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}
}
