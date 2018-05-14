
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


<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>分配资源</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-8 col-md-offset-1">
			<form class="form-inline">
				<span class="form-group"> <label for="resName">名称:</label> <input
					type="text" class="form-control" id="resName" placeholder="resName">
					<label for="resUrl">资源访问地址:</label> <input type="text"
					class="form-control" id="resUrl" placeholder="resUrl"> <label
					for="resType">类型:</label> <select id="resType" name="type"
					class="form-control">
						<option value="0">全部</option>
						<option value="1">菜单类型</option>
						<option value="2">控制器访问路径</option>
				</select> <br /> <br /> <label for="rjAvailable">角色-资源是否可用:</label><select
					id="rjAvailable" name="rjAvailable" style="margin: 0px;"
					class="form-control">
						<option value="1">可用的角色资源</option>
						<option value="0">被禁用的角色资源</option>
				</select> <label for="resAvailable">资源是否可用:</label><select id="resAvailable"
					name="isavailable" style="margin: 0px;" class="form-control">
						<option value="1">可用的资源</option>
						<option value="0">被禁用的资源</option>
				</select> <label for="resHave">根据前面条件取反:</label><select id="resHave"
					name="have" class="form-control">
						<option value="1">已拥有的资源</option>
						<option value="2">未拥有的资源</option>
				</select>
				</span>
				<div class="btn btn-primary glyphicon glyphicon-search"
					id="select_resInfo_btn" onclick="gotoPage(1,1)">查询</div>
			</form>
		</div>
		<div class="col-md-offset-8">
			<button onclick="toChanageAvailable(1,0)"
				class="btn btn-primary glyphicon glyphicon-off"
				id="disable_rjInfo_all_btn">批量分配</button>
			<button onclick="toChanageAvailable(1,1)"
				class="btn btn-primary  glyphicon glyphicon-off"
				id="enable_rjInfo_all_btn">批量启用</button>
			<button onclick="toChanageAvailable(1,0)"
				class="btn btn-danger  glyphicon glyphicon-off"
				id="disable_rjInfo_all_btn">批量禁用</button>
			<br /> (批量禁/启用操作不会使未拥有的资源变成已拥有的,要分配资源还是要使用分配按钮)
		</div>
	</div>

	<!-- 分类 -->
	<div class="row">
		<div class="col-md-3">
			<strong style="font-size: 24px; margin: 10px;">角色</strong>
		</div>
		<div class="col-md-9" id="rjTop">
			<strong style="font-size: 24px; margin: 10px; float: left;">资源</strong>
		</div>
	</div>
	<!-- 显示表格数据 -->
	<div class="row">
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="roleInfo_table">
						<thead>
							<tr>
								<th><input type="checkbox" id="check_all" /><input
									type="hidden" id="roleInfoId" /></th>
								<th>角色名称</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!--分页文字信息  -->
						<h2 class="col-md-12" id="page_info_role" style="font-size: 26px;"></h2>
						<!-- 分页条信息 -->
						<div class="col-md-12" id="page_nav_role"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="resInfo_table">
						<thead>
							<tr>
								<th><input type="checkbox" id="check_all" /><input
									type="hidden" id="roleInfoId" /></th>
								<th>资源名称</th>
								<th>资源的类型</th>
								<th>资源访问路径</th>
								<th>菜单的类型</th>
								<th>子项的数目</th>
								<th>查看子项</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="row" id="rjFoot">
					<!-- 显示分页信息 -->
					<div class="col-md-12">
						<!--分页文字信息  -->
						<h2 class="col-md-6" id="page_info_rjInfo"
							style="font-size: 26px;"></h2>
						<!-- 分页条信息 -->
						<div class="col-md-6" id="page_nav_rjInfo"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>


<!-- 解析并显示员工数据 -->
<jsp:include page="show/showInfo.jsp"></jsp:include>
<%-- <jsp:include page="modify/modify_info.jsp"></jsp:include> --%>
<jsp:include page="pageInfo/build_page_info.jsp"></jsp:include>
<!-- 解析显示分页条数据 -->
<jsp:include page="pageInfo/build_page_nav.jsp"></jsp:include>
<%-- <jsp:include page="delete/delete_info.jsp"></jsp:include> --%>
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



