
<!-- 这是登录成功后的主页面 -->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>

	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>
	<script type="text/javascript" src="${APP_PATH}/statics/js/jquery-1.12.4.js"></script>			

	<div class="container" id="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>订单管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-5">
				<form class="form-inline">
					<span class="form-group"> <label for="name">订单编号:</label> <input
						type="text" class="form-control" id="name" placeholder="Name">
						</sapn>
						<div class="btn btn-info glyphicon glyphicon-search"
							id="emp_select_modal_btn">查询</div>
				</form>
			</div class="col-md-3">
			<div>				
				<button class="btn btn-warning glyphicon glyphicon-plus"
					id="stu_add_modal_btn">新增</button>
				<button class="btn btn-danger glyphicon glyphicon-trash"
					id="stu_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row" id="print">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>订单编号</th>
							<th>供应商名称</th>
							<th>总消费</th>
							<th>订单状态</th>
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
			<h2 class="col-md-6" id="page_info_area" style="font-size: 26px;"></h2>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>

	</div>
	

	<!-- 解析并显示员工数据 -->
	<%@include file="bill/showInfo.jsp"%>
	<!-- 解析并显示分页信息 -->
	<%@include file="pageInfo/build_page_info.jsp"%>
	<!-- 解析显示分页条数据 -->
	<%@include file="pageInfo/build_page_nav.jsp"%>
	<!-- 添加的模态框 -->
	<%@include file="bill/add/add_info.jsp"%> 
	<!-- 修改的模态框  -->
	<%@include file="bill/modify/modify_info.jsp"%>
	<!-- 删除的模态框  -->
	<%@include file="bill/delete/delete_info.jsp"%>  


<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
