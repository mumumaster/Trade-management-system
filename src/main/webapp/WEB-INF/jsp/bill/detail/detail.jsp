<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"	src="${APP_PATH}/statics/js/jquery-1.12.4.js"></script>

<!-- start -->

 
 <!-- 引入DOM -->	
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/quickQuery-packer.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/quickQuery.css">
<!-- END DOM -->
      
	
<script type="text/javascript">

var arriveCityArray = new Array("","","");
	arriveCityArray[0] = new Array("0", "玉米", "YUMI");
	arriveCityArray[1] = new Array("1", "大豆", "DADOU");
	arriveCityArray[2] = new Array("2", "佛手瓜", "FOSHOGUA");
	arriveCityArray[3] = new Array("3", "冬笋", "DONGSHUN");
	arriveCityArray[4] = new Array("4", "豌豆", "WANDON");
	arriveCityArray[5] = new Array("5", "毛豆", "MAODOU");
	arriveCityArray[6] = new Array("6", "胡萝卜", "HULOUBO");
	arriveCityArray[7] = new Array("7", "大白菜", "DABAICHAI");
	arriveCityArray[8] = new Array("8", "芹菜", "QINCHAI");
	arriveCityArray[9] = new Array("9", "菠菜", "BOCHAI");
	arriveCityArray[10] = new Array("10", "番茄", "FANQIE");
	arriveCityArray[11] = new Array("11", "黄瓜", "HUANGGUA");
	arriveCityArray[12] = new Array("12", "茄子", "QIEZHI");
	arriveCityArray[13] = new Array("13", "尖椒", "XIANJIAO");
	arriveCityArray[14] = new Array("14", "土豆", "TUDOU");
	arriveCityArray[15] = new Array("15", "黄葱头", "HUANGCHONGDOU");
	arriveCityArray[16] = new Array("16", "红葱头", "HONGCHONGDOU");
	arriveCityArray[17] = new Array("17", "葱", "CHOUG");
	arriveCityArray[18] = new Array("18", "大米", "DAMI");
	arriveCityArray[19] = new Array("19", "姜", "JIANG");
	
	
	window.onload = function(){
		$quickQuery(arriveCityArray);
	}
</script>
 


<div>

	<div class="row">
			<div id="n1" class="col-md-4" style="margin-top:5px;">
				<label for="q1">商品名称:</label>
				<input class="quickQuery$focus" id="q1" style="border: 3px solid #ccc;" size="20px" />
				&nbsp;&nbsp;<button id="select1">查询</button>
				&nbsp;&nbsp;<button id="print1">print</button>
    		</div>   		   
				<div  id="save_product" class="col-md-8">
					<form class="form-horizontal" modelAttribute="billDetail">
						<table id="table2" class="">
							<tbody>
								<tr class="tr">
									<th><input type="text" id="ad0"  size="13" readonly="readonly"/></th>									
									<th><input type="text" id="ad2" size="15" readonly="readonly"/></th>
									<th><input type="text" id="ad3" size="8" readonly="readonly"/></th>
									<th><input type="text" id="ad4" size="12"></th>
									<th><input type="text" id="ad5" size="12" readonly="readonly"/></th>
									<th><input type="text" id="ad6" size="12" readonly="readonly"/></th>
									<th style="border:0px;">&nbsp;&nbsp;&nbsp;<div class="btn btn-primary glyphicon glyphicon-plus" id="yes_btn" style="margin-top:4px;" >确定</div></th>
								</tr>
							</tbody>
						</table>
					</form>
				</div>				
			</div>

</div>
	


<style type="text/css">

#quickQuery_container { 
    left: 75px ! important;
    top: 31px ! important;
    z-index: 99;
    display: block;
    }
</style>
	
<!-- end -->

<style type="text/css">
.tr1 input {
	border-width: 0px;
}

.tr2 input {
	text-align: center;
	border-width: 0px 0px 2px 0px;
}

#table1 {
	background-color: #fff;
	border: 1px red;
}

#table1 td {
	border: 29px solid #fff;
	text-align: center;
}

#table1 th {
	text-align: center;
	border: 29px solid #fff;
}

