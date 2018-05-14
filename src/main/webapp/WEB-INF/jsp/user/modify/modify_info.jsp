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
				<h4 class="modal-title">用户修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
				
				  <!-- 开始  -->	
				  <div class="form-group">
				    <label class="col-sm-2 control-label">编号：</label>
				    <div class="col-sm-10">
				      <input type="text" name="usercode" class="form-control" id="usercode_update_input" placeholder="usercode">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">姓名：</label>
				    <div class="col-sm-10">
				      <input type="text" name="username" class="form-control" id="username_update_input" placeholder="username">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">密码：</label>
				    <div class="col-sm-10">
				      <input type="text" name="userpassword" class="form-control" id="userpassword_update_input" placeholder="userpassword">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">性别：</label>
				    <div class="col-sm-10">
				      <label class="radio-inline">
						  <input type="radio" name="gender" id="gender1_update_input" value="2" checked="checked"> 男
						</label>
						<label class="radio-inline">
						  <input type="radio" name="gender" id="gender2_update_input" value="1"> 女
						</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">出生日期：</label>
				    <div class="col-sm-10">
				      <input type="text" name="birthday" class="form-control" id="birthday_update_input" placeholder="请输入出生日期">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">角色名称：</label>
				    <div class="col-sm-4">
				    	<!-- 部门提交部门id即可 -->
				      <select class="form-control" name="userrole">
				      </select>
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
		reset_form("#stuUpdateModal form");

		//1、查出部门信息，并显示部门列表（方法在add_info.jsp中）
		getClasses("#stuUpdateModal select");
		
		//2、查出员工信息，显示员工信息
		getStudent($(this).attr("edit-id"));//edit-id是在showInfo.jsp中为编辑按钮添加的自定义属性

		//3、把员工的id传递给模态框的更新按钮
		$("#stu_update_btn").attr("edit-id", $(this).attr("edit-id"));
		
		//4.打开修改模态框 
		$("#stuUpdateModal").modal({
			backdrop : "static"
		});
	});

	//根据Id查询学生信息
	function getStudent(id) {					
		$.ajax({			
			url : "${APP_PATH}/sys/user/select/" + id,
			type : "GET",
			success : function(result) {
				console.log(result);
				var user = result.extend.user;
				//这是设置姓名不可修改的显示
				//$("#name_update_static").text(student.name);
				
				//把查询到的学生信息显示到修改页面
				$("#usercode_update_input").val(user.usercode);				
				$("#username_update_input").val(user.username);				
				$("#userpassword_update_input").val(user.userpassword);					
				$("#stuUpdateModal input[name=gender]").val([user.gender]);				
				$("#birthday_update_input").val(user.birthdayStr);				
				$("#stuUpdateModal select").val([user.userrole]);
			}
		});
	}

	//点击更新，更新员工信息
	$("#stu_update_btn").click(function() {
		//验证邮箱是否合法
		
		//1.校验编号
		var usercode = $("#usercode_update_input").val();
		var regEmail = /^[a-zA-Z][a-zA-Z0-9_-]{5,16}$/;
		if(!regEmail.test(usercode)){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#usercode_update_input", "error", "编号必须是以英文字母开头6-16位数字和字母的组合");
			return false;
		}else{
			show_validate_msg("#usercode_update_input", "success", "编号可以使用");
		}
		
		
		//2、校验密码
		var userpassword = $("#userpassword_update_input").val();
		var regEmail = /^[a-zA-Z][a-zA-Z0-9_-]{5,16}$/;
		if(!regEmail.test(userpassword)){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#userpassword_update_input", "error", "密码必须是以英文字母开头6-16位数字和字母的组合");
			return false;
		}else{
			show_validate_msg("#userpassword_update_input", "success", "密码可以使用");
		}
		
		//3、校验出生日期
		var birthday = $("#birthday_update_input").val();
		var regEmail = /^((19\d{2})|(20\d{2}))-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/;
		if(!regEmail.test(birthday)){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#birthday_update_input", "error", "日期格式不正确");
			return false;
		}else{
			show_validate_msg("#birthday_update_input", "success", "日期可以使用");
		}
		
		//4、判断之前的ajax用户名校验是否成功。如果成功。(Ajax校验)
		if($(this).attr("ajax-va")=="error"){
			return false;
		}; 

		//2、发送ajax请求保存更新的员工数据
		$.ajax({
			url : "${APP_PATH}/sys/user/update/" + $(this).attr("edit-id"),
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



