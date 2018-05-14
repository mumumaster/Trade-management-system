<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="${path}/statics/js/returnCode.js"></script>

<script type="text/javascript">

//定义全局的总记录数和当前页
var totalRecord,currentPage;
//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
$(function() {
	//去首页
	to_page(1);
	$('#menuDetail').on('shown.bs.modal', function(e) {
		var id = $("#toShowChirdenDetail").val();
		to_page3(1,id);
	});
	
	//全选
	$("#check_all").click(function(){
		var $choose = $("input[name='checkRoleInfoId']");
		$choose.each(function(){
			var $isChecked = $(this).is(":checked");
			$(this).prop("checked",!$(this).prop("checked"));
		});
	});
	//全不选
	/* $("#not").click(function(){
	   	$choose.prop("checked",this.checked);
	}); */
	//反选
	/* $("#reverse").click(function(){
		$choose.each(function(){
			$(this).prop("checked",!$(this).prop("checked"));
	}); */


	/* $('#menuDetail').on('hidden.bs.modal', function(e) {
		$("#menuChirdenName_table tbody").empty();
		
	});
	$("#select_roleName_btn").click(function() {
		to_page(1);
	});	 */
	
/* 	$('#menuUpdateModal').on('shown.bs.modal', function(e) {
	
	});
	 */
	/* $('#menuUpdateModal').on('hidden.bs.modal', function(e) {
		var hideInfo = $("#menuChirdenHide");
		hideInfo.css({"display":"none"})
	}); */
});

$(document).on("click", ".edit_btn", function() {
	var editId = $(this).attr("edit-id");
	$("#roleInfoId").val(editId);
	toShowRJInfo2(editId);
})
/* function changeRJAvailable(id,available) {
	var checkID = [];// 定义一个空数组
	checkID[0] = id;
	toChangeRJInfo(checkId,available);
} */
function checkItem(checkId) {
	if (checkId.length == 0) {
		alert("请选择一个角色");
	} else {
		toChangeRJInfo(checkId);
		return true;
	}
	return false;
}
function toShowRJInfo(checkId) {
	var checkID = [];// 定义一个空数组
	checkId.each(function(i) {// 把所有被选中的复选框的值存入数组
		checkID[i] = $(this).val();
	});
	var args = {
			"checkId":checkID,
			"time" : new Date()
		};
	ajaxShowRJInfo(args);
};
function to_page1(pn) {
	var id = $("#roleInfoId").val();
	id = $.trim(id);
	if(id === null || id ===""){
		alert("请先选择一个角色")
	}else{
		toShowRJInfo2(id,pn);
	}
}
function toShowRJInfo2(id,pn) {
	var checkID = [];// 定义一个空数组
	checkID[0] = id;
	var name = $("#resName").val();
	name = $.trim(name);
	var url = $("#resUrl").val();
	url = $.trim(url);
	var type = $("#resType").val();
	type = $.trim(type);
	var have = $("#resHave").val();
	have = $.trim(have);
	var rj = $("#rjAvailable").val();
	rj = $.trim(rj);
	var res = $("#resAvailable").val();
	res = $.trim(res);
	var args = {
			"checkId":checkID,
			"name":name,
			"url":url,
			"type":type,
			"have":have,
			"rjAvailable":rj,
			"isavailable":res,
			"pn":pn,
			"time" : new Date()
		};
	ajaxShowRJInfo(args);
};

