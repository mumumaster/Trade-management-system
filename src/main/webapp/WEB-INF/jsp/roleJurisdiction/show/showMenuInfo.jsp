<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="${path}/statics/js/returnCode.js"></script>

<!-- Large modal -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" style="display: none;"
	id="showMenuInfoDetail">
	<div class="modal-dialog modal-lg" role="document" style="width: 1269px;">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myLargeModalLabel">查看菜单子项</h4>
			</div>
			<div class="modal-body">
				<!-- 按钮 -->
				<div class="row">
					<div class="col-md-9 col-md-offset-1">
						<form class="form-inline">
							<span class="form-group"> 
								<label for="showMenuInfoId">编号:</label> <input
								type="text" class="form-control" id="showMenuInfoId"
								placeholder="menuId">
								<label for="showMenuInfoName">名称:</label> <input
								type="text" class="form-control" id="showMenuInfoName"
								placeholder="menuName">
								<label for="showMenuInfoUrl">资源访问地址:</label> <input
								type="text" class="form-control" id="showMenuInfoUrl"
								placeholder="menuUrl">
							</span> 
								<div class="btn btn-primary glyphicon glyphicon-search"
									id="select_showMenuInfo_btn" onclick="gotoPage(1,4)">查询</div>
						</form>
					</div>
				</div>
				<!-- 分类 -->
				<div class="row">
					<div class="col-md-12">
						<h3>菜单类型</h3>
					</div>
				</div>
				<!-- 显示表格数据 -->
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover" id="showMenuInfo_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check_all" /></th>
									<th>编号</th>
									<th>资源名称</th>
									<th>资源的类型</th>
									<th>资源访问路径</th>
									<th>菜单的类型</th>
									<th>子项的数目</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 显示分页信息 -->
				<div class="row">
					<!--分页文字信息  -->
					<h2 class="col-md-6" id="page_info_showMenuInfo" style="font-size: 26px;"></h2>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="page_nav_showMenuInfo"></div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>



<script type="text/javascript">

//定义全局的总记录数和当前页
var totalRecord,currentPage;
//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
$(function() {
	
});


function toChooseParentId(id) {
	$("#menu_chirdenMenuType_update_input").val(id);
	$('#showMenuInfoDetail').modal('toggle');
}


function to_page4(pn,parentId,id) {
	var val = $("#showMenuInfoName").val();
	var url = $("#showMenuInfoUrl").val();
	//alert(val);
	val = $.trim(val);
	id = $.trim(id);
	url = $.trim(url);
	var type = 1;	
	selectControlInfo2(pn,val,type,parentId,id,url);
};

function selectControlInfo2(pn,val,type,parentId,id,url2) {

	var url = "${path}/sys/resource/showList";
	var args = {
			"name" : val,
			"pn":pn,
			"type":type,
			"parentid":parentId,
			"id":id,
			"url":url2,
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
							
						}else if(parentId === 0){
							build_menuName_table2($data);
						}
					}else if(type === 2){
						//2、解析并显示控制器路径数据
						
					}
					//3、解析并显示分页信息
					//build_page_info(result);
					//4、解析显示分页条数据
					//build_page_nav(result);
				}
			}
		});
}

function showError(error) {
	alert(error);
}



//2、解析并显示菜单数据
function build_menuName_table2(result){
	//清空table表格
	$("#showMenuInfo_table tbody").empty();
	var emps = result.pageInfo.list;
	$.each(emps,function(index,item){
		var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
		
		var id = $("<td></td>").append(item.id);
		var name = $("<td></td>").append(item.name);
		var type = $("<td></td>").append(item.type=='1'?"菜单":"控制器的访问路径");
		var url = $("<td></td>").append(item.url);
		var parentId = $("<td></td>").append(item.parentid=='0'?"<span>顶层菜单</span>":"子菜单");

		var count = $("<td></td>").append(item.chirdenCount);
		

		var delBtn =  $("<button onclick='toChooseParentId("+item.id+")'></button>")
						.append($("<span></span>").addClass("glyphicon glyphicon-ok-sign"));
		
		delBtn.addClass("btn btn-primary btn-sm").append("确定");
		
						
		//为删除按钮添加一个自定义的属性来表示当前删除的员工id
		delBtn.attr("del-id",item.id);
		var btnTd = $("<td></td>").append(delBtn);
		
		//append方法执行完成以后还是返回原来的元素
		$("<tr></tr>").append(checkBoxTd)
			.append(id)
			.append(name)
			.append(type)
			.append(url)
			.append(parentId)
			.append(count)	
			.append(btnTd)
			.appendTo("#showMenuInfo_table tbody");
		

		//3、解析并显示分页信息
		build_page_info(result,"page_info_showMenuInfo");
		//4、解析显示分页条数据
		build_page_nav(result,"page_nav_showMenuInfo",4);
		
	});
};

</script>