#table2 tr {
	
}

#table2 th {
	border: 0px solid #abc;
}

#table2 th input {
	text-align: center;
	border: 0px;
}
</style>

<div class="container">

	<div class="" id="aa">
		<div class="row">
			<div class="col-md-12">
				<table id="table1">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>供应商名称</th>
							<th>总消费</th>
							<th>订单状态</th>
							<th>联系人</th>
							<th>订单日期</th>
						</tr>
					</thead>
					<tbody>
						<tr class="tr2">
							<td><input id="orderid_input" readonly="readonly" size="20px" type="text" /></td>
							<td><input id="proName_input" readonly="readonly" size="40px" type="text" /></td>
							<td><input id="cost_input" readonly="readonly" type="text" size="15px" value="0" /></td>
							<td><input id="sname_input" readonly="readonly" type="text" size="15px" /></td>
							<td><input type="text" readonly="readonly" value="农立祥" size="15px"/></td>
							<td><input type="text" readonly="readonly"	value="2017-03-30" size="15px" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>		

		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="product_table">
					<thead>
						<tr>
							<th>商品编号</th>
							<th>商品名称</th>
							<th>商品单位</th>
							<th>商品数量</th>
							<th>商品单价</th>
							<th>商品总计</th>
							<th>操 作</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<h2 class="col-md-6" id="page_info_area" style="font-size: 22px;"></h2>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>

		

	</div>
</div>


<script type="text/javascript">


//定义全局的总记录数和当前页
var totalRecord,currentPage;
//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
$(function() {
	//去首页
	to_page(1);
	
	//显示订单信息
	getBill(${edit_id});				
	//绑定商品下拉框
	getProduct("#aa .se2");
});

