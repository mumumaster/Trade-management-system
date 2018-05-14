<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 供应商修改的模态框 -->
<div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">角色修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">商品编号：</label>
						<div class="col-sm-10">
							<!-- <p class="form-control-static" id="name_update_static"></p> -->
							<input type="text" name="rolecode" class="form-control"
								id="rolecode_update_input" value="${item.rolecode}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名称：</label>
						<div class="col-sm-10">
							<input type="text" name="rolename" class="form-control"
								id="rolename_update_input" value="${item.rolename}">
						</div>
					</div>
					

					<!-- <div class="form-group">
						<label class="col-sm-2 control-label">地址：</label>
						<div class="col-sm-4">
							部门提交部门id即可
							<select class="form-control" name="classid">
							</select>
						</div>
					</div> -->
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	//1、我们是按钮创建之前就绑定了click，所以绑定不上。
	//a）、可以在创建按钮的时候绑定。    b）、绑定点击.live()
	//jquery新版没有live，使用on进行替代
	
	//给编辑按钮添加单击事件
	$(document).on("click", ".edit_btn", function() {		
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#stuUpdateModal form");

		//1、查出部门信息，并显示部门列表（方法在add_info.jsp中）
		//getClasses("#stuUpdateModal select");
		
		//2、查出员工信息，显示员工信息
		getProvider($(this).attr("edit-id"));//edit-id是在showInfo.jsp中为编辑按钮添加的自定义属性

		//3、把员工的id传递给模态框的更新按钮
		$("#stu_update_btn").attr("edit-id", $(this).attr("edit-id"));
		
		//4.打开修改模态框 
		$("#stuUpdateModal").modal({
			backdrop : "static"
		});
	});

	//根据Id查询学生信息
	function getProvider(id) {	
		$.ajax({
			url : "${APP_PATH}/sys/role/select?id="+ id,
			type : "GET",
			 success : function(result) {
				console.log(result);
				var role = result.extend.role;
				//这是设置姓名不可修改的显示
				$("#rolecode_update_input").val(role.rolecode);
				
				//把查询到的学生信息显示到修改页面
				$("#rolename_update_input").val(role.rolename);
			} 
		});
	}

	//点击更新，更新员工信息
	$("#stu_update_btn").click(function() {

		//发送ajax请求保存更新的员工数据
		$.ajax({
			url : "${APP_PATH}/sys/role/update/" + $(this).attr("edit-id"),
			type : "PUT",
			data : $("#stuUpdateModal form").serialize(),
			success : function(result) {
				//alert(result.msg);
				//1、关闭对话框
				$("#stuUpdateModal").modal("hide");
				//2、回到本页面
				to_page(currentPage);
			}
		});
	});
</script>



