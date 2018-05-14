<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">

//定义全局的总记录数和当前页
var totalRecord,currentPage;
//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
$(function() {
	//去首页
	to_page(1);
});

//跳转页面
function to_page(pn) {
	var val = $("#productname").val();
	val = $.trim(val);
	
	var url = "${APP_PATH}/sys/product/list";
	var args = {
		"productname" : val,
		"pn":pn,
	};

	$.post(url, args, function(result) {
		if(result != null){
			console.log(result);
		}
		
		//1.按条件查询
		select_emps_table(result);
		
		//2、解析并显示员工数据
		build_emps_table(result);
		//3、解析并显示分页信息
		 build_page_info(result); 
		//4、解析显示分页条数据
		build_page_nav(result);
				
	});
};

//按姓名查询
function select_emps_table(result){
	$("#emp_select_modal_btn").click(function() {
		to_page(1);
	});		
}



//2、解析并显示员工数据
function build_emps_table(result){
	//清空table表格
	$("#emps_table tbody").empty();
	var emps = result.extend.pageInfo.list;
	$.each(emps,function(index,item){
		var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
		var idTd = $("<input type='hidden' id='id' value ='"+item.id+"'/>");
		var productidTd = $("<td></td>").append(item.productid);
		var productnameTd = $("<td></td>").append(item.productname);
		var productunitTd = $("<td></td>").append(item.productunit);
		var productcountTd = $("<td></td>").append(item.productcount);
		var priceTd = $("<td></td>").append(item.price);
	
		var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		//为编辑按钮添加一个自定义的属性，来表示当前员工id
		editBtn.attr("edit-id",item.id);
		var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
		//为删除按钮添加一个自定义的属性来表示当前删除的员工id
		delBtn.attr("del-id",item.id);
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn); 
		//var delBtn = 
		//append方法执行完成以后还是返回原来的元素
		$("<tr></tr>").append(checkBoxTd)
		
			.append(idTd)
			.append(productidTd)
			.append(productnameTd)
			.append(productunitTd)
			.append(productcountTd)
			.append(priceTd)
						
			.append(btnTd)
			.appendTo("#emps_table tbody");
		
	});
};

</script>
