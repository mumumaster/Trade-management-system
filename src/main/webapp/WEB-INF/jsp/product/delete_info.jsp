<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
//单个删除
$(document).on("click",".delete_btn",function(){
	//1、弹出是否确认删除对话框
	var name = $(this).parents("tr").find("td:eq(1)").text();
	//在showInfo.jsp中定义的del-id自定属性
	var id = $(this).attr("del-id");	
	
	if(confirm("确认删除【"+name+"】吗？")){
		//确认，发送ajax请求删除即可
		$.ajax({
			url:"${APP_PATH}/sys/product/delete/"+id,
			type:"DELETE",
			success:function(result){
				//alert(result.msg);
				alert(result.extend.message)
				//回到本页
				to_page(currentPage);
			}
		});
	}
});

//完成全选/全不选功能
$("#check_all").click(function(){
	//attr获取checked是undefined;
	//我们这些dom原生的属性；attr获取自定义属性的值；
	//prop修改和读取dom原生属性的值
	$(".check_item").prop("checked",$(this).prop("checked"));
});

//check_item是多选框的类属性
$(document).on("click",".check_item",function(){
	//判断当前选择中的元素是否5个
	var flag = $(".check_item:checked").length==$(".check_item").length;
	$("#check_all").prop("checked",flag);
});

//点击全部删除，就批量删除
$("#stu_delete_all_btn").click(function(){
	var name = "";
	var del_idstr = "";
	$.each($(".check_item:checked"),function(){
		//this
		name += $(this).parents("tr").find("td:eq(1)").text()+",";
		//组装员工id字符串
		//del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
		del_idstr += $(this).parents("tr").find("#id").val()+"-";
		
	});		
	//去除name多余的,
	name = name.substring(0, name.length-1);
	//去除删除的id多余的-
	del_idstr = del_idstr.substring(0, del_idstr.length-1);	
	if(del_idstr==""){
		alert("请在复选框选择要删除的学生！");
		return false;
	}
	if(confirm("确认删除【"+name+"】吗？")){
		//发送ajax请求删除
		$.ajax({
			url:"${APP_PATH}/sys/product/delete/"+del_idstr,
			type:"DELETE",
			success:function(result){
				alert(result.msg);
				//回到当前页面
				to_page(currentPage);
			}
		});
	}
});
</script>
