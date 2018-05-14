<!-- 这是登录页面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 公司订单管理系统</title>
    <script type="text/javascript" src="${path}/statics/js/jquery-1.12.4.js"></script>
    <link type="text/css" rel="stylesheet" href="${path}/statics/css/style.css" />
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
    $(document).ready(function () {
		$("#sub").click(function() {
			$.post( "${path}/login",$("#actionForm").serialize(),
					function($data) {
						if($data != null){
							if($data.code != null){
								if($data.code != 181){
									if($data.code === "-1000"){
										showError($data.errorMessage);
									}else if($data.code === "-365"){
										showError($data.errorMessage);
									}else if ($data.code === "-366") {
										showError($data.errorMessage);
									}else if ($data.code === "-555") {
										showError($data.errorMessage);
									}else if ($data.code === "-556") {
										showError($data.errorMessage);
									}else if ($data.code === "-997") {
										showError($data.errorMessage);
									}if ($data.code === "-999") {
										showError($data.errorMessage);
									}
								}else{
									window.location.href = "${path}/sys/main.html";
								}
								
							}
						}
			}, "json");
		})
	})
	function showError(error) {
    	$("#errorInfo").html(error);
	}
    </script>
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>公司订单管理系统</h1>
        </header>
        <section class="loginCont">
	        <form class="loginForm" action="${pageContext.request.contextPath }/dologin.html"  name="actionForm" id="actionForm"  method="post" >
				<div class="info" id="errorInfo"></div><!--显示错误信息  -->
				<div class="inputbox">
                    <label for="user">用户名：</label>
					<input type="text" class="input-text" id="userCode" name="userCode" placeholder="请输入用户名" required/>
				</div>	
				<div class="inputbox">
                    <label for="mima">密码：</label>
                    <input type="password" id="userPassword" name="userPassword" placeholder="请输入密码" required/>
                </div>	
				<div class="subBtn">
                    <input type="button" class="btn btn-primary glyphicon glyphicon-plus" id="sub" value="登录"/>                  
                    <input type="reset" value="重置"/>
                </div>	
			</form>
        </section>
    </section>
</body>
</html>
