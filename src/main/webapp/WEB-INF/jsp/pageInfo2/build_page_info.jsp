<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
	//3.解析显示分页信息
	function build_page_info(result,infoArea) {
		$("#"+infoArea).empty();
		$("#"+infoArea).append(
				"当前" + result.pageInfo.pageNum + "页,总"
						+ result.pageInfo.pages + "页,总"
						+ result.pageInfo.total + "条记录");		
		//总记录数
		totalRecord = result.pageInfo.total;
		//当前页
		currentPage = result.pageInfo.pageNum;
	};
</script>
