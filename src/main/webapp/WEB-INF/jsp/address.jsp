
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
  	 
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/lib/raphael-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/res/chinaMapConfig.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/res/worldMapConfig.js"></script>

<style type="text/css">
/* base */
html {
	background: #fff;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%
}

body, ul, ol, dl, dd, h1, h2, h3, h4, h5, h6, p, form, fieldset, legend,
	input, textarea, select, button, th, td, div {
	margin: 0;
	padding: 0
}

button, input, select, textarea {
	font: 12px/1.5 tahoma, Helvetica, arial,\5b8b\4f53 
}

input, select, textarea {
	font-size: 100%
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

th {
	text-align: inherit
}

fieldset, img {
	border: 0
}

iframe {
	display: block
}

ol, ul, li {
	list-style: none
}

del {
	text-decoration: line-through
}

ins, a {
	text-decoration: none
}

a:focus {
	outline: none
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%
}

.clear {
	clear: both
}

.clearfix:after {
	
	content: ".";
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden;
}

.clearfix {
	zoom: 1
}
/* base */
body {
	font: 12px/1.5 "Lucida Grande", "Lucida Sans Unicode", Tahoma, SimSun,
		Helvetica, sans-serif;
	color: #2E313A;
	background: url(bg.png);
}

.wrap {
	width: 900px;
	height:500px;
	margin: 0 auto;
	background: url(bg.png);
	border-left: 1px solid #DDD;
	border-right: 1px solid #DDD;
}

a {
	color: #0e4279;
	-moz-transition: color 0.3s ease 0s;
}

a:hover {
	color: #5B636A;
}

h1 {
	padding: 20px 0 0 20px;
	font-size: 24px;
	line-height: 50px;
}

h2 {
	margin-top: 30px;
	padding-left: 10px;
	font-size: 14px;
	line-height: 30px;
}
/* 提示自定义 */
.stateTip, #StateTip {
	display: none;
	position: absolute;
	padding: 8px;
	background: #fff;
	border: 2px solid #2385B1;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	font-size: 12px;
	font-family: Tahoma;
	color: #333;
}

.mapInfo i {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin-top: 5px;
	line-height: 15px;
	font-style: normal;
	background: #aeaeae;
	color: #fff;
	font-size: 11px;
	font-family: Tahoma;
	-webkit-border-radius: 15px;
	border-radius: 15px;
	text-align: center
}

.mapInfo i.active {
	background: #E27F21;
}

.mapInfo span {
	padding: 0 5px 0 3px;
}

