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
	to_page1(1);
	to_page2(1);
	$('#menuDetail').on('shown.bs.modal', function(e) {
		var id = $("#toShowChirdenDetail").val();
		to_page3(1,id);
	});
	$('#menuDetail').on('hidden.bs.modal', function(e) {
		$("#menuChirdenName_table tbody").empty();
		
	});
	
/* 	$('#menuUpdateModal').on('shown.bs.modal', function(e) {
	
	});
	 */
	$('#menuUpdateModal').on('hidden.bs.modal', function(e) {
		var hideInfo = $("#menuChirdenHide");
		hideInfo.css({"display":"none"})
	});
});

function toShowInfo(id) {
	$("#toShowChirdenDetail").val(id)
	$('#menuDetail').modal('toggle');

}

/* function toUpdateInfo(id) {
	$('#menuUpdateModal').modal('toggle');

} */

//跳转页面
function to_page1(pn) {
	var val = $("#menuName").val();
	var urlInfo = $("#menuUrl").val();
	//alert(val);
	val = $.trim(val);
	var type = 1;	
	var parentId = 0;
	selectControlInfo(pn,val,urlInfo,type,parentId);

};

function to_page2(pn) {
	var val = $("#controlName").val();
	var urlInfo = $("#controlUrl").val();
	val = $.trim(val);
	var type = 2;	
	var parentId = -1;
	selectControlInfo(pn,val,urlInfo,type,parentId);
};

function to_page3(pn,parentId) {
	var val = $("#menuChirdenName").val();
	var urlInfo = $("#menuChirdenUrl").val();
	//alert(val);
	val = $.trim(val);
	var type = 1;	
	selectControlInfo(pn,val,urlInfo,type,parentId);

};

function selectControlInfo(pn,val,urlInfo,type,parentId) {

	var url = "${path}/sys/resource/showList";
	var args = {
			"name" : val,
			"url" : urlInfo,
			"pn":pn,
			"type":type,
			"parentid":parentId,
			"time" : new Date()
		};

		$.post(url, args, function($data) {
			console.log($data);
			if(checkDataCode($data)){
				if(checkPageInfo($data)){
					//1.按条件查询
					//select_emps_table($data);
					
					if(type === 1){
						//2、解析并显示菜单数据
						if(parentId>0){
							build_menuChirdenName_table($data);
						}else if(parentId === 0){
							build_menuName_table($data);
						}
					}else if(type === 2){
						//2、解析并显示控制器路径数据
						build_controlName_table_table($data);
					}
					//3、解析并显示分页信息
					//build_page_info(result);
					//4、解析显示分页条数据
					//build_page_nav(result);
				}
			}
		});
}

//下面这两个全部移到returnCode.js里了
/* function checkPageInfo($data) {
	if($data != null){
		if($data.pageInfo != null){
			if($data.pageInfo.list != null){
				return true;
			}
		}
	}
	return false;
} */

/* function checkDataCode($data) {
	if($data != null){
		if($data.code != null){
			if($data.code != 181){
				if($data.code === "-1000"){
					showError($data.errorMessage);
				}else if($data.code === "-100"){
					showError($data.errorMessage);
				}else if($data.code === "-365"){
					showError($data.errorMessage);
				}else if ($data.code === "-366") {
					showError($data.errorMessage);
				}else if ($data.code === "-555") {
					showError($data.errorMessage);
				}else if ($data.code === "-556") {
					showError($data.errorMessage);
				}else if ($data.code === "-888") {
					showError($data.errorMessage);
				}else if ($data.code === "-997") {
					showError($data.errorMessage);
				}else if ($data.code === "-998") {
					showError($data.errorMessage);
				}else if ($data.code === "-999") {
					showError($data.errorMessage);
				}
			}else{
				return true;
			}
		}
	}
	return false;
} */


function showError(error) {
	alert(error);
}
//按姓名查询
function select_emps_table(result){
	$("#emp_select_modal_btn").click(function() {
		to_page(1);
	});		
}



//2、解析并显示菜单数据
function build_menuName_table(result){
	//清空table表格
	$("#menuName_table tbody").empty();
	var emps = result.pageInfo.list;
	$.each(emps,function(index,item){
		var checkBoxTd = $("<td><input type='checkbox' class='check_item' "+
				"name='checkMenuNameId' value ='"+item.id+"'/></td>");
		
		var id = $("<input type='hidden' id='menuNameId' value ='"+item.id+"'/>");
		var name = $("<td></td>").append(item.name);
		var type = $("<td></td>").append(item.type=='1'?"菜单":"控制器的访问路径");
		var url = $("<td></td>").append(item.url);
		var parentId = $("<td></td>").append(item.parentid=='0'?"<span>顶层菜单</span>":"子菜单");

		var count = $("<td></td>").append(item.chirdenCount);
		var see = $("<td></td>").append(" <button onclick='toShowInfo("+item.id+")' type='button'"+
				" class='btn btn-primary btn-sm glyphicon glyphicon-zoom-in'"+	">查看详细数据</button>");
		
		
		var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		//为编辑按钮添加一个自定义的属性，来表示当前员工id
		editBtn.attr("edit-id",item.id);

		var delBtn =  $("<button></button>")
						.append($("<span></span>").addClass("glyphicon glyphicon-off"));
		if(item.isavailable == 0){
			delBtn.addClass("btn btn-primary enable_btn btn-sm ").append("启用");
			delBtn.attr("onclick","toChangeResourceAvailableInfoById("+item.id+",1,1)")
		}else if(item.isavailable == 1){
			delBtn.addClass("btn btn-danger disable_btn btn-sm ").append("禁用");
			delBtn.attr("onclick","toChangeResourceAvailableInfoById("+item.id+",1,0)")
		}
						
		//为删除按钮添加一个自定义的属性来表示当前删除的员工id
		delBtn.attr("del-id",item.id);
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
		
		//append方法执行完成以后还是返回原来的元素
		$("<tr></tr>").append(checkBoxTd)
			.append(id)
			.append(name)
			.append(type)
			.append(url)
			.append(parentId)
			.append(count)
			.append(see)			
			.append(btnTd)
			.appendTo("#menuName_table tbody");
		
			//3、解析并显示分页信息
			build_page_info(result,"page_info_menuName");
			//4、解析显示分页条数据
			build_page_nav(result,"page_nav_menuName",1);
	});
};

