

<!-- 这是全屏地图 -->



<script
	src="http://api.map.baidu.com/api?v=2.0&ak=A1LU7iHS0avqQwPLAxbhKn0UYSQCuRVH"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.baiduMap.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "微软雅黑";
	background: #eee;
}

.right {
	width: 100%;
	box-sizing: border-box;
}

.container {
	width: 100%;
	height: 100%;
	float: left;
}

.des {
	float: right;
	width: 48%;
	height: 100%;
	border: 1px dashed #000;
	box-sizing: border-box;
}

.info {
	margin-top: 20px;
	padding-left: 20px;
	color: #cc5522;
	font-size: 20px;
	margin-bottom: 40px;
	text-align: center;
}

pre {
	font-family: "微软雅黑";
	font-size: 14px;
}

.title {
	font-size: 14px;
	font-weight: bold;
	color: #cc5522;
}

.content {
	font-size: 13px;
	color: #333;
	margin-top: 5px;
}
</style>


<div class="right">
	<div id="container2" class="container"></div>
</div>


<script type="text/javascript">
	new BaiduMap({
		id : "container2",
		title : {
			text : "北大青鸟广州广力分校",
			className : "title"
		},
		content : {
			className : "content",
			text : [ "地址：广东省广州市海珠区晓港西马路151号 ", "电话：15870889253"]
		},
		point : {
			lng : "113.28891",
			lat : "23.095462"		
							
		},
		level : 15,
		zoom : true,
		type : [ "地图", "卫星" ],
		width : 320,
		height : 70,
		icon : {
			url : "${pageContext.request.contextPath }/statics/img/icon.png",
			width : 36,
			height : 36
		}
	});
</script>




