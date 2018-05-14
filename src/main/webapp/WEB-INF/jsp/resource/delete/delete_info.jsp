<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
//单个删除
function toChanageAvailable(code,disableCode) {
	if(code != null){
		if(disableCode != null){
			var checkId = null;
			if(code === 1){
				checkId = $("input[name='checkMenuNameId']:checked");
				checkItem(checkId,code,disableCode);
			}else if(code === 2){
				checkId = $("input[name='checkControlNameId']:checked");
				checkItem(checkId,code,disableCode);
			}else if(code === 3){
				checkId = $("input[name='checkMenuChirdenNameId']:checked");
				checkItem(checkId,code,disableCode);
			}
		}
	}
};

function checkItem(checkId,code,disableCode) {
	if (checkId.length == 0) {
		if(disableCode != null){
			if(disableCode === 0){
				alert("请选择禁用项");
			}else if(disableCode === 1){
				alert("请选择启用项");
			}
		}
	} else {
		toChangeResourceAvailableInfo(checkId,code,disableCode);
		return true;
	}
	return false;
}

	

function toChangeResourceAvailableInfo(checkId,code,disableCode) {
	var checkID = [];// 定义一个空数组
	checkId.each(function(i) {// 把所有被选中的复选框的值存入数组
		checkID[i] = $(this).val();
	});

	var args = {
			"checkId":checkID,
			"isavailable":disableCode,
			"time" : new Date()
		};
	ajaxChangeAvailable(args,code);
};

function toChangeResourceAvailableInfoById(id,code,disableCode) {
	var checkID = [];// 定义一个空数组
		checkID[0] = id;

	var args = {
			"checkId":checkID,
			"isavailable":disableCode,
			"time" : new Date()
		};
	ajaxChangeAvailable(args,code);
};
function ajaxChangeAvailable(args,code) {
	var url = "${path}/sys/resource/changeAvailable";
	$.post(url, args, function($data) {
		console.log($data);
		if(checkDataCode($data)){
			//alert("操作成功")
			if(code === 1){
				var pageGo = $("#page_nav_controlName #page").val();
				if(pageGo ===""){
					pageGo = $("#page_nav_controlName #page").attr("placeholder");
				}
				to_page1(pageGo);
			}else if(code === 2){
				var pageGo = $("#page_nav_menuName #page").val();
				if(pageGo ===""){
					pageGo = $("#page_nav_menuName #page").attr("placeholder");
				}
				to_page2(pageGo);
			}else if(code === 3){
				var parentId = $("#menuChirdenNameParentId").val();
				parentId = $.trim(parentId);
				if(parentId != null && parentId !=""){
					var pageGo = $("#page_nav_menuChirdenName #page").val();
					if(pageGo ===""){
						pageGo = $("#page_nav_menuChirdenName #page").attr("placeholder");
					}
					to_page3(pageGo,parentId);
				}
			}
		}
	});
}

</script>
