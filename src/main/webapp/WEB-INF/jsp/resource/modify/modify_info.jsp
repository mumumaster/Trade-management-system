<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="${path}/statics/js/returnCode.js"></script>



<!-- 编号，姓名，密码，性别，出生日期 ，角色名称 -->
<!-- 员工修改的模态框 -->
<div class="modal fade" id="menuUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="usMessage">资源修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="modifyResourceInfoForm">
				
				  <!-- 开始  -->	
				  <div class="form-group">
				    <label class="col-sm-2 control-label">资源名称：</label>
				    <div class="col-sm-10">
				      <input type="text" name="name" class="form-control" id="menu_name_update_input" placeholder="resourceName">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">资源的类型：</label>
				    <div class="col-sm-10">
				      <select class="form-control" name="type" id="menu_type_update_input">
				      	
				      </select>
	      			  <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">资源访问路径：</label>
				    <div class="col-sm-10">
				      <input type="text" name="url" class="form-control" id="menu_url_update_input" placeholder="resourceUrl">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">资源的类型：</label>
				    <div class="col-sm-10">
				    	<input type='hidden' id='hideParentId' value=""/>
				    	<select  class="form-control" name="menuParentType" id="menuParentType"></select>
			    		<!--<label class="radio-inline">
						  <input type="radio" name="menuParentType" id="noParent_update_input" value="1">控制器访问路径
						</label>
						<label class="radio-inline">
						  <input type="radio" name="menuParentType" id="topMenu_update_input" value="2">顶层菜单
						</label>
						<label class="radio-inline">
						  <input type="radio" name="menuParentType" id="chirdenMenu_update_input" value="3">菜单子项
						</label> -->
						<div class="input-group" style="display: none;" id="menuChirdenHide">
				          <input type="text" readonly="readonly" class="form-control" 
				          aria-label="Text input with multiple buttons" name="parentid" id="menu_chirdenMenuType_update_input" value="0">
				          <div class="input-group-btn">
				            <button  type="button" class="btn btn-primary glyphicon glyphicon-plus" id="parentIdChoose">选择上级菜单</button>
				          	<input type="hidden" id="toShowMenuInfoDetail"/>
				          </div>
				        </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">子项的数目：</label>
				    <div class="col-sm-10">
				      <input type="text" name="chirdenCount" class="form-control" id="menu_chirdenCount_update_input" readonly="true" placeholder="0">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  
				  <!-- 结束 -->
								
					
			</form>
			</div>
			<div class="modal-footer" id="updateFotter">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
