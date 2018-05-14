<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 编号，姓名，密码，性别，出生日期 ，角色名称 -->
<!-- 员工修改的模态框 -->
<div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">订单详细修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
				
				  <!-- 开始  -->	
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品编号：</label>
				    <div class="col-sm-10">
				      <input type="text" name="id" class="form-control" 
				      id="id_update_input" placeholder="id" readonly="readonly">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品名称：</label>
				    <div class="col-sm-10">
				      <input type="text" name="productname" class="form-control"
				       id="productname_update_input" readonly="readonly">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品单位：</label>
				    <div class="col-sm-10">
				      <input type="text" name="productunit" class="form-control"
				       id="productunit_update_input" placeholder="" readonly="readonly">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品数量：</label>
				    <div class="col-sm-10">
				      <input type="text" name="quantity" class="form-control"
				       id="quantity_update_input" placeholder="">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品单价：</label>
				    <div class="col-sm-10">
				      <input type="text" name="price" class="form-control"
				       id="price_update_input" placeholder="" readonly="readonly">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品总计：</label>
				    <div class="col-sm-4">
				    	<!-- 部门提交部门id即可 -->
				    	
				    	<input type="text" name="cost" class="form-control"
				       	id="sun_update_input" readonly="readonly">
				      <span class="help-block"></span>
				    	
					     
				    </div>
				  </div>
				  <!-- 结束 -->
								
					
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
		//reset_form("#stuUpdateModal form");

		//1、查出部门信息，并显示部门列表（方法在add_info.jsp中）
		//getClasses("#stuUpdateModal select");
		
		//2、查出员工信息，显示员工信息
		getStudent($(this).attr("edit-id"));//edit-id是在showInfo.jsp中为编辑按钮添加的自定义属性

		//3、把员工的id传递给模态框的更新按钮
		$("#stu_update_btn").attr("edit-id", $(this).attr("edit-id"));
		
		//4.打开修改模态框 
		$("#stuUpdateModal").modal({
			backdrop : "static"
		});
	});

	//根据Id查询修改信息
	function getStudent(id) {	
		var url="${APP_PATH}/sys/bill/selectBillDet?id="+id;
		/* var data="id="+id; */
		$.ajax({			
			url : url,
			/* data:data, */
			type : "GET",
			success : function(result) {
				console.log(result);
				var info = result.extend.info;
				
				//把查询到的商品信息显示到修改页面
				$("#id_update_input").val(info.id);
				$("#productname_update_input").val(info.productName);
				$("#productunit_update_input").val(info.productUnit);
				$("#quantity_update_input").val(info.quantity);
				$("#price_update_input").val(info.price);
				var price = (info.quantity) * (info.price);
				$("#sun_update_input").val(price);
				
			}
		});
	}

	//点击更新，更新员工信息
	$("#stu_update_btn").click(function() {
		
		//2、发送ajax请求保存更新的员工数据\
		$.ajax({
			url : "${APP_PATH}/sys/bill/updateBillDet/" + $(this).attr("edit-id"),
			data : $("#stuUpdateModal form").serialize(),
			type : "PUT",
			success : function(result) {
				//alert(result.msg);
				//1、关闭对话框
				$("#stuUpdateModal").modal("hide");
				//刷新订单信息
				var id = ${edit_id};
				getBill(id);
				
				//2、回到本页面
				to_page(currentPage);
			}
		});
	});
	
	//商品的总价随着商品的数量改变而改变
	$("#quantity_update_input").change(function() {
		var tt = $("#quantity_update_input").val();
		var ss = $("#price_update_input").val();
		var price =  tt*ss;
		//alert(price);
		$("#sun_update_input").val(price);			
	});
	
	
	//校验用户名是否可用(Ajax校验)
	$("#username_update_input").change(function(){
		//发送ajax请求校验用户名是否可用
		var name = this.value;
		$.ajax({
			url:"${APP_PATH}//sys/user/checkuser",
			data:"name="+name,
			type:"POST",
			success:function(result){
				if(result.code==100){
					show_validate_msg("#username_update_input","success","用户名可用");
					$("#stu_update_btn").attr("ajax-va","success");
				}else{
					show_validate_msg("#username_update_input","error",result.extend.va_msg);
					$("#stu_update_btn").attr("ajax-va","error");
				}
			}
		});
	});
	
</script>