//跳转页面
function to_page(pn) {
	var val = ${edit_id};	
	val = $.trim(val);	
	var url = "${APP_PATH}/sys/bill/billDetails";
	var args = {
		"id" : val,
		"pn":pn,
		"time" : new Date()
	};
	
	$.post(url, args, function(result) {
			console.log(result);
		
			console.log(result);
			//1、解析并显示商品信息
			product_table(result);	
			
			//2、解析并显示分页信息
			build_page_info(result);
			//3、解析显示分页条数据
			build_page_nav(result);
			
		});
};
	
	
	
	
	
	function product_table(result){
		//清空table表格
		$("#product_table tbody").empty();
		var info = result.extend.pageInfo.list;
		$.each(info,function(index,item){									
			var idTd = $("<td></td>").append(item.id);
			var productNameTd = $("<td></td>").append(item.productName);			
			var productUnitTd = $("<td></td>").append(item.productUnit);		
			var quantityTd = $("<td></td>").append(item.quantity);
			var priceTd = $("<td></td>").append(item.price); 
			var costTd = $("<td></td>").append(item.cost); 
		
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前员工id
			editBtn.attr("edit-id",item.id);
			var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-remove-sign")).append("删除");
			//为删除按钮添加一个自定义的属性来表示当前删除的员工id
			delBtn.attr("del-id",item.id);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			
			//append方法执行完成以后还是返回原来的元素
			$("<tr></tr>")
					
				.append(idTd)
				.append(productNameTd)				
				.append(productUnitTd)
				.append(quantityTd)
				.append(priceTd)
				.append(costTd)								
				.append(btnTd)
				.appendTo("#product_table tbody");
			
		});
	};

	//根据Id查询订单信息
	function getBill(id) {					
		$.ajax({			
			url : "${APP_PATH}/sys/bill/select/" + id,
			type : "GET",
			success : function(result) {
				console.log(result);
				var bill = result.extend.bill;
				//这是设置姓名不可修改的显示
				//$("#name_update_static").text(student.name);
				
				//把查询到的学生信息显示到修改页面
				$("#orderid_input").val(bill.orderid);																	
				$("#proName_input").val(bill.proName);
				$("#sname_input").val(bill.sname);				
				$("#cost_input").val(bill.cost);
				
				
			}
		});
	};
	
	

	//查出所有的商品信息并显示在下拉列表中（所有页面可以使用的）
	function getProduct(ele) {
		//测试获取表单的值
		//alert($("#empAddModal form").serialize());

		//清空之前下拉列表的值
		$(ele).empty();
		//请求地址
		var url = "${APP_PATH}/sys/bill/product";

		$.post(url, function(result) {
			console.log(result);
			//遍历集合元素绑定到下拉的商品框中
			$.each(result.extend.product, function() {
				var optionEle = $("<option></option>").append(this.productname)
						.attr("value", this.id);
				optionEle.appendTo(ele);
			});
		});

	};

	
	//商品下拉框 (按ID查询商品)
	$("#ad2").change(function() {
		//商品Id
		var id = $("#ad2").val();

		//根据Id查询商品
		$.ajax({
			url : "${APP_PATH}/sys/bill/productId/" + id,
			type : "GET",
			success : function(result) {
				console.log(result);
				var info = result.extend.info;

				//把查询到的学生信息显示到修改页面
				$("#ad0").val(info.id);
				$("#ad1").val(info.productname);
				$("#ad3").val(info.productunit);
				$("#ad4").val(info.productcount);
				$("#ad5").val(info.price);				
				var price = (info.productcount) * (info.price);
				$("#ad6").val(price);

			}
		});

	});
	
	//商品名称输入框 (按商品名称查询商品)
	$("#ad1").change(function() {
		//商品Id
		var val = $("#ad1").val();		
		url = "${APP_PATH}/sys/bill/productName";				
		var args = {
				"name" : val,				
				"time" : new Date()
			};
		$.post(url, args, function(result) {
				
				console.log(result);
				var info = result.extend.info;				
				//把查询到的学生信息显示到修改页面
				$("#ad0").val(info.id);
				$("#ad2").val([ info.id ]); 
				$("#ad3").val(info.productunit);
				$("#ad4").val(info.productcount);
				$("#ad5").val(info.price); 
				var price = (info.productcount) * (info.price);
				$("#ad6").val(price);								
		
		});
		
		var a1 = $("#ad1").val();
		var a2 = $("#ad2").val();
		if(a1!=a2){
			$("#ad2").val("");
			$("#ad3").val("");
			$("#ad4").val("");
			$("#ad5").val("");
			$("#ad6").val("");
		}
		

	});
	
	
	// (按商品名称查询商品)
	$("#select1").click(function() {
		//商品Id
		var val = $("#q1").val();			
		url = "${APP_PATH}/sys/bill/productName";				
		var args = {
				"name" : val,				
				"time" : new Date()
			};
		$.post(url, args, function(result) {
				
				console.log(result);
				var info = result.extend.info;				
				//把查询到的学生信息显示到修改页面
				$("#ad0").val(info.id);
				$("#ad2").val(info.productname); 
				$("#ad3").val(info.productunit);
				$("#ad4").val(info.productcount);
				$("#ad5").val(info.price); 
				var price = (info.productcount) * (info.price);
				$("#ad6").val(price);								
		
		});
		
		var a1 = $("#q1").val();
		var a2 = $("#ad2").val();
		if(a1!=a2){
			$("#ad0").val("");
			$("#ad2").val("");
			$("#ad3").val("");
			$("#ad4").val("");
			$("#ad5").val("");
			$("#ad6").val("");
		}
		

	});
	
	//商品的总价随着商品的数量改变而改变
	$("#ad4").change(function() {	
		var price = $("#ad4").val() * $("#ad5").val();
		$("#ad6").val(price);			
	});
	
	
	//点击保存，新增订单商品。
	$("#yes_btn").click(function(){
		
		var orderid=${edit_id};//订单编号
		var productid=$("#ad0").val();//商品编号
		var quantity=$("#ad4").val();//数量
		var cost=$("#ad6").val();;//消费
				
		//1、发送ajax请求保存
		$.ajax({
			url:"${APP_PATH}/sys/bill/saveProduct",
			type:"POST",			
			data:{
				"orderid" : orderid,
				"productid":productid,
				"quantity":quantity,
				"cost":cost,
				"time" : new Date()
			}, 
			success:function(result){
				//alert(result.msg);
				if(result.code == 100){
					//保存成功
					//重新刷新列表
					
					//显示订单信息
					var id = ${edit_id};
					getBill(id);	
					
					//显示订单的商品列表
					to_page(totalRecord);
					
				}else{
					alert("保存失败");
				}
			}
		});
	});
	

