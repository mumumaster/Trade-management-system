package com.mybatis.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mybatis.bean.Resources;
import com.mybatis.bean.User;
import com.mybatis.service.resource.ResourceService;
import com.mybatis.utils.Msg;
import com.mybatis.utils.StateInfo;
import com.mybatis.utils.WriteJsonUtil;

import shiro.CustomRealm;

@Controller
@RequestMapping("/sys/resource")
public class ResourceController {

	@Resource
	private ResourceService resService;

	@RequiresUser
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "resource/resourcelist";
	}

	/**
	 * 查询用户信息
	 * 
	 * @throws IOException
	 */
	@RequiresUser
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	@RequestMapping(value = "/showList", method = RequestMethod.POST)
	// @ResponseBody
	public String showResponseBody(Resources res,
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
		Integer parentId = res.getParentid();
		Integer id = res.getId();
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
				if (parentId != null && parentId > -1) {
					info.setParentid(parentId);
				}
			} else if (type == 2) {
				info.setParentid(-1);
			}
		}
		List<Resources> list = null;

		if (type != null && type < 3 && type > 0) {
			if (type == 1) {
				if (parentId != null && parentId > -1) {
					if (parentId == 0) {
						if (id != null && id != 0) {
							info.setId(id);
						}
						list = resService.selectResourceInfoAndChirdenCount(info);
					} else {
						list = resService.selectResourceInfo(info);
					}
				}
			} else if (type == 2) {
				if (parentId != null && parentId == -1) {
					list = resService.selectResourceInfo(info);
				}
			}
		}
		Map<String, Object> map = new HashMap<>();
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

	@RequiresUser
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	@RequestMapping(value = "/getResourceInfoByAnything", method = RequestMethod.POST)
	// @ResponseBody
	public String getResourceInfoByAnything(Resources info, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		if (null != info.getName() && !"".equals(info.getName())) {
			info.setName("%" + info.getName() + "%");
		} else {
			info.setName(null);
		}

		List<Resources> list = null;
		list = resService.selectResourceInfoAndChirdenCount(info);

		Map<String, Object> map = new HashMap<>();
		if (list == null) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		// Class<? extends List> class1 = list.getClass();

		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		// PageInfo<Resources> pageInfo = new PageInfo<Resources>(list, 5);

		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		WriteJsonUtil.putInfoNoCODE(map, "list", list);
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}

	@RequiresUser
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	@RequestMapping(value = "/getResourceIdByParentId", method = RequestMethod.POST)
	// @ResponseBody
	public String getResourceIdByParentId(Resources res, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		// if (null != name && !"".equals(name)) {
		//
		// info.setUsername("%" + name + "%");
		// }
		Integer parentid = res.getParentid();
		Resources info = new Resources();
		if (parentid != null && parentid > 0) {
			info.setParentid(parentid);
		}

		Resources list = null;
		list = resService.selectResourceIdByParentId(info);

		Map<String, Object> map = new HashMap<>();
		if (list == null) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		// Class<? extends List> class1 = list.getClass();

		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		// PageInfo<Resources> pageInfo = new PageInfo<Resources>(list, 5);

		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		WriteJsonUtil.putInfoNoCODE(map, "info", list);
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}

	// 注入realm
	@Autowired
	private CustomRealm customRealm;

	// 信息禁用
	@RequiresUser
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	@RequestMapping(value = "/changeAvailable", method = RequestMethod.POST)
	public String delInfo(@RequestParam(value = "isavailable", required = true) Integer isavailable,
			@RequestParam(value = "checkId[]", required = true) String[] checkDel, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<>();
		System.err.println(isavailable);
		if (isavailable == null || (isavailable > 1 || isavailable < 0)) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		if (checkDel.length == 0) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}

		Subject subject = SecurityUtils.getSubject();  
		Session session = subject.getSession();
		Object attribute = session.getAttribute("userSession");
		List<Resources> list = new ArrayList<Resources>();
		int error = 0;
		for (String str : checkDel) {
			Integer id = null;
			if (checkInfo(str)) {
				try {
					id = Integer.parseInt(str);
				} catch (Exception e) {
					e.printStackTrace();
					error++;
					break;
				}
				Resources info = new Resources();
				info.setId(id);
				list.add(info);
			}
		}
		if (error != 0) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		int changeAvailable = resService.changeAvailable(list, isavailable);
		if (changeAvailable < 1) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		if (customRealm != null) {
			customRealm.clearAllCachedAuthorizationInfo2();
		}

		attribute = session.getAttribute("userSession");
		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	public String modify(Resources res, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<>();
		Resources info = new Resources();
		boolean checkResource = checkResourceUpdate(res, info);
		if (!checkResource) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		int updateByPrimaryKey = 0;
		try {
			updateByPrimaryKey = resService.updateByPrimaryKeySelective(info);
		} catch (Exception e) {
			e.printStackTrace();
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		if (updateByPrimaryKey < 1) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_UPDATE_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_UPDATE_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}
	@RequestMapping(value = "/add", method = RequestMethod.PUT)
	@RequiresPermissions("4")//执行queryItems需要"2"权限
	public String addResourceInfo(Resources res, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<>();
		Resources info = new Resources();
		boolean checkResource = checkResourceAdd(res, info);
		if (!checkResource) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		int updateByPrimaryKey = 0;
		try {
			updateByPrimaryKey = resService.insertSelective(info);
		} catch (Exception e) {
			e.printStackTrace();
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_GET_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_GET_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		if (updateByPrimaryKey < 1) {
			WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.DATA_UPDATE_ERROR.getCode(),
					StateInfo.SystemConstants.DATA_UPDATE_ERROR.getMessage());
			return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
		}
		WriteJsonUtil.putInfo(map, StateInfo.SystemConstants.SUCCESS.getCode(),
				StateInfo.SystemConstants.SUCCESS.getMessage());
		return WriteJsonUtil.writeInfo(map, request, response, StateInfo.ReturnType.springMVC);
	}
	public boolean checkResourceAdd(Resources res, Resources info) {
		Integer id = res.getId();
		if (id != null) {
			return false;
		}

		String name = res.getName();
		if (name != null && !name.trim().equals("")) {
			info.setName(name);
		} else {
			return false;
		}
		String url = res.getUrl();
		if (url != null && !url.trim().equals("")) {
			info.setUrl(url);
			Resources resources = new Resources();
			resources.setName(name);
			resources.setUrl(url);
			List<Resources> selectResourceInfoEqual = resService.selectResourceInfoEqual(resources);
			if(selectResourceInfoEqual == null || selectResourceInfoEqual.size() != 0) {
				return false;
			}
		} else {
			return false;
		}
		Integer type = res.getType();
		if (type != null && (type < 3 && type > 0)) {
			info.setType(type);
		} else {
			return false;
		}

		Integer parentid = res.getParentid();
		if (parentid == null || parentid < -1) {// 判断范围是否符合
			return false;
		}

		if (type == 1 && parentid < 0) {
			return false;
		}
		if (type == 2 && parentid != -1) {
			return false;
		}
		if (parentid > 0 && type == 1) {// 当选择了上级菜单，且自身要更改的type为1

			Resources selectByPrimaryKey = resService.selectByPrimaryKey(parentid.longValue());
			// 根据那个上级菜单的id查询，看看那个id是否存在
			if (selectByPrimaryKey == null) {// 不存在
				return false;
			}
			Integer type2 = selectByPrimaryKey.getType();// 获得type判断这个是不是菜单类型
			if (type2 == null || type2 != 1) {// 如果获取的type为空，或者不是菜单类型，则返回false
				return false;
			}
			Integer parentid2 = selectByPrimaryKey.getParentid();// 获取到parentId 如果不是顶层菜单，不能进行放置
			if (parentid2 == null || parentid2 != 0) {
				return false;
			}
		}
		info.setParentid(parentid);
		return true;
	}
	public boolean checkResourceUpdate(Resources res, Resources info) {
		Integer id = res.getId();
		List<Resources> selectResourceInfoAndChirdenCount = null;
		if (id == null || id < 1) {
			return false;
		}
		if (id != null && id != 0) {
			Resources resources = new Resources();
			resources.setId(id);// 将id设进去，用来查询，传进来的id是否是已有的
			selectResourceInfoAndChirdenCount = resService.selectResourceInfoAndChirdenCount(resources);
			if (selectResourceInfoAndChirdenCount == null || selectResourceInfoAndChirdenCount.size() != 1) {
				return false;
			}
			info.setId(id);
		}

		String name = res.getName();
		if (name != null && !name.trim().equals("")) {
			info.setName(name);
		} else {
			return false;
		}
		String url = res.getUrl();
		if (url != null && !url.trim().equals("")) {
			info.setUrl(url);
			Resources resources = new Resources();
			resources.setName(name);
			resources.setUrl(url);
			List<Resources> selectResourceInfoEqual = resService.selectResourceInfoEqual(resources);
			if(selectResourceInfoEqual == null || selectResourceInfoEqual.size() != 0) {
				return false;
			}
		} else {
			return false;
		}
		Integer type = res.getType();
		if (type != null && (type < 3 && type > 0)) {
			info.setType(type);
		} else {
			return false;
		}
		Resources resources2 = new Resources();
		if (selectResourceInfoAndChirdenCount != null && selectResourceInfoAndChirdenCount.size() == 1) {
			for (Resources res2 : selectResourceInfoAndChirdenCount) {
				resources2 = res2;// 获取到那个旧的资源信息
			}
		}

		Integer parentid = res.getParentid();
		if (parentid == null || parentid < -1) {// 判断范围是否符合
			return false;
		}
		if (parentid != 0) {// 如果要改的上级id不是0，就是顶层菜单 ，就需要判断其原来有没有子项菜单
			Integer chirdenCount = resources2.getChirdenCount();
			if (chirdenCount != null && chirdenCount > 0) {// 因为暂时不支持3级菜单，故而不得将有子项的菜单放到别的菜单之后
				return false;
			}
		}
		if (type == 1 && parentid < 0) {
			return false;
		}
		if (type == 2 && parentid != -1) {
			return false;
		}
		if (parentid > 0 && type == 1) {// 当选择了上级菜单，且自身要更改的type为1

			Resources selectByPrimaryKey = resService.selectByPrimaryKey(parentid.longValue());
			// 根据那个上级菜单的id查询，看看那个id是否存在
			if (selectByPrimaryKey == null) {// 不存在
				return false;
			}
			Integer type2 = selectByPrimaryKey.getType();// 获得type判断这个是不是菜单类型
			if (type2 == null || type2 != 1) {// 如果获取的type为空，或者不是菜单类型，则返回false
				return false;
			}
			Integer parentid2 = selectByPrimaryKey.getParentid();// 获取到parentId 如果不是顶层菜单，不能进行放置
			if (parentid2 == null || parentid2 != 0) {
				return false;
			}
		}
		info.setParentid(parentid);
		return true;
	}

	// 判断字符串是否为null或空
	public static boolean checkInfo(String info) {
		boolean flag = false;
		if (info != null && !info.trim().equalsIgnoreCase("")) {
			// System.out.println("info:"+info);
			// System.out.println(info.equalsIgnoreCase(""));
			flag = true;
		}
		return flag;
	}

}
