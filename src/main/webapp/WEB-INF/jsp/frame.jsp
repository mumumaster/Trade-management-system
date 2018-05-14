
<!-- 这是登录成功后的主页面 -->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/jsp/common/header.jsp"%>
    <div class="right">
        <img class="wColck" src="${pageContext.request.contextPath }/statics/images/clock.jpg" alt=""/>
        <div class="wFont">
        	<!--获取登录用户名  -->
            <h2>${userSession.username}</h2>
            <p>欢迎来到公司订单管理系统!</p>
        </div>
    </div>

<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