.mapInfo b {
	font-weight: normal;
	color: #2770B5
}
</style>
<script type="text/javascript">
	$(function() {

		// 外部控制地图

		var mapObj = {};

		var data = {
			"jiangsu" : {
				"value" : "30.05%",
				"index" : "1",
				"stateInitColor" : "0"
			},
			"henan" : {
				"value" : "19.77%",
				"index" : "2",
				"stateInitColor" : "0"
			},
			"anhui" : {
				"value" : "10.85%",
				"index" : "3",
				"stateInitColor" : "0"
			},
			"zhejiang" : {
				"value" : "10.02%",
				"index" : "4",
				"stateInitColor" : "0"
			},
			"liaoning" : {
				"value" : "8.46%",
				"index" : "5",
				"stateInitColor" : "0"
			},
			"beijing" : {
				"value" : "4.04%",
				"index" : "6",
				"stateInitColor" : "1"
			},
			"hubei" : {
				"value" : "3.66%",
				"index" : "7",
				"stateInitColor" : "1"
			},
			"jilin" : {
				"value" : "2.56%",
				"index" : "8",
				"stateInitColor" : "1"
			},
			"shanghai" : {
				"value" : "2.47%",
				"index" : "9",
				"stateInitColor" : "1"
			},
			"guangxi" : {
				"value" : "2.3%",
				"index" : "10",
				"stateInitColor" : "1"
			},
			"sichuan" : {
				"value" : "1.48%",
				"index" : "11",
				"stateInitColor" : "2"
			},
			"guizhou" : {
				"value" : "0.99%",
				"index" : "12",
				"stateInitColor" : "2"
			},
			"hunan" : {
				"value" : "0.78%",
				"index" : "13",
				"stateInitColor" : "2"
			},
			"shandong" : {
				"value" : "0.7%",
				"index" : "14",
				"stateInitColor" : "2"
			},
			"guangdong" : {
				"value" : "0.44%",
				"index" : "15",
				"stateInitColor" : "2"
			},
			"jiangxi" : {
				"value" : "0.34%",
				"index" : "16",
				"stateInitColor" : "3"
			},
			"fujian" : {
				"value" : "0.27%",
				"index" : "17",
				"stateInitColor" : "3"
			},
			"yunnan" : {
				"value" : "0.23%",
				"index" : "18",
				"stateInitColor" : "3"
			},
			"hainan" : {
				"value" : "0.21%",
				"index" : "19",
				"stateInitColor" : "3"
			},
			"shanxi" : {
				"value" : "0.11%",
				"index" : "20",
				"stateInitColor" : "3"
			},
			"hebei" : {
				"value" : "0.11%",
				"index" : "21",
				"stateInitColor" : "4"
			},
			"neimongol" : {
				"value" : "0.04%",
				"index" : "22",
				"stateInitColor" : "4"
			},
			"tianjin" : {
				"value" : "0.04%",
				"index" : "23",
				"stateInitColor" : "4"
			},
			"gansu" : {
				"value" : "0.04%",
				"index" : "24",
				"stateInitColor" : "4"
			},
			"shaanxi" : {
				"value" : "0.02%",
				"index" : "25",
				"stateInitColor" : "4"
			},
			"macau" : {
				"value" : "0.0%",
				"index" : "26",
				"stateInitColor" : "7"
			},
			"hongkong" : {
				"value" : "0.0%",
				"index" : "27",
				"stateInitColor" : "7"
			},
			"taiwan" : {
				"value" : "0.0%",
				"index" : "28",
				"stateInitColor" : "7"
			},
			"qinghai" : {
				"value" : "0.0%",
				"index" : "29",
				"stateInitColor" : "7"
			},
			"xizang" : {
				"value" : "0.0%",
				"index" : "30",
				"stateInitColor" : "7"
			},
			"ningxia" : {
				"value" : "0.0%",
				"index" : "31",
				"stateInitColor" : "7"
			},
			"xinjiang" : {
				"value" : "0.0%",
				"index" : "32",
				"stateInitColor" : "7"
			},
			"heilongjiang" : {
				"value" : "0.0%",
				"index" : "33",
				"stateInitColor" : "7"
			},
			"chongqing" : {
				"value" : "0.0%",
				"index" : "34",
				"stateInitColor" : "7"
			}
		};

		var i = 1;

		for (k in data) {

			if (i <= 12) {

				var _cls = i < 4 ? 'active' : '';

				$('#MapControl .list1').append(
						'<li name="'+k+'"><div class="mapInfo"><i class="'+_cls+'">'
								+ (i++) + '</i><span>'
								+ chinaMapConfig.names[k] + '</span><b>'
								+ data[k].value + '</b></div></li>')

			} else if (i <= 24) {

				$('#MapControl .list2').append(
						'<li name="'+k+'"><div class="mapInfo"><i>' + (i++)
								+ '</i><span>' + chinaMapConfig.names[k]
								+ '</span><b>' + data[k].value
								+ '</b></div></li>')

			} else {

				$('#MapControl .list3').append(
						'<li name="'+k+'"><div class="mapInfo"><i>' + (i++)
								+ '</i><span>' + chinaMapConfig.names[k]
								+ '</span><b>' + data[k].value
								+ '</b></div></li>')

			}

		}

		var mapObj_1 = {};

		var stateColorList = [ '003399', '0058B0', '0071E1', '1C8DFF',
				'51A8FF', '82C0FF', 'AAD5ee', 'AAD5FF' ];

		$('#RegionMap')
				.SVGMap(
						{

							external : mapObj_1,

							mapName : 'china',

							mapWidth : 350,

							mapHeight : 350,

							stateData : data,

							// stateTipWidth: 118,

							// stateTipHeight: 47,

							// stateTipX: 2,

							// stateTipY: 0,

							stateTipHtml : function(mapData, obj) {

								var _value = mapData[obj.id].value;

								var _idx = mapData[obj.id].index;

								var active = '';

								_idx < 4 ? active = 'active' : active = '';

								var tipStr = '<div class="mapInfo"><i class="' + active + '">'
										+ _idx
										+ '</i><span>'
										+ obj.name
										+ '</span><b>' + _value + '</b></div>';

								return tipStr;

							}

						});

		$('#MapControl li').hover(
				function() {

					var thisName = $(this).attr('name');

					var thisHtml = $(this).html();

					$('#MapControl li').removeClass('select');

					$(this).addClass('select');

					$(document.body).append('<div id="StateTip"></div');

					$('#StateTip').css({

						left : $(mapObj_1[thisName].node).offset().left - 50,

						top : $(mapObj_1[thisName].node).offset().top - 40

					}).html(thisHtml).show();

					mapObj_1[thisName].attr({

						fill : '#E99A4D'

					});

				},
				function() {

					var thisName = $(this).attr('name');

					$('#StateTip').remove();

					$('#MapControl li').removeClass('select');

					mapObj_1[$(this).attr('name')]
							.attr({

								fill : "#"
										+ stateColorList[data[$(this).attr(
												'name')].stateInitColor]

							});

				});

		$('#MapColor').show();

		// 	}

		// });

		$('#WorldMap').SVGMap({

			mapName : 'world',

			mapWidth : 500,

			mapHeight : 400

		});

	});