$(function() {

	$('#showMenuInfoDetail').on('shown.bs.modal', function(e) {
		var id = $("#toShowMenuInfoDetail").val();
		$("#showMenuInfoId").val(id);
		to_page4(1,0,id);
	})
	$('#showMenuInfoDetail').on('hidden.bs.modal', function(e) {
		
	})
	$("#menuParentType").bind("change",function(){
	 	var dataName = $(this).val();
		var hideInfo = $("#menuChirdenHide");
		var chirdenMenu = $("#menu_chirdenMenuType_update_input");
		var parentIdHide = $("#hideParentId").val();
	 	if(dataName ==="3"){
			showChirdenMenuType(-1);
			hideInfo.css({"display":"none"})
	 	}else if(dataName ==="1"){
			showChirdenMenuType(0);
			hideInfo.css({"display":"none"})
	 	}else if(dataName ==="2"){
			hideInfo.css({"display":"table"})
			var parentIdChoose = $("#parentIdChoose");
			if(parentIdHide > "0"){
				parentIdChoose.attr("onclick","toShowParentIdChooseInfo("+parentIdHide+")")
				chirdenMenu.val(parentIdHide);
			}else{
				parentIdChoose.attr("onclick","toShowParentIdChooseInfo(0)")
				chirdenMenu.val("0");
			}
	 	}
	});
});
function toShowParentIdChooseInfo(id) {
	$("#toShowMenuInfoDetail").val(id)
	$('#showMenuInfoDetail').modal('toggle');

}
	//1、我们是按钮创建之前就绑定了click，所以绑定不上。
	//a）、可以在创建按钮的时候绑定。    b）、绑定点击.live()
	//jquery新版没有live，使用on进行替代
	
	function reset_form(ele){
		$(ele)[0].reset();
	/* 	$("#noParent_update_input").removeAttr("checked");
		$("#topMenu_update_input").removeAttr("checked");
		$("#chirdenMenu_update_input").removeAttr("checked"); */
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
		return true;
	};
	//给编辑按钮添加单击事件
	$(document).on("click", ".edit_btn", function() {		

		//清除表单数据（表单完整重置（表单的数据，表单的样式））
 	/* 	reset_form("#stuUpdateModal form");

		//1、查出部门信息，并显示部门列表（方法在add_info.jsp中）
		getClasses("#stuUpdateModal select"); */
		if(reset_form('#modifyResourceInfoForm')){
			//$("#noParent_update_input").attr("checked",true);
			//$("#noParent_update_input").removeAttr("checked");
			showType();
			showParentType();
			//2、查出员工信息，显示员工信息
			$("#usMessage").html("资源修改");
			$("#res_update_btn").remove();
			$("#res_add_btn").remove();
			var uptdate = "<button type='button' class='btn btn-primary' edit-id='' id='res_update_btn'>更新</button>"
			$("#updateFotter").append(uptdate);
			var editId = $(this).attr("edit-id");
			$("#res_update_btn").attr("edit-id",editId)
			getResource(editId);//edit-id是在showInfo.jsp中为编辑按钮添加的自定义属性
			//getResource(4);
			//3、把员工的id传递给模态框的更新按钮
			/* $("#stu_update_btn").attr("edit-id", $(this).attr("edit-id"));
			 */ 
			//4.打开修改模态框 
			$('#menuUpdateModal').modal('toggle');
			
		}
	});

	
	$(document).on("click", ".add_btn", function() {		

		//清除表单数据（表单完整重置（表单的数据，表单的样式））
 	/* 	reset_form("#stuUpdateModal form");

		//1、查出部门信息，并显示部门列表（方法在add_info.jsp中）
		getClasses("#stuUpdateModal select"); */
		if(reset_form('#modifyResourceInfoForm')){
			//$("#noParent_update_input").attr("checked",true);
			//$("#noParent_update_input").removeAttr("checked");
			showType();
			showParentType();
			//2、查出员工信息，显示员工信息
			//<button type="button" class="btn btn-primary" edit-id="" id="res_update_btn">更新</button>
			//<button type="button" hidden="hidden" class="btn btn-primary"  id="res_add_btn">新增</button>
			$("#usMessage").html("新增资源");
			$("#res_add_btn").remove();
			$("#res_update_btn").remove();
			var add = "<button type='button' class='btn btn-primary'  id='res_add_btn'>新增</button>"
			$("#updateFotter").append(add);
			//getResource(editId);//edit-id是在showInfo.jsp中为编辑按钮添加的自定义属性
			//getResource(4);
			//3、把员工的id传递给模态框的更新按钮
			/* $("#stu_update_btn").attr("edit-id", $(this).attr("edit-id"));
			 */ 
			//4.打开修改模态框 
			$('#menuUpdateModal').modal('toggle');
			
		}
	});
	
	$(document).on("click", "#res_update_btn", function() {
		//2、发送ajax请求保存更新的员工数据
		$.ajax({
			url : "${path}/sys/resource/update/" + $(this).attr("edit-id"),
			type : "PUT",
			data : $("#modifyResourceInfoForm").serialize(),
			success : function($data) {
				if(checkDataCode($data)){
					alert("更新成功")
					var pageGo = $("#page_nav_controlName #page").val();
					if(pageGo ===""){
						pageGo = $("#page_nav_controlName #page").attr("placeholder");
					}
					to_page1(pageGo);
					var pageGo = $("#page_nav_menuName #page").val();
					if(pageGo ===""){
						pageGo = $("#page_nav_menuName #page").attr("placeholder");
					}
					to_page2(pageGo);
					var parentId = $("#menuChirdenNameParentId").val();
					parentId = $.trim(parentId);
					if(parentId != null && parentId !=""){
						var pageGo = $("#page_nav_menuChirdenName #page").val();
						if(pageGo ===""){
							pageGo = $("#page_nav_menuChirdenName #page").attr("placeholder");
						}
						to_page3(pageGo,parentId);
					}
					$('#menuUpdateModal').modal('toggle');
				}
			}
		});
	});
	$(document).on("click", "#res_add_btn", function() {
		//2、发送ajax请求保存更新的员工数据
		$.ajax({
			url : "${path}/sys/resource/add",
			type : "PUT",
			data : $("#modifyResourceInfoForm").serialize(),
			success : function($data) {
				if(checkDataCode($data)){
					alert("新增成功")
					var pageGo = $("#page_nav_controlName #page").val();
					if(pageGo ===""){
						pageGo = $("#page_nav_controlName #page").attr("placeholder");
					}
					to_page1(pageGo);
					var pageGo = $("#page_nav_menuName #page").val();
					if(pageGo ===""){
						pageGo = $("#page_nav_menuName #page").attr("placeholder");
					}
					to_page2(pageGo);
					var parentId = $("#menuChirdenNameParentId").val();
					parentId = $.trim(parentId);
					if(parentId != null && parentId !=""){
						var pageGo = $("#page_nav_menuChirdenName #page").val();
						if(pageGo ===""){
							pageGo = $("#page_nav_menuChirdenName #page").attr("placeholder");
						}
						to_page3(pageGo,parentId);
					}
					$('#menuUpdateModal').modal('toggle');
				}
			}
		});
	});
	function showParentType() {
		$("#menuParentType").empty();
		$("#menuParentType").append("<option value ='1'>顶层菜单</option>")
		.append("<option value ='2'>菜单子项</option>")
		.append("<option value ='3'>控制器访问路径</option>");
	}
	function showType() {
		$("#menu_type_update_input").empty();
		$("#menu_type_update_input").append("<option value ='1'>菜单类型</option>")
		.append("<option value ='2'>控制器访问路径</option>");
	}
	function showChirdenMenuType(type) {
		$("#menu_chirdenMenuType_update_input").val(type)
	}
	//根据Id查询学生信息
	function getResource(id) {	
		var args = {
				"id" : id,
				"time" : new Date()
			};
		$.ajax({			
			url : "${path}/sys/resource/getResourceInfoByAnything",
			data : args,
			type : "POST",
			success : function($data) {
				console.log($data);
				if(checkDataCode($data)){
					var res = $data.list;
					//这是设置姓名不可修改的显示
					//$("#name_update_static").text(student.name);
					$.each(res,function(index,item){
					//把查询到的学生信息显示到修改页面
						$("#menu_name_update_input").val(item.name);				
						$("#menu_type_update_input").val([item.type]);				
						$("#menu_url_update_input").val(item.url);		
						var hideInfo = $("#menuChirdenHide");
						//$("#menu_chirdenMenuType_update_input select").val(item.parentid);
						//var menuType = $("#menuUpdateModal input[name=menuParentType]");
						var menuType = $("#menuParentType");
						var chirdenMenu = $("#menu_chirdenMenuType_update_input");
						if(item.parentid === -1){
							//menuType.eq(0).attr("checked",'true');
							menuType.val("3");
							showChirdenMenuType(-1);
							hideInfo.css({"display":"none"})
						}else if(item.parentid === 0){
							//menuType.eq(1).attr("checked",'true');
							menuType.val("1");
							showChirdenMenuType(0);
							hideInfo.css({"display":"none"})
						}else{
							//menuType.eq(2).attr("checked",'true');
							menuType.val("2");
							hideInfo.css({"display":"table"})
							var parentIdChoose = $("#parentIdChoose");
							parentIdChoose.attr("onclick","toShowParentIdChooseInfo("+item.parentid+")")
						}
						$("#hideParentId").val(item.parentid);
						chirdenMenu.val(item.parentid);
						$("#menu_chirdenCount_update_input").val([ item.chirdenCount ]);
					});
				}
			}
		});
	}


	

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


<jsp:include page="../show/showMenuInfo.jsp"></jsp:include>