//3、解析并显示菜单子项数据
function build_menuChirdenName_table(result){
	//清空table表格
	$("#menuChirdenName_table tbody").empty();
	var emps = result.pageInfo.list;
	$.each(emps,function(index,item){
		var checkBoxTd = $("<td><input type='checkbox' class='check_item' "+
				"name='checkMenuChirdenNameId' value ='"+item.id+"'/></td>");
		
		var id = $("<input type='hidden'  id='menuChirdenNameId' value ='"+item.id+"'/>");
		$("#menuChirdenNameParentId").val(item.parentid);
		var name = $("<td></td>").append(item.name);
		var type = $("<td></td>").append(item.type=='1'?"菜单":"控制器的访问路径");
		var url = $("<td></td>").append(item.url);
		var parentId = $("<td></td>").append(item.parentid=='0'?"<span>顶层菜单</span>":"子菜单");

		var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		//为编辑按钮添加一个自定义的属性，来表示当前员工id
		editBtn.attr("edit-id",item.id);

		var delBtn =  $("<button'></button>")
						.append($("<span></span>").addClass("glyphicon glyphicon-off"));
		if(item.isavailable == 0){
			delBtn.addClass("btn btn-primary btn-sm enable_btn").append("启用");
			delBtn.attr("onclick","toChangeResourceAvailableInfoById("+item.id+",3,1)")
		}else if(item.isavailable == 1){
			delBtn.addClass("btn btn-danger btn-sm disable_btn").append("禁用");
			delBtn.attr("onclick","toChangeResourceAvailableInfoById("+item.id+",3,0)")
		}
						
		//为删除按钮添加一个自定义的属性来表示当前删除的员工id
		delBtn.attr("del-id",item.id);
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
		
		//append方法执行完成以后还是返回原来的元素
		$("<tr></tr>").append(checkBoxTd)
			.append(id)
			.append(name)
			.append(type)
			.append(url)
			.append(parentId)		
			.append(btnTd)
			.appendTo("#menuChirdenName_table tbody");
		

		//3、解析并显示分页信息
		build_page_info(result,"page_info_menuChirdenName");
		//4、解析显示分页条数据
		build_page_nav(result,"page_nav_menuChirdenName",3);
		
	});
};


//4、解析并显示控制器路径数据
function build_controlName_table_table(result){
	//清空table表格
	$("#controlName_table tbody").empty();;
	var emps = result.pageInfo.list;
	$.each(emps,function(index,item){
		var checkBoxTd = $("<td><input type='checkbox' class='check_item' "+
				"name='checkControlNameId' value ='"+item.id+"'/></td>");
		
		var id = $("<input type='hidden' id='controlNameId' value ='"+item.id+"'/>");
		var name = $("<td></td>").append(item.name);
		var type = $("<td></td>").append(item.type=='1'?"菜单":"控制器的访问路径");
		var url = $("<td></td>").append(item.url);
	
		var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		//为编辑按钮添加一个自定义的属性，来表示当前员工id
		editBtn.attr("edit-id",item.id);
		var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-remove-sign")).append("删除");
		//为删除按钮添加一个自定义的属性来表示当前删除的员工id
		delBtn.attr("del-id",item.id);
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		//为编辑按钮添加一个自定义的属性，来表示当前员工id
		editBtn.attr("edit-id",item.id);

		var delBtn =  $("<button></button>")
						.append($("<span></span>").addClass("glyphicon glyphicon-off"));
		if(item.isavailable == 0){
			delBtn.addClass("btn btn-primary btn-sm enable_btn").append("启用");
			delBtn.attr("onclick","toChangeResourceAvailableInfoById("+item.id+",2,1)")
		}else if(item.isavailable == 1){
			delBtn.addClass("btn btn-danger btn-sm disable_btn").append("禁用");
			delBtn.attr("onclick","toChangeResourceAvailableInfoById("+item.id+",2,0)")
		}
						
		//为删除按钮添加一个自定义的属性来表示当前删除的员工id
		delBtn.attr("del-id",item.id);
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
		
		//append方法执行完成以后还是返回原来的元素
		$("<tr></tr>").append(checkBoxTd)
			.append(id)
			.append(name)
			.append(type)
			.append(url)
			.append(btnTd)
			.appendTo("#controlName_table tbody");

		//3、解析并显示分页信息
		build_page_info(result,"page_info_controlName");
		//4、解析显示分页条数据
		build_page_nav(result,"page_nav_controlName",2);
	});
};
</script>