function ajaxShowRJInfo(args){
	var url = "${path}/sys/roleJurisdiction/getRJRes";
	$.post(url, args, function($data) {
		console.log($data);
		if(checkDataCode($data)){
			if(checkPageInfo($data)){
				console.log($data);
				
				
				//2、解析并显示员工数据
				build_emps_table2($data);
				//3、解析并显示分页信息
				build_page_info($data,"page_info_rjInfo"); 
				//4、解析显示分页条数据
				build_page_nav($data,"page_nav_rjInfo",1);
				$("#rjFoot").append("<button type='button' style='margin: 10px;' class='btn btn-primary'"+
				"id='rj_update_btn'>分配确定</button>");
			}
		}	
	});
}
function showError(message){
	alert(message);
}
/* function toUpdateInfo(id) {
	$('#menuUpdateModal').modal('toggle');

} */
//跳转页面
function to_page(pn) {
	var val = $("#rolename").val();
	val = $.trim(val);
	
	var url = "${path}/sys/role/list";
	var args = {
		"rolename": val,
		"pn":pn,
	};

	$.post(url, args, function(result) {
		if(result != null){
			console.log(result);
		}
		
		//1.按条件查询
		//select_emps_table(result);
		
		//2、解析并显示员工数据
		build_emps_table(result);
		//3、解析并显示分页信息
		build_page_info(result,"page_info_role"); 
		//4、解析显示分页条数据
		build_page_nav(result,"page_nav_role",0);
				
	});
};


//2、解析并显示员工数据
function build_emps_table(result){
	//清空table表格
	$("#roleInfo_table tbody").empty();
	var emps = result.pageInfo.list;
	if(checkDataCode(result)){
		if(checkPageInfo(result)){
			$.each(emps,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item' "+
						"name='checkRoleInfoId' value ='"+item.id+"'/></td>");
				var idTd = $("<input type='hidden' id='roleId' value ='"+item.id+"'/>");
				//var roleCodeTd = $("<td></td>").append(item.rolecode);
				var roleNameTd = $("<td></td>").append(item.rolename);
			
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("分配");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				editBtn.attr("edit-id",item.id);
				var enableBtn = $("<button></button>").addClass("btn btn-primary btn-sm enable_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-off")).append("启用资源");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				enableBtn.attr("onclick","changeRJAvailable("+item.id+",1)");
				var disableBtn = $("<button></button>").addClass("btn btn-danger btn-sm disable_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-off")).append("禁用资源");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				disableBtn.attr("onclick","changeRJAvailable("+item.id+",0)");
				/* var delBtn =  $("<button'></button>")
				.append($("<span></span>").addClass("glyphicon glyphicon-off"));
				if(item.isavailable == 0){
					delBtn.addClass("btn btn-primary btn-sm enable_btn").append("启用");
					delBtn.attr("onclick","changeRJAvailable("+item.id+",1)")
				}else if(item.isavailable == 1){
					delBtn.addClass("btn btn-danger btn-sm disable_btn").append("禁用");
					delBtn.attr("onclick","changeRJAvailable("+item.id+",0)")
				} */
								
				//为删除按钮添加一个自定义的属性来表示当前删除的员工id
				//delBtn.attr("del-id",item.id);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(enableBtn)
				.append(" ").append(disableBtn);
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(idTd)
					//.append(roleCodeTd)
					.append(roleNameTd)		
					.append(btnTd)
					.appendTo("#roleInfo_table tbody");
				
			});
		}
	}
};
function build_emps_table2(result){
	//清空table表格
	$("#resInfo_table tbody").empty();
	var emps = result.pageInfo.list;
	$.each(emps,function(index,item){
		var checkBoxTd = $("<td><input type='checkbox' class='check_item' "+
				"name='checkResInfoId' value ='"+item.id+"'/></td>");
		var id = $("<input type='hidden' id='resId' value ='"+item.id+"'/>");
		var name = $("<td></td>").append(item.name);
		var type = $("<td></td>").append(item.type=='1'?"菜单":"控制器的访问路径");
		var url = $("<td></td>").append(item.url);
		var parentId = $("<td></td>").append(item.parentid=='0'?"<span>顶层菜单</span>":"子菜单");

		var count = $("<td></td>").append(item.chirdenCount);
		var see = $("<td></td>").append(" <button onclick='toShowInfo("+item.id+")' type='button'"+
				" class='btn btn-primary btn-sm glyphicon glyphicon-zoom-in'"+	">查看详细数据</button>");
		
		$("<tr></tr>").append(checkBoxTd)
			.append(id)
			.append(name)
			.append(type)
			.append(url)
			.append(parentId)
			.append(count)
			.append(see)	
			.appendTo("#resInfo_table tbody");
		
	});
};
</script>
