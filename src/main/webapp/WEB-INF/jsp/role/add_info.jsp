<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${path}/statics/js/returnCode.js"></script>

<!-- 添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">角色添加</h4>
			</div>
			<div class="modal-body">

				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">角色编号：</label>
						<div class="col-sm-10">							
							<input type="text" name="rolecode" class="form-control"
								id="proid_update_input" value="${item.rolecode}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名称：</label>
						<div class="col-sm-10">
							<input type="text" name="rolename" class="form-control"
								id="name_update_input" value="${item.rolename}">
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	//清空表单样式及内容
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	};
	
	//点击新增按钮弹出模态框。
	$("#stu_add_modal_btn").click(function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#empAddModal form");
		
		//弹出模态框
		$("#empAddModal").modal({
			backdrop:"static"
		}); 
	});
	
	
	
	//点击保存，保存员工。
	$("#stu_save_btn").click(function(){
				
		//3、发送ajax请求保存员工74
		$.ajax({
			url:"${APP_PATH}/sys/role/addShow",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){	
					$("#empAddModal").modal('hide');									
					to_page(totalRecord);
									
			}
		});
	});
	

</script>



