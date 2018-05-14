
<!-- 这是登录成功后的主页面 -->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH}/statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${APP_PATH}/statics/js/JsonpAjax.js"></script>


<style type="text/css">
#word {
	position: absolute;
	z-index: 99;
	width: 145px;
	height: auto;
	background-color: white;
	border: black solid 1px;
	display: none;
}

.click_work {
	padding-bottom: 8px;
	font-weight: lighter;
	font-size: 13px;
	cursor: pointer; /*鼠标放上变成小手*/
}

.click_work:hover {
	color: orange;
	background-color: gray;
}

.error {
	color: gray;
	cursor: pointer; /*鼠标放上变成小手*/
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		/*$("#showDetail").click(function() {
		 $('#menuDetail').modal('toggle');
		 }) */
	})
</script>
<!-- Large modal -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" style="display: none;"
	id="menuDetail">
	<div class="modal-dialog modal-lg" role="document"
		style="width: 1269px;">
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
					<div class="col-md-8 col-md-offset-1">
						<form class="form-inline">
							<span class="form-group"> 
								<label for="menuChirdenName">名称:</label>
								<input type="text" class="form-control" id="menuChirdenName"
								placeholder="menuChirdenName">
								<label for="menuChirdenUrl">资源访问地址:</label> <input
								type="text" class="form-control" id="menuChirdenUrl"
								placeholder="menuChirdenUrl">
							</span>
							<div class="btn btn-primary glyphicon glyphicon-search"
								id="select_menuChirdenName_btn" onclick="gotoPage(1,3)">查询</div>
						</form>
					</div>
					<div>
						<button class="btn btn-primary glyphicon glyphicon-plus add_btn"
							id="add_menuChirdenName_btn">新增</button>
						<button onclick="toChanageAvailable(3,0)"
							class="btn btn-danger delete_btn glyphicon glyphicon-off"
							id="disable_menuChirdenName_all_btn">禁用</button>
						<button onclick="toChanageAvailable(3,1)"
							class="btn btn-primary glyphicon glyphicon-off"
							id="enable_menuChirdenName_all_btn">启用</button>
					</div>
				</div>
				<!-- 分类 -->
				<div class="row">
					<div class="col-md-12">
						<h3>菜单子项</h3>
					</div>
				</div>
				<!-- 显示表格数据 -->
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover" id="menuChirdenName_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check_all" /><input 
									type="hidden" id="menuChirdenNameParentId"/></th>
									<th>资源名称</th>
									<th>资源的类型</th>
									<th>资源访问路径</th>
									<th>菜单的类型</th>
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
					<h2 class="col-md-6" id="page_info_menuChirdenName"
						style="font-size: 26px;"></h2>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="page_nav_menuChirdenName"></div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>资源管理</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-8 col-md-offset-1">
			<form class="form-inline">
				<span class="form-group"> 
					<label for="menuName">名称:</label> <input
					type="text" class="form-control" id="menuName"
					placeholder="menuName">
					<label for="menuUrl">资源访问地址:</label> <input
					type="text" class="form-control" id="menuUrl"
					placeholder="menuUrl">
				</span>
				<div class="btn btn-primary glyphicon glyphicon-search"
					id="select_menuName_btn" onclick="gotoPage(1,1)">查询</div>
			</form>
		</div>
		<div>
			<button class="btn btn-primary glyphicon glyphicon-plus add_btn"
				id="add_menuName_btn">新增</button>
			<button onclick="toChanageAvailable(1,0)"
				class="btn btn-danger  glyphicon glyphicon-off"
				id="disable_menuName_all_btn">禁用</button>
			<button onclick="toChanageAvailable(1,1)"
				class="btn btn-primary  glyphicon glyphicon-off"
				id="enable_menuName_all_btn">启用</button>
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
			<table class="table table-hover" id="menuName_table">
				<thead>
					<tr>
						<th><input type="checkbox" id="check_all" /><input type="hidden" id="toShowChirdenDetail"/></th>
						<th>资源名称</th>
						<th>资源的类型</th>
						<th>资源访问路径</th>
						<th>菜单的类型</th>
						<th>子项的数目</th>
						<th>查看子项</th>
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
		<h2 class="col-md-6" id="page_info_menuName" style="font-size: 26px;"></h2>
		<!-- 分页条信息 -->
		<div class="col-md-6" id="page_nav_menuName"></div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-8 col-md-offset-1">
			<form class="form-inline">
				<span class="form-group"> 
					<label for="controlName">名称:</label><input 
					type="text" class="form-control" id="controlName"
					placeholder="controlName"><label for="controlUrl">资源访问地址:</label><input
					type="text" class="form-control" id="controlUrl"
					placeholder="controlUrl">
				</span>
				<div class="btn btn-primary glyphicon glyphicon-search"
					id="select_controlName_btn" onclick="gotoPage(1,2)">查询</div>
			</form>
		</div>
		<div>
			<button class="btn btn-primary glyphicon glyphicon-plus add_btn"
				id="add_controlName_btn">新增</button>
			<button onclick="toChanageAvailable(2,0)"
				class="btn btn-danger delete_btn glyphicon glyphicon-off"
				id="disable_controlName_all_btn">禁用</button>
			<button onclick="toChanageAvailable(2,1)"
				class="btn btn-primary glyphicon glyphicon-off"
				id="enable_controlName_all_btn">启用</button>

		</div>
	</div>
	<!-- 分类 -->
	<div class="row">
		<div class="col-md-12">
			<h3>控制器的访问路径</h3>
		</div>
	</div>
	<!-- 显示表格数据 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" id="controlName_table">
				<thead>
					<tr>
						<th><input type="checkbox" id="check_all2" /></th>
						<th>资源名称</th>
						<th>资源的类型</th>
						<th>资源访问路径</th>
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
		<h2 class="col-md-6" id="page_info_controlName"
			style="font-size: 26px;"></h2>
		<!-- 分页条信息 -->
		<div class="col-md-6" id="page_nav_controlName"></div>
	</div>
</div>


<!-- 解析并显示员工数据 -->
<jsp:include page="show/showInfo.jsp"></jsp:include>
<jsp:include page="modify/modify_info.jsp"></jsp:include>
<jsp:include page="pageInfo/build_page_info.jsp"></jsp:include>
<!-- 解析显示分页条数据 -->
<jsp:include page="pageInfo/build_page_nav.jsp"></jsp:include>
<jsp:include page="delete/delete_info.jsp"></jsp:include>
<%-- 	<%@include file="user/showInfo.jsp"%>
	<!-- 解析并显示分页信息 -->
	<%@include file="pageInfo/build_page_info.jsp"%>
	<!-- 解析显示分页条数据 -->
	<%@include file="pageInfo/build_page_nav.jsp"%>
	<!-- 学生添加的模态框 -->
	<%@include file="user/add/add_info.jsp"%>
	<!-- 学生修改的模态框  -->
	<%@include file="user/modify/modify_info.jsp"%>
	<!-- 学生删除的模态框  -->
	<%@include file="user/delete/delete_info.jsp"%>  --%>


<br />
<br />
<br />
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>



