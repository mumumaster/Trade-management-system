<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 订单编号，供应商，订单状态 -->
<!-- 修改的模态框 -->
<div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">订单修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
				
				  <!-- 开始  -->	
				  <div class="form-group">
				    <label class="col-sm-2 control-label">订单编号：</label>
				    <div class="col-sm-10">
				      <input type="text" name="orderid" class="form-control" id="orderid_update_input" placeholder="orderid">
				      <span class="help-block"></span>
				    </div>
				  </div>		  		  				
				  <div class="form-group">
				    <label class="col-sm-2 control-label">供应商：</label>
				    <div class="col-sm-4">
				    	<!-- 部门提交部门id即可 -->
				      <select class="form-control provider" name="providerid" style="width:455px;">
				      </select>
				    </div>
				  </div>
				   <div class="form-group">
				    <label class="col-sm-2 control-label">订单状态：</label>
				    <div class="col-sm-4">
				    	<!-- 部门提交部门id即可 -->
				      <select class="form-control status" name="ispayment" style="width:455px;">
				      </select>
				    </div>
				  </div>	
				  <!-- 结束 -->
								
					
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="update_btn">更新</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
		
	//给编辑按钮添加单击事件
	$(document).on("click", ".edit_btn", function() {		
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#stuUpdateModal form");

		//1、查出部门信息，并显示部门列表（方法在add_info.jsp中）
		//绑定供应商
		getProvider("#stuUpdateModal .provider");
		
		//绑定订单状态
		getStatus("#stuUpdateModal .status");
						
		//2、查出员工信息，显示员工信息
		getBill($(this).attr("edit-id"));//edit-id是在showInfo.jsp中为编辑按钮添加的自定义属性

		//3、把员工的id传递给模态框的更新按钮
		$("#update_btn").attr("edit-id", $(this).attr("edit-id"));
		
		//4.打开修改模态框 
		$("#stuUpdateModal").modal({
			backdrop : "static"
		});
	});

	//根据Id查询订单信息
	function getBill(id) {					
		$.ajax({			
			url : "${APP_PATH}/sys/bill/select/" + id,
			type : "GET",
			success : function(result) {
				console.log(result);
				var bill = result.extend.bill;
				//这是设置姓名不可修改的显示
				//$("#name_update_static").text(student.name);
				
				//把查询到的学生信息显示到修改页面
				$("#orderid_update_input").val(bill.orderid);									
								
				$("#stuUpdateModal .provider").val([ bill.providerid]);
				
				$("#stuUpdateModal .status").val([ bill.ispayment]);
			}
		});
	}

	//点击更新，更新订单信息
	$("#update_btn").click(function() {
		//验证邮箱是否合法
		
		//1.校验编号
		/* 
		var orderid = $("#orderid_update_input").val();
		var regOrderid = /^[a-zA-Z][a-zA-Z0-9_-]{5,16}$/;
		if(!regOrderid.test(orderid)){			
			//应该清空这个元素之前的样式
			show_validate_msg("#orderid_update_input", "error", "订单编号必须是以英文字母开头6-16位数字和字母的组合");
			return false;
		}else{
			show_validate_msg("#orderid_update_input", "success", "订单编号可以使用");
		}
		 */
		
		
		
		//4、判断之前的ajax用户名校验是否成功。如果成功。(Ajax校验)
		if($(this).attr("ajax-va")=="error"){
			return false;
		}; 

		//2、发送ajax请求保存更新的员工数据
		$.ajax({
			url : "${APP_PATH}/sys/bill/update/" + $(this).attr("edit-id"),
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
	

	//校验订单编号是否可用(Ajax校验)
	$("#orderid_update_input").change(function(){
		//发送ajax请求校验用户名是否可用
		var name = this.value;
		$.ajax({
			url:"${APP_PATH}/sys/bill/checkorderid",
			data:"name="+name,
			type:"POST",
			success:function(result){
				if(result.code==100){
					show_validate_msg("#orderid_update_input","success","订单编号可用");
					$("#update_btn").attr("ajax-va","success");
				}else{
					show_validate_msg("#orderid_update_input","error",result.extend.va_msg);
					$("#update_btn").attr("ajax-va","error");
				}
			}
		});
	});
	
</script>



