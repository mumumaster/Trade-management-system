<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" >
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>外贸管理系统</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
  	<!-- iCheck -->
    <link href="${pageContext.request.contextPath }/statics/css/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath }/statics/css/jqvmap.min.css" rel="stylesheet"/>
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
    <!-- add localcss 2016-8-21 -->
    <link href='${pageContext.request.contextPath }/statics/localcss/applist.css' rel='stylesheet'>
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
    <!--天气start-->
    <script src="${pageContext.request.contextPath }/statics/js/template-native.js"></script>  	
	<!--天气end-->  	

  </head>
  <body class="nav-md footer_fixed" >
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="${pageContext.request.contextPath }/sys/main.html" class="site_title"><i class="fa fa-paw"></i> <span>物流管理系统</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="${pageContext.request.contextPath }/statics/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${userSession.username }</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>${userSession.username }</h3>
                <ul class="nav side-menu">
	               	<c:if test="${userSession.menuInfo !=null }">
	               		<c:forEach items="${userSession.menuInfo }" var="menu">
	               			<li>
	               				<a href="javascript:;"><i class="fa fa-home"></i> ${menu.name}<span class="fa fa-chevron-down"></span></a>
			                    <ul class="nav child_menu">
				                    <c:forEach items="${menu.menuChirden }" var="menuC">
				                    	<li><a href="${path}${menuC.url}">${menuC.name}</a></li>
				                    </c:forEach>
			                    </ul>
			                </li>
	               		</c:forEach>
	               	</c:if>
                  
                  <li><a><i class="fa fa-qrcode"></i> 项目管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">                     
                      <li><a href="javascript:;">供应商报价单</a></li>
                      <li><a href="javascript:;">供应商商品报价列表</a></li>
                      <li><a href="javascript:;">客户报价单</a></li>
                      <li><a href="${pageContext.request.contextPath }/sys/bill/list.html">客户采购订单</a></li>
                      <li><a href="javascript:;">供应商订单</a></li> 
                      <!-- <li><a href="javascript:;">请款记录</a></li> -->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 库存管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">                      
                      <li><a href="javascript:;">入库单</a></li>
                      <li><a href="javascript:;">出库单</a></li>
                      <li><a href="javascript:;">库存明细</a></li>
                      <li><a href="http://112.74.169.47:8080/music/login.jsp">音乐欣赏</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bug"></i> 业务报表 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javascript:;">销售额月统计</a></li>
                      <li><a href="javascript:;">个人销售统计</a></li>
                      <li><a href="${pageContext.request.contextPath }/sys/map/address.html">销售地区统计</a></li>
                      <li><a href="${pageContext.request.contextPath }/sys/map/map.html">百度地图查询</a></li>
                     
                    </ul>
                  </li>
                </ul>
              </div>


            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath }/logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">         	
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>	
              <!-- 天气查询  -->
              	<span style="position:absolute;top:14px;left:300px;">
              		<input  type="text" id="cityName"  placeholder="请输入城市" value="广州" >  
					<input type="button" value="查询天气">
					<span id="city"> </span> <script src="${pageContext.request.contextPath }/statics/js/weather.js"></script>  
				</span>	 				
				<!--天气end  -->	
              <ul class="nav navbar-nav navbar-right" style="width:120px;">
              
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath }/statics/images/img.jpg" alt="">${userSession.username }
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="${pageContext.request.contextPath }/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                 
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath }/statics/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath }/statics/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath }/statics/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath }/statics/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
       <!-- /top navigation -->
		<div class="right_col" role="main">
			<div class="">
			
			

	

			
			
			

	