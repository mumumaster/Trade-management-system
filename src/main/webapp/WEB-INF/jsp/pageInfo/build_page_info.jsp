<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
	//3.解析显示分页信息
	function build_page_info(result) {
		$("#page_info_area").empty();
		$("#page_info_area").append(
				"当前" + result.extend.pageInfo.pageNum + "页,总"
						+ result.extend.pageInfo.pages + "页,总"
						+ result.extend.pageInfo.total + "条记录");		
		//总记录数
		totalRecord = result.extend.pageInfo.total;
		//当前页
		currentPage = result.extend.pageInfo.pageNum;
	};
</script>
