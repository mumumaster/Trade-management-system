package com.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mybatis.bean.Bill;
import com.mybatis.bean.BillDetail;
import com.mybatis.bean.Product;
import com.mybatis.bean.Provider;
import com.mybatis.bean.Resources;
import com.mybatis.bean.Role;
import com.mybatis.bean.User;
import com.mybatis.service.bill.BillService;
import com.mybatis.service.billdetail.BillDetailService;
import com.mybatis.service.product.ProductService;
import com.mybatis.service.provider.ProviderService;
import com.mybatis.service.resource.ResourceService;
import com.mybatis.service.role.RoleService;
import com.mybatis.service.user.UserService;

public class SpringTest1 {

	/**
	 * 左移
	 */
	@Test
	public void selectLeft() throws Exception {

		int i = 0;

		// i=3<<3; //即 3 * 2的3次方=24

		i = 2 << 4; // 即 2 * 2的4次方=32

		System.out.println(i + "");
	}

	/**
	 * 测试按姓名查询
	 * 
	 */
	@Test
	public void selectByName() throws Exception {

		List<User> list = new ArrayList<User>();

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// 业务类接口
		UserService service = (UserService) ctx.getBean("UserService");

		User user = service.selectByName("admin", "111");

		System.out.println(user.getUsername());
	}

	@Test
	public void selectResInfo() throws Exception {

		List<User> list = new ArrayList<User>();

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// 业务类接口
		ResourceService service = (ResourceService) ctx.getBean("ResourceService");

		Resources info = new Resources();
		info.setIsavailable(1);
		
		List<Resources> selectResourceInfo = service.selectResourceInfo(info);
		Map<Integer, Object> top = new HashMap<Integer, Object>();
		for (Resources resources : selectResourceInfo) {
			Integer parentid = resources.getParentid();
			if(parentid == 0) {
				top.put(resources.getId(), resources);
			}else {
				Object object = top.get(parentid);
				Resources res = null;
				if (object != null) {
					if (object.getClass().equals(Resources.class)) {
						res = (Resources) object;
					}
				}
				if(res != null) {
					List<Resources> menuChirden = res.getMenuChirden();
					menuChirden.add(resources);
				}
			}
		}
		Set<Integer> keySet = top.keySet();
		List<Resources> resAll = new ArrayList<Resources>();
		for (Integer parentid : keySet) {
			Object object = top.get(parentid);
			Resources res = null;
			if (object != null) {
				if (object.getClass().equals(Resources.class)) {
					res = (Resources) object;
				}
			}
			if(res != null) {
				resAll.add(res);
			}
		}
		for (Resources resources : resAll) {
			System.out.println(resources);
		}
	}
	
	/**
	 * 测试查询员工集合
	 * 
	 */
	@Test
	public void selectByExample() throws Exception {

		List<User> list = new ArrayList<User>();

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		UserService service = (UserService) ctx.getBean("UserService");

		String name = "a";

		User info = new User();
		if (null != name && !"".equals(name)) {

			info.setUsername("%" + name + "%");
		}

		list = service.selectByExample(info);

		for (User entity : list) {

			System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(entity.getBirthday()));

		}
	}

	/**
	 * 测试查询订单
	 * 
	 */
	@Test
	public void select1() throws Exception {

		List<Bill> list = new ArrayList<Bill>();

		Bill bill = new Bill();

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		BillService service = (BillService) ctx.getBean("BillService");

		bill.setOrderid("%1%");

		list = service.selectByExample(bill);

		for (Bill entity : list) {

			System.out.println(entity.getOrderid());

		}
	}

	/**
	 * 测试查询角色名称
	 * 
	 */
	@Test
	public void select2() throws Exception {

		List<Role> list = new ArrayList<Role>();

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		RoleService service = (RoleService) ctx.getBean("RoleService");

		list = service.selectByExample(null);

		for (Role entity : list) {

			System.out.println(entity.getRolename());

		}
	}

	/**
	 * 测试按Id查询用户
	 * 
	 */
	@Test
	public void select3() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		UserService service = (UserService) ctx.getBean("UserService");

		User user = service.selectByPrimaryKey(1);

		System.out.println(user.getUsername());

	}

	/**
	 * 测试按Id删除用户
	 * 
	 */
	@Test
	public void select4() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		UserService service = (UserService) ctx.getBean("UserService");

		int i = service.deleteByPrimaryKey(24);
		System.out.println(i + "\n\n");

	}

	/**
	 * 测试查询供应商名称集合
	 * 
	 */
	@Test
	public void select5() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		ProviderService service = (ProviderService) ctx.getBean("ProviderService");

		List<Provider> list = service.selectByExample(null);

		for (Provider entity : list) {

			System.out.println(entity.getProname());

		}

	}

	/**
	 * 测试根据Id查询商品
	 * 
	 */
	@Test
	public void select6() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		// providerService是业务类供应商接口
		ProductService service = (ProductService) ctx.getBean("ProductService");

		Product info = service.selectByPrimaryKey(1);

		System.out.println(info.getProductname());

	}

	/**
	 * 测试新增订单
	 * 
	 */
	@Test
	public void select7() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		BillService service = (BillService) ctx.getBean("BillService");

		Bill bill = new Bill();

		bill.setOrderid("s1234567");

		service.insert(bill);

	}

	/**
	 * 测试按订单编号查询商品列表
	 * 
	 */
	@Test
	public void select8() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		BillDetailService service = (BillDetailService) ctx.getBean("BillDetailService");

		BillDetail info = new BillDetail();

		info.setOrderid(1);

		List<BillDetail> list = service.selectByExample(info);

		for (BillDetail entity : list) {

			System.out.println(entity.getProductName());

		}

	}

	/**
	 * 测试按商品名称查询商品
	 * 
	 */
	@Test
	public void select9() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		ProductService service = (ProductService) ctx.getBean("ProductService");

		Product info = service.selectByName("玉米");

		System.out.println(info.getProductname());

	}

	/**
	 * 测试按订单编号添加商品
	 * 
	 */
	@Test
	public void selectSave() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		BillDetailService service = (BillDetailService) ctx.getBean("BillDetailService");

		BillDetail info = new BillDetail();

		info.setOrderid(1);
		info.setProductid(1);
		info.setQuantity(20);
		float a = 400;
		info.setCost(a);

		int i = service.insert(info);

		if (i != 0) {
			System.out.println("保存成功");
		}

	}

	/**
	 * 测试按订单编号更新消费
	 * 
	 */
	@Test
	public void updatecost() throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		BillService service = (BillService) ctx.getBean("BillService");

		Bill info = new Bill();

		info.setId(54);
		float cost = (float) 50.0;
		info.setCost(cost);

		int i = service.updateCostAdd(info);

		if (i != 0) {
			System.out.println("保存成功");
		}

	}

	// 测试遍历Map
	@Test
	public void testMap() {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("orderid_input", "A");
		param.put("proName_input", "B");
		param.put("cost_input", "c");
		param.put("sname_input", "d");
		param.put("name", "name");

		// 第三种：推荐，尤其是容量大时
		System.out.println("第三种：通过Map.entrySet遍历key和value");
		
		for (Map.Entry<String, Object> entry : param.entrySet()) {
			// Map.entry<Integer,String> 映射项（键-值对） 有几个方法：用上面的名字entry
			// entry.getKey() ;entry.getValue(); entry.setValue();
			// map.entrySet() 返回此映射中包含的映射关系的 Set视图。
			System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
		}

	}

}
