package com.mybatis.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mybatis.bean.Bill;
import com.mybatis.bean.BillDetail;
import com.mybatis.bean.Product;
import com.mybatis.bean.Provider;
import com.mybatis.bean.Status;
import com.mybatis.service.bill.BillService;
import com.mybatis.service.billdetail.BillDetailService;
import com.mybatis.service.product.ProductService;
import com.mybatis.service.provider.ProviderService;
import com.mybatis.service.status.StatusService;
import com.mybatis.utils.Msg;

@Controller
@RequestMapping("/sys/bill")
public class BillController extends BaseController {
	private Logger logger = Logger.getLogger(BillController.class);

	@Resource
	private BillService billService;

	@Resource
	private ProviderService providerService;

	@Resource
	private ProductService productService;

	@Resource
	private StatusService statusService;

	@Resource
	private BillDetailService billDetailService;

	@RequestMapping(value = "/list.html")
	public String list() {
		return "billlist";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Msg getBillLists(Model model, @Param("orderid") String orderid, @RequestParam(value = "pn", required = false, defaultValue = "1") String pn) {

		// 当前页数
		int currentPageInt = Integer.parseInt(pn);
		// 每页显示条数
		int rowPerPage = 5;

		// 分页对象
		PageHelper.startPage(currentPageInt, rowPerPage);

		System.out.println("\n\n" + orderid);

		Bill info = new Bill();
		if (null != orderid && !"".equals(orderid)) {

			info.setOrderid("%" + orderid + "%");
		}

		List<Bill> list = new ArrayList<Bill>();

		list = billService.selectByExample(info);

		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		PageInfo<Bill> pageInfo = new PageInfo<Bill>(list, 5);

		return Msg.success().add("pageInfo", pageInfo);

	}

	/**
	 * 返回所有供应商信息
	 */
	@RequestMapping("/prodiver")
	@ResponseBody
	public Msg getProdiver() {
		// 查出的所有部门信息
		List<Provider> list = providerService.selectByExample(null);
		return Msg.success().add("provider", list);
	}

	/**
	 * 返回所有订单状态信息
	 */
	@RequestMapping("/status")
	@ResponseBody
	public Msg getStatus() {
		// 查出的所有部门信息
		List<Status> list = statusService.selectByExample(null);
		return Msg.success().add("status", list);
	}

	/**
	 * 返回所有商品信息
	 */
	@RequestMapping("/product")
	@ResponseBody
	public Msg getProduct() {
		// 查出的所有部门信息
		List<Product> list = productService.selectByExample(null);
		return Msg.success().add("product", list);
	}

	/**
	 * 按Id查询商品
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/productId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getProductId(@PathVariable("id") Integer id) {

		Product info = productService.selectByPrimaryKey(id);

		return Msg.success().add("info", info);
	}

	/**
	 * 按商品名称查询商品
	 */
	@RequestMapping(value = "/productName")
	@ResponseBody
	public Msg getProductName(Model model, @Param("name") String name) {

		Product info = productService.selectByName(name);
		return Msg.success().add("info", info);
	}

	/**
	 * 检查订单编号是否可用
	 * 
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkorderid")
	public Msg checkuser(@RequestParam("name") String name) {
		// 先判断用户名是否是合法的表达式;
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)";
		if (!name.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合");
		}

		boolean b = false;
		// 数据库用户名重复校验
		Bill info = new Bill();
		if (null != name && !"".equals(name)) {
			info = billService.checkName(name);
			if (info == null) {
				b = true;
			}
		}

		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "订单编号已存在");
		}
	}

	/**
	 * 保存 1、支持JSR303校验 2、导入Hibernate-Validator
	 * 
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Bill bill, BindingResult result) {
		if (result.hasErrors()) {
			// 校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名：" + fieldError.getField());
				System.out.println("错误信息：" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			float cost = 0;
			bill.setCost(cost);
			billService.insert(bill);
			return Msg.success();
		}
	}

	/**
	 * 根据id查询订单
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/select/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {

		Bill bill = billService.selectByPrimaryKey(id);

		return Msg.success().add("bill", bill);
	}

	/*
	 * 修改订单
	 * 解决方案； 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据 1、配置上HttpPutFormContentFilter；在web.xml中设置
	 * 2、他的作用；将请求体中的数据解析包装成一个map。
	 * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据 修改学生信息
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
	public Msg modify(Bill bill, BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			// 校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名：" + fieldError.getField());
				System.out.println("错误信息：" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			System.out.println("将要更新的员工数据：" + bill);
			billService.updateByPrimaryKeySelective(bill);
			return Msg.success();
		}

	}

	/**
	 * 删除订单 单个批量二合一 批量删除：1-2-3 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete/{ids}", method = RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids") String ids) {
		// 批量删除
		if (ids.contains("-")) {

			String[] str_ids = ids.split("-");
			// 组装id的集合
			for (String string : str_ids) {
				Integer id = Integer.parseInt(string);
				//先删除订单详细表里的信息
				billDetailService.deleteByOrderId(id);
				//再删除订单表里的信息	
				billService.deleteByPrimaryKey(id);
				
			}

		} else {
			Integer id = Integer.parseInt(ids);
			
			//先删除订单详细表里的信息
			billDetailService.deleteByOrderId(id);
			
			//再删除订单表里的信息			
			billService.deleteByPrimaryKey(id);
			
			
		}
		return Msg.success().add("message", "删除成功！");
	}

	/**
	 * 删除订单详细 单个批量二合一 批量删除：1-2-3 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete_detail/{ids}", method = RequestMethod.DELETE)
	public Msg delete_detail(@PathVariable("ids") String ids) {
		// 批量删除
		if (ids.contains("-")) {

			String[] str_ids = ids.split("-");
			// 组装id的集合
			for (String string : str_ids) {
				Integer id = Integer.parseInt(string);
				billDetailService.deleteByPrimaryKey(id);
			}

		} else {
			Integer id = Integer.parseInt(ids);

			BillDetail billDetail = billDetailService.selectByPrimaryKey(id);

			// 更新订单表的消费
			Bill info = new Bill();
			info.setId(billDetail.getOrderid());
			info.setCost(billDetail.getCost());
			billService.updateCostDel(info);

			// 删除
			billDetailService.deleteByPrimaryKey(id);
		}
		return Msg.success().add("message", "删除成功！");
	}

	/**
	 * 跳转到订单详细页面
	 */
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") String id, @Param("session") HttpSession session) {

		// 把Id设置为全局变量
		session.getServletContext().setAttribute("edit_id", id);

		return "forward:/WEB-INF/jsp/bill/detail/detail.jsp";
	}

