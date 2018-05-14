var roleName = null;
var saveBtn = null;
var backBtn = null;


$(function(){
	roleName = $("#roleName");
	saveBtn = $("#save");
	backBtn = $("#back");

	roleName.on("focus",function(){
		validateTip(roleName.next(),{"color":"#666666"},"* 用户名长度必须是大于1小于10的字符",false);
	}).on("blur",function(){
		if(roleName.val() != null && roleName.val().length > 1 
				&& roleName.val().length < 10){
			validateTip(roleName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(roleName.next(),{"color":"red"},imgNo+" 用户名输入的不符合规范，请重新输入",false);
		}
		
	});
	
	saveBtn.on("click",function(){
		roleName.blur();
		if(roleName.attr("validateStatus") == "true"){
			if(confirm("是否确认要提交数据？")){
				$("#roleForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		//alert("modify: "+referer);
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});