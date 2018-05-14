<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	</div>
   </div>
  </div>
 </div>
 <!-- /page content -->
<!-- footer content -->
	<footer style="height: 50px;">
	  <div class="pull-right">
	  		
	  		
	  		<!--print start  -->
				<script src="${pageContext.request.contextPath }/statics/js/jquery-migrate-1.2.1.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.jqprint-0.3.js"></script>
			<!-- print end -->
			<script type="text/javascript">


				$(function() {
					function print(){
						$("#print").jqprint();
					}
				});
	
			</script>
			
			
	  
	    	<h5>©2018 All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<span id="time">2015年1月1日 11:11  星期一</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" onclick="print()" value="print"/>&nbsp;&nbsp;</h5>
	    
	  </div>
	  <div class="clearfix"></div>
	</footer>
<!-- /footer content -->
 </div>
    </div>
<%@include file="js.jsp" %>
 </body>
</html>


	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/time.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/calendar/WdatePicker.js"></script>
	

