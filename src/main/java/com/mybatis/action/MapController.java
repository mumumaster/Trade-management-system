package com.mybatis.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybatis.utils.WordUtil;



@Controller
@RequestMapping("/sys/map")
public class MapController {
		
	@RequestMapping(value = "/map.html")
	public String map() {
		return "map";
	}
	
	@RequestMapping(value = "/address.html")
	public String address() {				
		return "address";
	}
	
	
	/**
	 * 打印功能实现
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/print")
	public void print(@Param("session") HttpSession session,
						@RequestParam("orderid_input")String orderid_input,
						@RequestParam("proName_input")String proName_input,
						@RequestParam("cost_input")String cost_input,
						@RequestParam("sname_input")String sname_input,
						
						@RequestParam("tr0td0")String tr0td0,
						@RequestParam("tr0td1")String tr0td1,
						@RequestParam("tr0td2")String tr0td2,
						@RequestParam("tr0td3")String tr0td3,
						@RequestParam("tr0td4")String tr0td4,
						@RequestParam("tr0td5")String tr0td5,
						
						@RequestParam("tr1td0")String tr1td0,
						@RequestParam("tr1td1")String tr1td1,
						@RequestParam("tr1td2")String tr1td2,
						@RequestParam("tr1td3")String tr1td3,
						@RequestParam("tr1td4")String tr1td4,
						@RequestParam("tr1td5")String tr1td5,
						
						@RequestParam("tr2td0")String tr2td0,
						@RequestParam("tr2td1")String tr2td1,
						@RequestParam("tr2td2")String tr2td2,
						@RequestParam("tr2td3")String tr2td3,
						@RequestParam("tr2td4")String tr2td4,
						@RequestParam("tr2td5")String tr2td5,
						@RequestParam("name")String name) throws Exception{
							
		String path = session.getServletContext().getRealPath("/statics");		
					
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("orderid_input", orderid_input);
		param.put("proName_input", proName_input);
		param.put("cost_input", cost_input);
		param.put("sname_input", sname_input);
		
		param.put("tr0td0", tr0td0);
		param.put("tr0td1", tr0td1);
		param.put("tr0td2", tr0td2);
		param.put("tr0td3", tr0td3);
		param.put("tr0td4", tr0td4);
		param.put("tr0td5", tr0td5);
		
		param.put("tr1td0", tr1td0);
		param.put("tr1td1", tr1td1);
		param.put("tr1td2", tr1td2);
		param.put("tr1td3", tr1td3);
		param.put("tr1td4", tr1td4);
		param.put("tr1td5", tr1td5);
		
		param.put("tr2td0", tr2td0);
		param.put("tr2td1", tr2td1);
		param.put("tr2td2", tr2td2);
		param.put("tr2td3", tr2td3);
		param.put("tr2td4", tr2td4);
		param.put("tr2td5", tr2td5);
				
		param.put("name", name);
		param.put("aa", name);
		
		
		for (Map.Entry<String, Object> entry : param.entrySet()) {	
			System.out.println("键= " + entry.getKey() + " and 值= " + entry.getValue());
		}

		
		String filePath = path+"/doc/word.docx";;
		InputStream is = new FileInputStream(filePath);
		XWPFDocument doc = new XWPFDocument(is);				
		
		// 替换段落里面的变量
		WordUtil.replaceInPara(doc, param);
				
		// 替换表格里面的变量
		WordUtil.replaceInTable(doc, param);
		OutputStream os = new FileOutputStream("D:\\new.docx");
		doc.write(os);
		WordUtil.close(os);
		WordUtil.close(is);
		System.out.println("操作成功！");
	}
	
	

}