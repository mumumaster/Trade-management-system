<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document" >
    <div class="modal-content" >
      <div class="modal-header" >
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">  
                   
          <div class="form-group">
		    <label class="col-sm-2 control-label">订单编号：</label>
		    <div class="col-sm-10">
		      <input type="text" name="orderid" class="form-control" id="orderid_add_input" placeholder="orderid">
		      <span class="help-block"></span>
		    </div>
		  </div>		  		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">订单日期：</label>
		    <div class="col-sm-10">
		      <input type="text" Class="form-control Wdate" name="day"  id="day_add_input" readonly="readonly"
			onclick="WdatePicker();" style="height: 35px;">
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
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="save_btn">保存</button>
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
		//$("#empAddModal form")[0].reset();//只重置内容
		
		//绑定供应商
		getProvider("#empAddModal .provider");
		
		//绑定订单状态
		getStatus("#empAddModal .status");
		
		//弹出模态框
		$("#empAddModal").modal({
			backdrop:"static"
		}); 
	});
	
	//查出所有的订单状态信息并显示在下拉列表中（所有页面可以使用的）
	function getStatus(ele){		
		
		//清空之前下拉列表的值
		$(ele).empty();
		//请求地址
		var url = "${APP_PATH}/sys/bill/status";
		
		$.post(url,  function(result) {		
			console.log(result);
			//遍历集合元素绑定到下拉的班级框中
			$.each(result.extend.status,function(){
				var optionEle = $("<option></option>").append(this.name).attr("value",this.id);
				optionEle.appendTo(ele);
			});
		});
		
	};
	
	//查出所有的供应商信息并显示在下拉列表中（所有页面可以使用的）
	function getProvider(ele){
				
		//清空之前下拉列表的值
		$(ele).empty();
		//请求地址
		var url = "${APP_PATH}/sys/bill/prodiver";
		
		$.post(url,  function(result) {		
			console.log(result);
			//遍历集合元素绑定到下拉的供应商框中
			$.each(result.extend.provider,function(){
				var optionEle = $("<option></option>").append(this.proname).attr("value",this.id);
				optionEle.appendTo(ele);
			});
		});
		
	};
	
	//点击保存
	$("#save_btn").click(function(){
		
		//模态框中填写的表单数据提交给服务器进行保存
		
		//1、先对要提交给服务器的数据进行校验 (JQuery校验)
		/* if(!validate_add_form()){
			return false;
		};  */ 
		
		//2、判断之前的ajax用户名校验是否成功。如果成功。(Ajax校验)
		if($(this).attr("ajax-va")=="error"){
			return false;
		}; 
		
		//3、发送ajax请求保存
		$.ajax({
			url:"${APP_PATH}/sys/bill/save",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){
				//alert(result.msg);
				if(result.code == 100){					
					//1、关闭模态框
					$("#empAddModal").modal('hide');
					
					//2、来到最后一页，显示刚才保存的数据
					//发送ajax请求显示最后一页数据即可，totalRecord为总记录数保证为最后一页
					to_page(totalRecord);
				}else{
					//显示失败信息
					//console.log(result);
					//有哪个字段的错误信息就显示哪个字段的；
					if(undefined != result.extend.errorFields.orderid){
						//显示订单编号错误信息
						show_validate_msg("#orderid_add_input", "error", result.extend.errorFields.orderid);
					}
					if(undefined != result.extend.errorFields.name){
						//显示员工名字的错误信息
						show_validate_msg("#name_add_input", "error", result.extend.errorFields.name);
					}
					if(undefined != result.extend.errorFields.age){
						//显示员工年龄的错误信息
						show_validate_msg("#age_add_input", "error", "年龄必须大于1并且小于130");
					}
					if(undefined != result.extend.errorFields.telephone){
						//显示员工电话的错误信息
						show_validate_msg("#telephone_add_input", "error", result.extend.errorFields.telephone);
					}
				}
			}
		});
	});
	

</script>

<!-- 校验数据 -->
<script type="text/javascript">
//校验表单数据 (JQuery校验)
function validate_add_form(){
	//1、拿到要校验的数据，使用正则表达式(使用了Ajax验证，就不需要重复验证姓名了，不然验证已存在的用户，提交了显示还可以使用)
	/* var name = $("#name_add_input").val();
	var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
	if(!regName.test(name)){
		//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
		show_validate_msg("#name_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
		return false;
	}else{
		show_validate_msg("#name_add_input", "success", "姓名可以使用");
	}; */
	
	//1.校验编号
	var usercode = $("#usercode_add_input").val();
	var regEmail = /^[a-zA-Z][a-zA-Z0-9_-]{5,16}$/;
	if(!regEmail.test(usercode)){
		//alert("邮箱格式不正确");
		//应该清空这个元素之前的样式
		show_validate_msg("#usercode_add_input", "error", "编号必须是以英文字母开头6-16位数字和字母的组合");
		return false;
	}else{
		show_validate_msg("#usercode_add_input", "success", "编号可以使用");
	}
	
	
	//2、校验密码
	var userpassword = $("#userpassword_add_input").val();
	var regEmail = /^[a-zA-Z][a-zA-Z0-9_-]{5,16}$/;
	if(!regEmail.test(userpassword)){
		//alert("邮箱格式不正确");
		//应该清空这个元素之前的样式
		show_validate_msg("#userpassword_add_input", "error", "密码必须是以英文字母开头6-16位数字和字母的组合");
		return false;
	}else{
		show_validate_msg("#userpassword_add_input", "success", "密码可以使用");
	}
	
	//3、校验出生日期
	var birthday = $("#birthday_add_input").val();
	var regEmail = /^((19\d{2})|(20\d{2}))-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/;
	if(!regEmail.test(birthday)){
		//alert("邮箱格式不正确");
		//应该清空这个元素之前的样式
		show_validate_msg("#birthday_add_input", "error", "日期格式不正确");
		return false;
	}else{
		show_validate_msg("#birthday_add_input", "success", "日期可以使用");
	}
	
	return true;
}

//显示校验结果的提示信息（公用提示信息追加方法）
function show_validate_msg(ele,status,msg){
	//清除当前元素的校验状态
	$(ele).parent().removeClass("has-success has-error");
	$(ele).next("span").text("");
	if("success"==status){
		$(ele).parent().addClass("has-success");
		$(ele).next("span").text(msg);
	}else if("error" == status){
		$(ele).parent().addClass("has-error");
		$(ele).next("span").text(msg);
	}
}

//校验订单编号是否可用(Ajax校验)
$("#orderid_add_input").change(function(){
	//发送ajax请求校验用户名是否可用
	var name = this.value;
	$.ajax({
		url:"${APP_PATH}/sys/bill/checkorderid",
		data:"name="+name,
		type:"POST",
		success:function(result){
			if(result.code==100){
				show_validate_msg("#orderid_add_input","success","订单编号可用");
				$("#save_btn").attr("ajax-va","success");
			}else{
				show_validate_msg("#orderid_add_input","error",result.extend.va_msg);
				$("#save_btn").attr("ajax-va","error");
			}
		}
	});
});

</script>


	<!-- 日期控件使用到  -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/time.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/calendar/WdatePicker.js"></script>

  