</script>

<style type="text/css">
.regionList {
	float: left;
	margin-top: 15px;
}

.regionList ul {
	float: left;
	width: 110px;
	height: 100%;
	margin-right: 5px;
	display: inline;
	font-family: "微软雅黑"
}

.regionList ul li {
	height: 24px;
	margin-left: 10px;
	padding: 0 0px;
	border: 1px solid #fff;
	line-height: 24px;
}

.regionList ul li.select {
	border: 1px solid #D3D3D3;
	background: #FFF1BF
}

.mapInfo i {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin-top: 5px;
	line-height: 15px;
	font-style: normal;
	background: #aeaeae;
	color: #fff;
	font-size: 11px;
	font-family: Tahoma;
	-webkit-border-radius: 15px;
	border-radius: 15px;
	text-align: center
}

.mapInfo i.active {
	background: #E27F21;
}

.mapInfo span {
	padding: 0 5px 0 3px;
}

.mapInfo b {
	font-weight: normal;
	color: #2770B5
}

.regionMap {
	float: left;
	margin-left: 70px;
	display: inline;
}
</style>



	<div class="wrap">
		<div class="items" id="Item9">
			<h2>地区销售比例</h2>
			<a href="javascript:;" class="fold"></a>
			<div class="itemCon">

				<div id="Region" style="position: relative; height: 360px;">
					<div class="regionList" id="MapControl">
						<ul class="list1">
						</ul>
						<ul class="list2">
						</ul>
						<ul class="list3">
						</ul>
					</div>
					<div class="regionMap" id="RegionMap"></div>
					<div id="MapColor"
						style="display: none; float: left; width: 30px; height: 180px; margin: 80px 0 0 10px; display: inline; background: url(images/map_color.png) center 0;"></div>
				</div>
			</div>
		</div>
	</div>
			
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/SyntaxHighlighter.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/lib/SyntaxHighlighter.js"></script>
	
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>

   <script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/map.js"></script>

 </body>
</html>


  