</script>

<!-- 解析并显示分页信息 -->
<%@include file="../../pageInfo/build_page_info.jsp"%>
<!-- 解析显示分页条数据 -->
<%@include file="../../pageInfo/build_page_nav.jsp"%>

<!-- 修改模态框  -->
<%@include file="modify/modify_info.jsp"%>
<!-- 删除的模态框  -->
<%@include file="delete/delete_info.jsp"%> 




<%@include file="/WEB-INF/jsp/common/footer.jsp"%>


<!--  start  -->

<script type="text/javascript">

	$("#print1").click(function(){
		
		//订单编号
		var orderid_input =$("#orderid_input").val();
		//供应商名称
		var proName_input =$("#proName_input").val();
		//总消费
		var cost_input =$("#cost_input").val();
		//订单状态
		var sname_input =$("#sname_input").val();
		
		var tr0td0 = $("#tbody").find("tr:eq(0)").find("td:eq(0)").text();
		var tr0td1 = $("#tbody").find("tr:eq(0)").find("td:eq(1)").text();
		var tr0td2 = $("#tbody").find("tr:eq(0)").find("td:eq(2)").text();
		var tr0td3 = $("#tbody").find("tr:eq(0)").find("td:eq(3)").text();
		var tr0td4 = $("#tbody").find("tr:eq(0)").find("td:eq(4)").text();
		var tr0td5 = $("#tbody").find("tr:eq(0)").find("td:eq(5)").text();
		
		var tr1td0 = $("#tbody").find("tr:eq(1)").find("td:eq(0)").text();
		var tr1td1 = $("#tbody").find("tr:eq(1)").find("td:eq(1)").text();
		var tr1td2 = $("#tbody").find("tr:eq(1)").find("td:eq(2)").text();
		var tr1td3 = $("#tbody").find("tr:eq(1)").find("td:eq(3)").text();
		var tr1td4 = $("#tbody").find("tr:eq(1)").find("td:eq(4)").text();
		var tr1td5 = $("#tbody").find("tr:eq(1)").find("td:eq(5)").text();
		
		var tr2td0 = $("#tbody").find("tr:eq(2)").find("td:eq(0)").text();
		var tr2td1 = $("#tbody").find("tr:eq(2)").find("td:eq(1)").text();
		var tr2td2 = $("#tbody").find("tr:eq(2)").find("td:eq(2)").text();
		var tr2td3 = $("#tbody").find("tr:eq(2)").find("td:eq(3)").text();
		var tr2td4 = $("#tbody").find("tr:eq(2)").find("td:eq(4)").text();
		var tr2td5 = $("#tbody").find("tr:eq(2)").find("td:eq(5)").text();
			
		var name="农立祥";				
		url = "${APP_PATH}/sys/map/print";				
		var args = {
				"orderid_input" : orderid_input,	
				"proName_input" : proName_input,	
				"cost_input" : cost_input,	
				"sname_input" : sname_input,
				
				"tr0td0" : tr0td0,
				"tr0td1" : tr0td1,
				"tr0td2" : tr0td2,
				"tr0td3" : tr0td3,
				"tr0td4" : tr0td4,
				"tr0td5" : tr0td5,
				
				"tr1td0" : tr1td0,
				"tr1td1" : tr1td1,
				"tr1td2" : tr1td2,
				"tr1td3" : tr1td3,
				"tr1td4" : tr1td4,
				"tr1td5" : tr1td5,
				
				"tr2td0" : tr2td0,
				"tr2td1" : tr2td1,
				"tr2td2" : tr2td2,
				"tr2td3" : tr2td3,
				"tr2td4" : tr2td4,
				"tr2td5" : tr2td5,
				"name" : name,
									
				"time" : new Date()
			};
		$.post(url, args, function(result) {
				
				console.log(result);											
		
		});
		
	});

	

</script>





