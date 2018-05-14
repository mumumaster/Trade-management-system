<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
//4.解析显示分页条，点击分页要能去下一页....
function build_page_nav(result) {

	$("#page_nav_area").empty();
	var ul = $("<ul></ul>").addClass("pagination");

	//构建首页和上一页
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));//.attr("href", "#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	//当页面是第一页时，首页和上一页为禁用状态
	if (result.extend.pageInfo.hasPreviousPage == false) {
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	//否则可以跳转页面,为元素添加点击翻页的事件
	} else {		
		//首页
		firstPageLi.click(function() {
			to_page(1);
		});
		//上一页
		prePageLi.click(function() {
			to_page(result.extend.pageInfo.pageNum - 1);
		});
	};

	//构建下一页和末页
	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));//.attr("href", "#"));
	
	//当最后一页时，下一页和最后一页为禁用状态
	if (result.extend.pageInfo.hasNextPage == false) {
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	//否则可以跳转页面
	} else {
		//下一页
		nextPageLi.click(function() {
			to_page(result.extend.pageInfo.pageNum + 1);
		});
		//末页
		lastPageLi.click(function() {
			to_page(result.extend.pageInfo.pages);
		});
	};

	//添加首页和前一页 的提示
	ul.append(firstPageLi).append(prePageLi);
	
	
	//遍历给ul中添加页码提示
	$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {

		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if (result.extend.pageInfo.pageNum == item) {
			//当前页是选中状态
			numLi.addClass("active");
		}
		//循环跳转页面
		numLi.click(function() {
			to_page(item);
		});
		ul.append(numLi);
	});	
	//添加下一页和末页 的提示
	ul.append(nextPageLi).append(lastPageLi);
	
	//添加跳转到页面文本
	var page = $("<input type='text' size='10px' maxlength = '3'  id='page' placeholder="+result.extend.pageInfo.pageNum+" style='height:34px;width:30px;'/>");
	ul.append("&nbsp;&nbsp;").append(page);
	var go = $("<button class='btn btn-info glyphicon glyphicon-hand-left' id='go' onclick='myGo();'></button>").append("");
	ul.append("&nbsp;&nbsp;").append(go);
	
	//把ul加入到nav
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");	
};

//跳转到页面
function myGo() {	
	var val = $("#page").val();
	val = $.trim(val);
	to_page(val);
};	

</script>