	/**
	 * 根据订单id查询订单详细信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/billDetails", method = RequestMethod.POST)
	@ResponseBody
	public Msg getDetail( @Param("id") String id, @RequestParam(value = "pn", required = false, defaultValue = "1") String pn) {
		
		Integer ids=Integer.parseInt(id);		
		// 当前页数
		int currentPageInt = Integer.parseInt(pn);
		// 每页显示条数
		int rowPerPage = 3;			

		// 分页对象
		PageHelper.startPage(currentPageInt, rowPerPage);
		
		BillDetail info = new BillDetail();

		info.setOrderid(ids);

		List<BillDetail> list = billDetailService.selectByExample(info);		
		
		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		PageInfo<BillDetail> pageInfo = new PageInfo<BillDetail>(list,5);
				

		return Msg.success().add("pageInfo", pageInfo);
		
		
	}

	/**
	 * 保存订单详细
	 * 
	 */
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveProduct(@ModelAttribute("orderid") Integer orderid, @ModelAttribute("productid") Integer productid, @ModelAttribute("quantity") Integer quantity, @ModelAttribute("cost") Float cost,

			@Valid @ModelAttribute("billDetail") BillDetail billDetail, @Param("result") BindingResult result) {

		if (result.hasErrors()) {
			// 校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名：" + fieldError.getField());
				System.out.println("错误信息：" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {

			billDetail.setOrderid(orderid);
			billDetail.setProductid(productid);
			billDetail.setQuantity(quantity);
			billDetail.setCost(cost);

			// 添加订单详细表信息
			billDetailService.insert(billDetail);

			// 更新订单表的消费
			Bill info = new Bill();
			info.setId(orderid);
			info.setCost(cost);
			billService.updateCostAdd(info);

			return Msg.success();
		}
	}
	
	

	
	/**
	 * 按id查询商品信息 
	 * @param billDetail
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/biDeselect/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getSelectByExamples(BillDetail billDetail, @PathVariable("id") Integer id) {
		
		List<BillDetail> billdel = billDetailService.selectByExample(billDetail);

		return Msg.success().add("billDete", billdel);
	}

	/**
	 * 根据id查询修改订单详情的信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/selectBillDet",method=RequestMethod.GET)
	@ResponseBody
	public Msg getBillDet(@RequestParam("id")Integer id){
			
		BillDetail info = billDetailService.selectByPrimaryKeys(id);
		return Msg.success().add("info", info);
	}
	
	
	/**
	 * 修改数量和总价
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateBillDet/{id}",method=RequestMethod.PUT)
	public Msg modify(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		String productname = request.getParameter("productname");
		String productunit = request.getParameter("productunit");
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		Float price = Float.parseFloat(request.getParameter("price"));
		Float cost = Float.parseFloat(request.getParameter("cost"));
		
		BillDetail billDetail = new BillDetail();
		billDetail.setId(id);
		billDetail.setQuantity(quantity);
		billDetail.setCost(cost);
		//System.out.println("数量："+request.getParameter("quantity"));
		//System.out.println(billDetail.getCost());
		
		//查询原商品的商品总计
		BillDetail info = billDetailService.selectByPrimaryKeys(id);
		Float oldPrice = info.getCost();
		Float newPrice = cost;
		
		//查询订单的总消费
		Bill bill = billService.selectByPrimaryKey(info.getOrderid());
		Float allcost = bill.getCost();
		
		//计算订单的总消费
		if(oldPrice > newPrice) {
			System.out.println("减少了商品");
			allcost=allcost-(oldPrice-newPrice);
		}else {
			System.out.println("增加了商品");
			allcost=(allcost - oldPrice + newPrice);
		}
		
		bill.setCost(allcost);
		
		//更新总消费
		billService.updateByPrimaryKeySelective(bill);
		
		//更新单条商品信息
		billDetailService.updateByDill(billDetail);
		
		return Msg.success();
	}
	

}
