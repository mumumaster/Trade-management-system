var roleObj;

function deleteRole(obj){
	$.ajax({
		type:"GET",
		url:path+"/sys/role/delrole.json",
		data:{id:obj.attr("roleid")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){//删除失败
				//alert("对不起，删除用户【"+obj.attr("username")+"】失败");
				changeDLGContent("对不起，删除角色【"+obj.attr("rolename")+"】失败,该角色被系统用户引用！");
			}else if(data.delResult == "notexist"){
				//alert("对不起，用户【"+obj.attr("username")+"】不存在");
				changeDLGContent("对不起，角色【"+obj.attr("rolename")+"】不存在");
			}
		},
		error:function(data){
			//alert("对不起，删除失败");
			changeDLGContent("对不起，删除失败");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeRole').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeRole').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	
	$(".modifyRole").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/sys/role/modify/"+ obj.attr("roleid");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteRole(roleObj);
	});

	$(".deleteRole").on("click",function(){
		roleObj = $(this);
		changeDLGContent("你确定要删除角色【"+roleObj.attr("rolename")+"】吗？");
		openYesOrNoDLG();
	});
	
});