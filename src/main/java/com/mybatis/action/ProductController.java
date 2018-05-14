package com.mybatis.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
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
import com.mybatis.bean.Product;
import com.mybatis.bean.ProductExample;
import com.mybatis.bean.ProductExample.Criteria;
import com.mybatis.service.product.ProductService;
import com.mybatis.utils.Msg;

@Controller
@RequestMapping("/sys/product")
public class ProductController {

	private Logger logger = Logger.getLogger(ProductController.class);
	@Resource
	private ProductService   product;
	
	@RequestMapping("/productlist.html")
	public String list() {		
		return "productlist";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.POST)
	public Msg showResponseBody(Model model, @RequestParam("productname") String productname,
			@RequestParam(value = "pn", required = false, defaultValue = "0") String pn) {				

		// 当前页数
		int currentPageInt = Integer.parseInt(pn);
		// 每页显示条数
		int rowPerPage = 5;

		// 分页对象
		PageHelper.startPage(currentPageInt, rowPerPage);
					
		ProductExample example = new ProductExample();			
		
		if (null != productname && !"".equals(productname)) {
			Criteria criteria = example.createCriteria();
			criteria.andProductdescLike("%" + productname + "%");				
		}
				

		List<Product> list = new ArrayList<Product>();

		list = product.selectByExample(example);

		// 使用PageInfo对象可以得到分页的各项属性，5表示每页只显示5条连续的页数
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
	

		return Msg.success().add("pageInfo", pageInfo).add("selectName", productname);
	}
	
	
	
	//添加信息
	@ResponseBody
	@RequestMapping(value="/addShow",method=RequestMethod.POST)
	public Msg adds(@Valid @ModelAttribute("Product") Product products,HttpSession session) {					
	
		int result = product.insert(products);	
		 if (result != 0) {
			 return Msg.success();
	        } else {
	          return Msg.fail();
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
	public Msg deleteEmp(@PathVariable("ids")String ids){
		
		System.out.println(ids+"\n");
		//批量删除
		if(ids.contains("-")){
			
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				Integer id=Integer.parseInt(string);
				product.deleteByPrimaryKey(id);
			}
			
		}else{
			Integer id = Integer.parseInt(ids);
			product.deleteByPrimaryKey(id);
		}
		return Msg.success().add("message", "删除成功！");
	}
	
	
	/**
	 * 根据id查询信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/select",method=RequestMethod.GET)
	public Msg getEmp(@Param("id")Integer id){
		Product proInfo = product.selectByPrimaryKey(id);
		return Msg.success().add("product", proInfo);
	}
	
	/**
	 * 更新信息
	 * @param student
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/update/{id}",method=RequestMethod.PUT)
	public Msg modify(Product proinfo,HttpServletRequest request){						
		System.out.println("学生的ID:"+proinfo.getId());
		System.out.println("将要更新的员工数据："+proinfo);
		product.updateByPrimaryKeySelective(proinfo);
		return Msg.success();
	}
	
	
}
