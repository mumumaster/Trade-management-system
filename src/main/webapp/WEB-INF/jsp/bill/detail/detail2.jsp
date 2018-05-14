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
	arriveCityArray[0] = new Array("0", "丽江", "LIJIANG");
	arriveCityArray[1] = new Array("1", "青岛", "QINGDAO");
	arriveCityArray[2] = new Array("2", "临沧", "LINCANG");
	arriveCityArray[3] = new Array("3", "林西", "LINXI");
	arriveCityArray[4] = new Array("4", "临沂", "LINYI");
	arriveCityArray[5] = new Array("5", "柳州", "LIUZHOU");
	arriveCityArray[6] = new Array("6", "洛阳", "LUOYANG");
	arriveCityArray[7] = new Array("7", "庐山", "LUSHAN");
	arriveCityArray[8] = new Array("8", "泸州", "LUZHOU");
	arriveCityArray[9] = new Array("9", "德宏芒市", "DEHONGMANGSHI");
	arriveCityArray[10] = new Array("10", "满洲里", "MANZHOULI");
	arriveCityArray[11] = new Array("11", "秦皇岛", "QINHUANGDAO");
	arriveCityArray[12] = new Array("12", "齐齐哈尔", "QIQIHAER");
	arriveCityArray[13] = new Array("13", "衢州", "QVZHOU");
	arriveCityArray[14] = new Array("14", "三亚", "SANYA");
	arriveCityArray[15] = new Array("15", "上海", "SHANGHAI");
	arriveCityArray[16] = new Array("16", "鄯善", "SHANSHAN");
	arriveCityArray[17] = new Array("17", "汕头", "SHANTOU");
	arriveCityArray[18] = new Array("18", "韶关", "SHAOGUAN");
	arriveCityArray[19] = new Array("19", "沙市", "SHASHI");
	arriveCityArray[20] = new Array("20", "沈阳", "SHENYANG");
	arriveCityArray[21] = new Array("21", "深圳", "SHENZHEN");
	arriveCityArray[22] = new Array("22", "石家庄", "SHIJIAZHUANG");
	arriveCityArray[23] = new Array("23", "思茅", "SIMAO");
	arriveCityArray[24] = new Array("24", "苏州", "SUZHOU");
	arriveCityArray[25] = new Array("25", "塔城", "TACHENG");
	arriveCityArray[26] = new Array("26", "太原", "TAIYUAN");
	arriveCityArray[27] = new Array("27", "天津", "TIANJIN");
	arriveCityArray[28] = new Array("28", "通化", "TONGHUA");
	arriveCityArray[29] = new Array("29", "通辽", "TONGLIAO");
	arriveCityArray[30] = new Array("30", "铜仁", "TONGREN");
	arriveCityArray[31] = new Array("31", "乌兰浩特", "WULANHAOTE");
	arriveCityArray[32] = new Array("32", "乌鲁木齐", "WULUMUQI");
	arriveCityArray[33] = new Array("33", "万州", "WANZHOU");
	arriveCityArray[34] = new Array("34", "潍坊", "WEIFANG");
	arriveCityArray[35] = new Array("35", "威海", "WEIHAI");
	arriveCityArray[36] = new Array("36", "温州", "WENZHOU");
	arriveCityArray[37] = new Array("37", "武汉", "WUHAN");
	arriveCityArray[38] = new Array("38", "芜湖", "WUHU");
	arriveCityArray[39] = new Array("39", "无锡", "WUXI");
	arriveCityArray[40] = new Array("40", "武夷山", "WUYISHAN");
	arriveCityArray[41] = new Array("41", "梧州", "WUZHOU");
	arriveCityArray[42] = new Array("42", "厦门", "XIAMEN");
	arriveCityArray[43] = new Array("43", "西安", "XIAN");
	arriveCityArray[44] = new Array("44", "襄樊", "XIANGFAN");
	arriveCityArray[45] = new Array("45", "西昌", "XICHANG");
	arriveCityArray[46] = new Array("46", "锡林浩特", "XILINHAOTE");
	arriveCityArray[47] = new Array("47", "兴城", "XINGCHENG");
	arriveCityArray[48] = new Array("48", "兴宁", "XINGNING");
	arriveCityArray[49] = new Array("49", "邢台", "XINGTAI");
	arriveCityArray[50] = new Array("50", "西宁", "XINING");
	arriveCityArray[51] = new Array("51", "西双版纳", "XISHUANGBANNA");
	arriveCityArray[52] = new Array("52", "徐州", "XVZHOU");
	arriveCityArray[53] = new Array("53", "延安", "YANAN");
	arriveCityArray[54] = new Array("54", "盐城", "YANCHENG");
	arriveCityArray[55] = new Array("55", "延吉", "YANJI");
	arriveCityArray[56] = new Array("56", "烟台", "YANTAI");
	arriveCityArray[57] = new Array("57", "宜宾", "YIBIN");
	arriveCityArray[58] = new Array("58", "宜昌", "YICHANG");
	arriveCityArray[59] = new Array("59", "银川", "YINCHUAN");
	arriveCityArray[60] = new Array("60", "义乌", "YIWU");
	arriveCityArray[61] = new Array("61", "永州", "YONGZHOU");
	arriveCityArray[62] = new Array("62", "元谋", "YUANMOU");
	arriveCityArray[63] = new Array("63", "榆林", "YULIN");
	arriveCityArray[64] = new Array("64", "张家界", "ZHANGJIAJIE");
	arriveCityArray[65] = new Array("65", "湛江", "ZHANJIANG");
	arriveCityArray[66] = new Array("66", "昭通", "ZHAOTONG");
	arriveCityArray[67] = new Array("67", "郑州", "ZHENGZHOU");
	arriveCityArray[68] = new Array("68", "舟山", "ZHOUSHAN");
	arriveCityArray[69] = new Array("69", "遵义", "ZUNYI");
	arriveCityArray[70] = new Array("70", "北京南苑", "BEIJINGNANYUAN");
	arriveCityArray[71] = new Array("71", "铱兰", "YILAN");
	arriveCityArray[72] = new Array("72", "梨山", "LISHAN");
	arriveCityArray[73] = new Array("73", "广元", "GUANGYUAN");
	arriveCityArray[74] = new Array("74", "大足", "DAZU");
	arriveCityArray[75] = new Array("75", "东胜", "DONGSHENG");
	arriveCityArray[76] = new Array("76", "庆阳", "QINGYANG");
	arriveCityArray[77] = new Array("77", "伊宁", "YINING");
	arriveCityArray[78] = new Array("78", "运城", "YUNCHENG");
	arriveCityArray[79] = new Array("79", "曼彻斯特", "MANCHESITE");
	arriveCityArray[80] = new Array("80", "巴厘岛", "BALIDAO");
	arriveCityArray[81] = new Array("81", "北干巴鲁", "BEIGANBALU");
	arriveCityArray[82] = new Array("82", "吉达", "JIDA");
	arriveCityArray[83] = new Array("83", "班贾尔马", "BANJAERMA");
	arriveCityArray[84] = new Array("84", "巴淡岛", "BADANDAO");
	arriveCityArray[85] = new Array("85", "巴东", "BADONG");
	arriveCityArray[86] = new Array("86", "巴厘巴板", "BALIBABAN");
	arriveCityArray[87] = new Array("87", "班达亚齐", "BANDAYAQI");
	arriveCityArray[88] = new Array("88", "棉丹", "MIANDAN");
	arriveCityArray[89] = new Array("89", "乌戎潘当", "WURONGPANDANG");
	arriveCityArray[90] = new Array("90", "比亚克", "BIYAKE");
	arriveCityArray[91] = new Array("91", "查亚普拉", "CHAYAPULA");
	arriveCityArray[92] = new Array("92", "万鸦老", "WANYALAO");
	arriveCityArray[93] = new Array("93", "特姆巴加普拉", "TEMUBAJIAPULA");
	arriveCityArray[94] = new Array("94", "日惹", "RIRE");
	arriveCityArray[95] = new Array("95", "三宝垄", "SANBAOLONG");
	arriveCityArray[96] = new Array("96", "苏拉", "SULA");
	arriveCityArray[97] = new Array("97", "巨港", "JVGANG");
	arriveCityArray[98] = new Array("98", "柏林", "BOLIN");
	arriveCityArray[99] = new Array("99", "不莱梅", "BULAIMEI");
	arriveCityArray[100] = new Array("100", "科隆", "KELONG");
	arriveCityArray[101] = new Array("101", "德雷斯顿", "DELEISIDUN");
	arriveCityArray[102] = new Array("102", "多特蒙德", "DUTEMENGDE");
	arriveCityArray[103] = new Array("103", "杜塞尔多夫", "DUSAIERDUOFU");
	arriveCityArray[104] = new Array("104", "埃尔福特", "AIERFUTE");
	arriveCityArray[105] = new Array("105", "腓特烈港", "FEITELIEGANG");
	arriveCityArray[106] = new Array("106", "明斯特", "MINGSITE");
	arriveCityArray[107] = new Array("107", "法兰克福", "FALANKEFU");
	arriveCityArray[108] = new Array("108", "汉诺威", "HANNUOWEI");
	arriveCityArray[109] = new Array("109", "汉堡", "HANBAO");
	arriveCityArray[110] = new Array("110", "霍夫", "HUOFU");
	arriveCityArray[111] = new Array("111", "基尔", "JIER");
	arriveCityArray[112] = new Array("112", "哈勒", "HALE");
	arriveCityArray[113] = new Array("113", "慕尼黑", "MUNIHEI");
	arriveCityArray[114] = new Array("114", "纽伦堡", "NIULUNBAO");
	arriveCityArray[115] = new Array("115", "帕德博恩", "PADEBOEN");
	arriveCityArray[116] = new Array("116", "萨尔布吕肯", "SAERBULVKEN");
	arriveCityArray[117] = new Array("117", "斯图加特", "SITUJIATE");
	arriveCityArray[118] = new Array("118", "格拉茨", "GELACI");
	arriveCityArray[119] = new Array("119", "因斯布鲁克", "YINSIBULUKE");
	arriveCityArray[120] = new Array("120", "克拉根福特", "KELAGENFUTE");
	arriveCityArray[121] = new Array("121", "林茨", "LINCI");
	arriveCityArray[122] = new Array("122", "萨尔兹堡", "SAERZIBAO");
	arriveCityArray[123] = new Array("123", "维也纳", "WEIYENA");
	arriveCityArray[124] = new Array("124", "布鲁塞尔", "BULUSAIER");
	arriveCityArray[125] = new Array("125", "伯尔尼", "BOERNI");
	arriveCityArray[126] = new Array("126", "济南", "JINAN");
	arriveCityArray[127] = new Array("127", "米卢斯", "MILUSI");
	arriveCityArray[128] = new Array("128", "日内瓦", "RINEIWA");
	arriveCityArray[129] = new Array("129", "苏黎世", "SULISHI");
	arriveCityArray[130] = new Array("130", "布尔诺", "BUERNUO");
	arriveCityArray[131] = new Array("131", "布拉格", "BULAGE");
	arriveCityArray[132] = new Array("132", "奥尔堡", "AOERBAO");
	arriveCityArray[133] = new Array("133", "奥胡斯", "AOHUSI");
	arriveCityArray[134] = new Array("134", "比兰得", "BILANDE");
	arriveCityArray[135] = new Array("135", "哥本哈根", "GEBENHAGEN");
	arriveCityArray[136] = new Array("136", "里昂", "LIANG");
	arriveCityArray[137] = new Array("137", "马赛", "MASAI");
	arriveCityArray[138] = new Array("138", "尼斯", "NICI");
	arriveCityArray[139] = new Array("139", "珠海", "ZHUHAI");
	arriveCityArray[140] = new Array("140", "巴黎", "BALI");
	arriveCityArray[141] = new Array("141", "斯特拉斯堡", "SITELASIBAO");
	arriveCityArray[142] = new Array("142", "图卢兹", "TULUZI");
	arriveCityArray[143] = new Array("143", "波尔多", "BOERDUO");
	arriveCityArray[144] = new Array("144", "阿伯丁", "ABODING");
	arriveCityArray[145] = new Array("145", "贝尔法斯特", "BEIERFASITE");
	arriveCityArray[146] = new Array("146", "伯明翰", "BOMINGHAN");
	arriveCityArray[147] = new Array("147", "爱丁堡", "AIDINGBAO");
	arriveCityArray[148] = new Array("148", "格拉斯哥", "GELASIGE");
	arriveCityArray[149] = new Array("149", "因弗内斯", "YINFUNEISI");
	arriveCityArray[150] = new Array("150", "利兹", "LIZI");
	arriveCityArray[151] = new Array("151", "伦敦", "LUNDUN");
	arriveCityArray[152] = new Array("152", "曼彻斯特", "MANCHESITE");
	arriveCityArray[153] = new Array("153", "蒂塞德", "DISAIDE");
	arriveCityArray[154] = new Array("154", "纽卡素", "NIUKASU");
	arriveCityArray[155] = new Array("155", "斯普利特", "SIPULITE");
	arriveCityArray[156] = new Array("156", "萨格勒布", "SAGELEBU");
	arriveCityArray[157] = new Array("157", "布达佩斯", "BUDAPEISI");
	arriveCityArray[158] = new Array("158", "井冈山", "JINGGANGSHAN");
	arriveCityArray[159] = new Array("159", "常德", "CHANGDE");
	arriveCityArray[160] = new Array("160", "阿尔盖罗", "AERGAILUO");
	arriveCityArray[161] = new Array("161", "安科纳", "ANKENA");
	arriveCityArray[162] = new Array("162", "布林迪西", "BULINDIXI");
	arriveCityArray[163] = new Array("163", "博洛尼亚", "BOLUONIYA");
	arriveCityArray[164] = new Array("164", "巴里", "BALI");
	arriveCityArray[165] = new Array("165", "卡利亚里", "KALIYALI");
	arriveCityArray[166] = new Array("166", "卡达尼亚", "KADANIYA");
	arriveCityArray[167] = new Array("167", "东京", "DONGJING");
	arriveCityArray[168] = new Array("168", "佛罗伦萨", "FOLUOLUNSA");
	arriveCityArray[169] = new Array("169", "热那亚", "RENAYA");
	arriveCityArray[170] = new Array("170", "福冈", "FUGANG");
	arriveCityArray[171] = new Array("171", "朗贝杜萨", "LANGBEIDUSA");
	arriveCityArray[172] = new Array("172", "长崎", "CHANGQI");
	arriveCityArray[173] = new Array("173", "米兰", "MILAN");
	arriveCityArray[174] = new Array("174", "那不勒斯", "NABULESI");
	arriveCityArray[175] = new Array("175", "大阪", "DABAN");
	arriveCityArray[176] = new Array("176", "奥尔比亚", "AOERBIYA");
	arriveCityArray[177] = new Array("177", "巴勒莫", "BALEMO");
	arriveCityArray[178] = new Array("178", "比萨", "BISA");
	arriveCityArray[179] = new Array("179", "佩斯卡拉", "PEISIKALA");
	arriveCityArray[180] = new Array("180", "拉布里亚雷焦", "LABULIYALEIJIAO");
	arriveCityArray[181] = new Array("181", "罗马", "LUOMA");
	arriveCityArray[182] = new Array("182", "拉默齐亚-泰尔默", "LAMOQIYA-TAIERMO");
	arriveCityArray[183] = new Array("183", "都灵", "DULING");
	arriveCityArray[184] = new Array("184", "的里雅斯特", "DELIYASITE");
	arriveCityArray[185] = new Array("185", "威尼斯", "WEINISI");
	arriveCityArray[186] = new Array("186", "维罗纳", "WEILUONA");
	arriveCityArray[187] = new Array("187", "潘泰莱亚岛", "PANTAILAIYADAO");
	arriveCityArray[188] = new Array("188", "里米尼", "LIMINI");
	arriveCityArray[189] = new Array("189", "卢森堡", "LUSENBAO");
	arriveCityArray[190] = new Array("190", "阿姆斯特丹", "AMUSITEDAN");
	arriveCityArray[191] = new Array("191", "哥斯达克", "GESIDAKE");
	arriveCityArray[192] = new Array("192", "克拉科夫", "KELAKEFU");
	arriveCityArray[193] = new Array("193", "卡托维兹", "KATUOWEIZI");
	arriveCityArray[194] = new Array("194", "波兹南", "BOZINAN");
	arriveCityArray[195] = new Array("195", "华沙", "HUASHA");
	arriveCityArray[196] = new Array("196", "弗罗茨瓦夫", "FULUOCIWAFU");
	arriveCityArray[197] = new Array("197", "卢布尔雅那", "LUBUERYANA");
	arriveCityArray[198] = new Array("198", "布拉迪斯拉", "BULADISILA");
	arriveCityArray[199] = new Array("199", "萨拉热窝", "SALAREWO");
	arriveCityArray[200] = new Array("200", "索非亚", "SUOFEIYA");
	arriveCityArray[201] = new Array("201", "明斯克", "MINGSIKE");
	arriveCityArray[202] = new Array("202", "贝尔格莱德", "BEIERGELAIDE");
	arriveCityArray[203] = new Array("203", "塔林", "TALIN");
	arriveCityArray[204] = new Array("204", "兰萨罗特", "LANSALUOTE");
	arriveCityArray[205] = new Array("205", "马拉加", "MALAJIA");
	arriveCityArray[206] = new Array("206", "阿利坎特", "ALIKANTE");
	arriveCityArray[207] = new Array("207", "巴塞罗那", "BASAILUONA");
	arriveCityArray[208] = new Array("208", "毕尔巴鄂", "BIERBAE");
	arriveCityArray[209] = new Array("209", "罗萨里奥", "LUOSALIAO");
	arriveCityArray[210] = new Array("210", "伊比沙", "YIBISHA");
	arriveCityArray[211] = new Array("211", "拉科鲁尼亚", "LAKELUNIYA");
	arriveCityArray[212] = new Array("212", "拉斯帕尔马斯", "LASIPAERMASI");
	arriveCityArray[213] = new Array("213", "马德里", "MADELI");
	arriveCityArray[214] = new Array("214", "阿斯图里亚斯", "ASITULIYASI");
	arriveCityArray[215] = new Array("215", "尔马", "ERMA");
	arriveCityArray[216] = new Array("216", "圣地亚哥-德-孔波斯特拉", "SHENGDIYAGE-DE-KONGBOSITELA");
	arriveCityArray[217] = new Array("217", "塞维利亚", "SAIWEILIYA");
	arriveCityArray[218] = new Array("218", "赫雷斯一德拉弗隆特拉", "HE");
	arriveCityArray[219] = new Array("219", "维戈", "WEIGE");
	arriveCityArray[220] = new Array("220", "瓦伦西亚", "WALUNXIYA");
	arriveCityArray[221] = new Array("221", "特内里费", "TENEILIFEI");
	arriveCityArray[222] = new Array("222", "赫尔辛基", "HEERXINJI");
	arriveCityArray[223] = new Array("223", "罗瓦涅米", "LUOWANIEMI");
	arriveCityArray[224] = new Array("224", "雅典", "YADIAN");
	arriveCityArray[225] = new Array("225", "萨洛尼卡", "SALUONIKA");
	arriveCityArray[226] = new Array("226", "干尼亚", "GANNIYA");
	arriveCityArray[227] = new Array("227", "伊拉克里翁", "YILAKELIWONG");
	arriveCityArray[228] = new Array("228", "罗德斯", "LUODESI");
	arriveCityArray[229] = new Array("229", "都柏林", "DUBOLIN");
	arriveCityArray[230] = new Array("230", "维尔纽斯", "WEIERNIUSI");
	arriveCityArray[231] = new Array("231", "里加", "LIJIA");
	arriveCityArray[232] = new Array("232", "马尔他", "MAERTA");
	arriveCityArray[233] = new Array("233", "卑尔根", "BEIERGEN");
	arriveCityArray[234] = new Array("234", "奥斯陆", "AOSILU");
	arriveCityArray[235] = new Array("235", "斯塔万格", "SITAWANGE");
	arriveCityArray[236] = new Array("236", "特隆赫姆", "TELONGHEMU");
	arriveCityArray[237] = new Array("237", "法罗", "FALUO");
	arriveCityArray[238] = new Array("238", "里斯本", "LISIBEN");
	arriveCityArray[239] = new Array("239", "波尔图", "BOERTU");
	arriveCityArray[240] = new Array("240", "丰沙尔", "FENGSHAER");
	arriveCityArray[241] = new Array("241", "布加勒斯特", "BUJIALESITE");
	arriveCityArray[242] = new Array("242", "蒂米什瓦拉", "DIMISHIWALA");
	arriveCityArray[243] = new Array("243", "哥得堡", "GEDEBAO");
	arriveCityArray[244] = new Array("244", "斯德哥尔摩", "SIDEGEERMO");
	arriveCityArray[245] = new Array("245", "安卡拉", "ANKALA");
	arriveCityArray[246] = new Array("246", "伊斯坦布尔", "YISITANBUER");
	arriveCityArray[247] = new Array("247", "伊兰密卡", "YILANMIKA");
	arriveCityArray[248] = new Array("248", "基辅", "JIFU");
	arriveCityArray[249] = new Array("249", "第聂伯罗彼得罗夫斯克", "DINIEBOLUOBIDELUOFUSIKE");
	arriveCityArray[250] = new Array("250", "顿涅茨克", "DUNNIECIKE");
	arriveCityArray[251] = new Array("251", "埃里温", "AILIWEN");
	arriveCityArray[252] = new Array("252", "诺夫哥罗", "NUOFUGELUO");
	arriveCityArray[253] = new Array("253", "沙马拉", "SHAMALA");
	arriveCityArray[254] = new Array("254", "喀山", "KASHAN");
	arriveCityArray[255] = new Array("255", "圣彼得堡", "SHENGBIDEBAO");
	arriveCityArray[256] = new Array("256", "彼尔姆", "BIERMU");
	arriveCityArray[257] = new Array("257", "乌法", "WUFA");
	arriveCityArray[258] = new Array("258", "罗斯托夫", "LUOSITUOFU");
	arriveCityArray[259] = new Array("259", "莫斯科", "MOSIKE");
	arriveCityArray[260] = new Array("260", "杜兰戈", "DULANGE");
	arriveCityArray[261] = new Array("261", "瓜达拉哈拉", "GUADALAHALA");
	arriveCityArray[262] = new Array("262", "瓦图尔科", "WATUERKE");
	arriveCityArray[263] = new Array("263", "蒙克洛瓦", "MENGKELUOWA");
	arriveCityArray[264] = new Array("264", "圣何塞", "SHENGHESAI");
	arriveCityArray[265] = new Array("265", "梅里达", "MEILIDA");
	arriveCityArray[266] = new Array("266", "蒙特雷", "MENGTELEI");
	arriveCityArray[267] = new Array("267", "贝尔莫潘", "BEIERMOPAN");
	arriveCityArray[268] = new Array("268", "蓬塔雷纳斯", "PENGTALEINASI");
	arriveCityArray[269] = new Array("269", "马萨特兰", "MASATELAN");
	arriveCityArray[270] = new Array("270", "瓦哈卡", "WAHAKA");
	arriveCityArray[271] = new Array("271", "普埃布拉", "PUAIBULA");
	arriveCityArray[272] = new Array("272", "利蒙", "LIMENG");
	arriveCityArray[273] = new Array("273", "巴亚尔塔港", "BAYAERTAGANG");
	arriveCityArray[274] = new Array("274", "悉尼", "XINI");
	arriveCityArray[275] = new Array("275", "阿尔及尔", "AERJIER");
	arriveCityArray[276] = new Array("276", "圣萨尔瓦多", "SHENGSAERWADUO");
	arriveCityArray[277] = new Array("277", "阿纳巴", "ANABA");
	arriveCityArray[278] = new Array("278", "危地马拉城", "WEIDIMALACHENG");
	arriveCityArray[279] = new Array("279", "君士坦丁", "JUNSHITANDING");
	arriveCityArray[280] = new Array("280", "墨尔本", "MOERBEN");
	arriveCityArray[281] = new Array("281", "罗安达", "LUOANDA");
	arriveCityArray[282] = new Array("282", "弗洛雷斯", "FULUOLEISI");
	arriveCityArray[283] = new Array("283", "阿德莱德", "ADELAIDE");
	arriveCityArray[284] = new Array("284", "布里斯班", "BULISIBAN");
	arriveCityArray[285] = new Array("285", "马那瓜", "MANAGUA");
	arriveCityArray[286] = new Array("286", "珀斯", "POSI");
	arriveCityArray[287] = new Array("287", "杜阿拉", "DUALA");
	arriveCityArray[288] = new Array("288", "班吉", "BANJI");
	arriveCityArray[289] = new Array("289", "阿比让", "ABIRANG");
	arriveCityArray[290] = new Array("290", "恩贾梅拉", "ENJIAMEILA");
	arriveCityArray[291] = new Array("291", "金沙萨", "JINSHASA");
	arriveCityArray[292] = new Array("292", "奎雷塔罗", "KUILEITALUO");
	arriveCityArray[293] = new Array("293", "布拉柴维尔", "BULACHAIWEIER");
	arriveCityArray[294] = new Array("294", "吉布提", "JIBUTI");
	arriveCityArray[295] = new Array("295", "开罗", "KAILUO");
	arriveCityArray[296] = new Array("296", "卢克索", "LUKESUO");
	arriveCityArray[297] = new Array("297", "阿斯马拉", "ASIMALA");
	arriveCityArray[298] = new Array("298", "堪培拉", "KANPEILA");
	arriveCityArray[299] = new Array("299", "黄金海岸", "HUANGJINHAIAN");
	arriveCityArray[300] = new Array("300", "达尔文", "DAERWEN");
	arriveCityArray[301] = new Array("301", "亚的斯亚贝巴", "YADESIYABEIBA");
	arriveCityArray[302] = new Array("302", "凯恩斯", "KAIENSI");
	arriveCityArray[303] = new Array("303", "圣约瑟卡博", "SHENGYUESEKABO");
	arriveCityArray[304] = new Array("304", "纽卡斯尔", "NIUKASIER");
	arriveCityArray[305] = new Array("305", "利伯维尔", "LIBOWEIER");
	arriveCityArray[306] = new Array("306", "霍巴特", "HUOBATE");
	arriveCityArray[307] = new Array("307", "圣路易斯波托西", "SHENGLUYISIBOTUOXI");
	arriveCityArray[308] = new Array("308", "马拉博", "MALABO");
	arriveCityArray[309] = new Array("309", "萨尔蒂洛", "SAERDILUO");
	arriveCityArray[310] = new Array("310", "惠灵顿", "HUILINGDUN");
	arriveCityArray[311] = new Array("311", "哈博罗内", "HABOLUONEI");
	arriveCityArray[312] = new Array("312", "坦皮科", "TANPIKE");
	arriveCityArray[313] = new Array("313", "奥克兰", "AOKELAN");
	arriveCityArray[314] = new Array("314", "托卢卡", "TUOLUKA");
	arriveCityArray[315] = new Array("315", "亚历山德拉", "YALISHANDELA");
	arriveCityArray[316] = new Array("316", "瓦加杜古", "WAJIADUGU");
	arriveCityArray[317] = new Array("317", "帕默斯顿北", "PAMOSIDUNBEI");
	arriveCityArray[318] = new Array("318", "布琼布拉", "BUQIONGBULA");
	arriveCityArray[319] = new Array("319", "克赖斯特切奇", "KELAISITEQIEQI");
	arriveCityArray[320] = new Array("320", "罗托鲁阿", "LUOTUOLVA");
	arriveCityArray[321] = new Array("321", "昆斯敦", "KUNSIDUN");
	arriveCityArray[322] = new Array("322", "洛美", "LUOMEI");
	arriveCityArray[323] = new Array("323", "达尼丁", "DANIDING");
	arriveCityArray[324] = new Array("324", "班珠尔", "BANZHUER");
	arriveCityArray[325] = new Array("325", "科纳克里", "KENAKELI");
	arriveCityArray[326] = new Array("326", "比绍", "BISHAO");
	arriveCityArray[327] = new Array("327", "阿克拉", "AKELA");
	arriveCityArray[328] = new Array("328", "哈拉雷", "HALALEI");
	arriveCityArray[329] = new Array("329", "蒙巴萨", "MENGBASA");
	arriveCityArray[330] = new Array("330", "内罗毕", "NEILUOBI");
	arriveCityArray[331] = new Array("331", "埃尔多雷特", "AIERDUOLEITE");
	arriveCityArray[332] = new Array("332", "蒙罗维亚", "MENGLUOWEIYA");
	arriveCityArray[333] = new Array("333", "的黎波里", "DELIBOLI");
	arriveCityArray[334] = new Array("334", "班加西", "BANJIAXI");
	arriveCityArray[335] = new Array("335", "圣丹尼斯", "SHENGDANNISI");
	arriveCityArray[336] = new Array("336", "基加利", "JIJIALI");
	arriveCityArray[337] = new Array("337", "利隆圭", "LILONGGUI");
	arriveCityArray[338] = new Array("338", "巴马科", "BAMAKE");
	arriveCityArray[339] = new Array("339", "毛里求斯", "MAOLIQIUSI");
	arriveCityArray[340] = new Array("340", "努瓦克肖特", "NVWAKEXIAOTE");
	arriveCityArray[341] = new Array("341", "卡萨布兰卡", "KASABULANKA");
	arriveCityArray[342] = new Array("342", "拉巴特", "LABATE");
	arriveCityArray[343] = new Array("343", "马普托", "MAPUTUO");
	arriveCityArray[344] = new Array("344", "尼亚美", "NIYAMEI");
	arriveCityArray[345] = new Array("345", "拉各斯", "LAGESI");
	arriveCityArray[346] = new Array("346", "卡诺", "KANUO");
	arriveCityArray[347] = new Array("347", "费里敦", "FEILIDUN");
	arriveCityArray[348] = new Array("348", "达喀尔", "DAKAER");
	arriveCityArray[349] = new Array("349", "马埃岛", "MAAIDAO");
	arriveCityArray[350] = new Array("350", "喀土穆", "KATUMU");
	arriveCityArray[351] = new Array("351", "福岛", "FUDAO");
	arriveCityArray[352] = new Array("352", "摩加迪沙", "MOJIADISHA");
	arriveCityArray[353] = new Array("353", "松山", "SONGSHAN");
	arriveCityArray[354] = new Array("354", "达累斯萨拉姆", "DALEISISALAMU");
	arriveCityArray[355] = new Array("355", "冈山", "GANGSHAN");
	arriveCityArray[356] = new Array("356", "乞力马扎罗山", "QILIMAZHALUOSHAN");
	arriveCityArray[357] = new Array("357", "小松", "XIAOSONG");
	arriveCityArray[358] = new Array("358", "恩德培", "ENDEPEI");
	arriveCityArray[359] = new Array("359", "名古屋", "MINGGUWU");
	arriveCityArray[360] = new Array("360", "新泻", "XINXIE");
	arriveCityArray[361] = new Array("361", "札幌", "ZHAHUANG");
	arriveCityArray[362] = new Array("362", "冲绳", "CHONGSHENG");
	arriveCityArray[363] = new Array("363", "利文斯敦", "LIWENSIDUN");
	arriveCityArray[364] = new Array("364", "广岛", "GUANGDAO");
	arriveCityArray[365] = new Array("365", "高松", "GAOSONG");
	arriveCityArray[366] = new Array("366", "卢萨卡", "LUSAKA");
	arriveCityArray[367] = new Array("367", "仙台", "XIANTAI");
	arriveCityArray[368] = new Array("368", "恩多拉", "ENDUOLA");
	arriveCityArray[369] = new Array("369", "横滨", "HENGBIN");
	arriveCityArray[370] = new Array("370", "布隆方丹", "BULONGFANGDAN");
	arriveCityArray[371] = new Array("371", "开普敦", "KAIPUDUN");
	arriveCityArray[372] = new Array("372", "德班", "DEBAN");
	arriveCityArray[373] = new Array("373", "大马士革", "DAMASHIGE");
	arriveCityArray[374] = new Array("374", "东伦敦", "DONGLUNDUN");
	arriveCityArray[375] = new Array("375", "利雅得", "LIYADE");
	arriveCityArray[376] = new Array("376", "约翰内斯堡", "YUHANNEISIBAO");
	arriveCityArray[377] = new Array("377", "平壤", "PINGRANG");
	arriveCityArray[378] = new Array("378", "金伯利", "JINBOLI");
	arriveCityArray[379] = new Array("379", "首尔", "SHOUER");
	arriveCityArray[380] = new Array("380", "釜山", "FUSHAN");
	arriveCityArray[381] = new Array("381", "伊丽莎白港", "YILISHABAIGANG");
	arriveCityArray[382] = new Array("382", "大丘", "DAQIU");
	arriveCityArray[383] = new Array("383", "光州", "GUANGZHOU");
	arriveCityArray[384] = new Array("384", "清州", "QINGZHOU");
	arriveCityArray[385] = new Array("385", "襄阳", "XIANGYANG");
	arriveCityArray[386] = new Array("386", "济州", "JIZHOU");
	arriveCityArray[387] = new Array("387", "全州", "QUANZHOU");
	arriveCityArray[388] = new Array("388", "新加坡", "XINJIAPO");
	arriveCityArray[389] = new Array("389", "巴格达", "BAGEDA");
	arriveCityArray[390] = new Array("390", "耶路撒冷", "YELUSALENG");
	arriveCityArray[391] = new Array("391", "仰光", "YANGGUANG");
	arriveCityArray[392] = new Array("392", "贝鲁特", "BEILUTE");
	arriveCityArray[393] = new Array("393", "安曼", "ANMAN");
	arriveCityArray[394] = new Array("394", "达卡", "DAKA");
	arriveCityArray[395] = new Array("395", "河内", "HENEI");
	arriveCityArray[396] = new Array("396", "胡志明", "HUZHIMING");
	arriveCityArray[397] = new Array("397", "海防", "HAIFANG");
	arriveCityArray[398] = new Array("398", "吉隆坡", "JILONGPO");
	arriveCityArray[399] = new Array("399", "槟城", "BINGCHENG");
	arriveCityArray[400] = new Array("400", "马六甲", "MALIUJIA");
	arriveCityArray[401] = new Array("401", "曼谷", "MANGU");
	arriveCityArray[402] = new Array("402", "普吉", "PUJI");
	arriveCityArray[403] = new Array("403", "清迈", "QINGMAI");
	arriveCityArray[404] = new Array("404", "青蓬", "QINGPENG");
	arriveCityArray[405] = new Array("405", "甲米", "JIAMI");
	arriveCityArray[406] = new Array("406", "班马卡恩", "BANMAKAEN");
	arriveCityArray[407] = new Array("407", "武里南", "WULINAN");
	arriveCityArray[408] = new Array("408", "洛坤", "LUOKUN");
	arriveCityArray[409] = new Array("409", "泰可泰", "TAIKETAI");
	arriveCityArray[410] = new Array("410", "科隆坡", "KELONGPO");
	arriveCityArray[411] = new Array("411", "亭可马里", "TINGKEMALI");
	arriveCityArray[412] = new Array("412", "马累", "MALEI");
	arriveCityArray[413] = new Array("413", "比什凯克", "BISHIKAIKE");
	arriveCityArray[414] = new Array("414", "加德满都", "JIADEMANDU");
	arriveCityArray[415] = new Array("415", "雅加达", "YAJIADA");
	arriveCityArray[416] = new Array("416", "安汶", "ANWEN");
	arriveCityArray[417] = new Array("417", "马塔兰", "MATALAN");
	arriveCityArray[418] = new Array("418", "阿斯特拉赛特拉", "ASITELASAITELA");
	arriveCityArray[419] = new Array("419", "德黑兰", "DEHEILAN");
	arriveCityArray[420] = new Array("420", "阿巴丹", "ABADAN");
	arriveCityArray[421] = new Array("421", "科威特", "KEWEITE");
	arriveCityArray[422] = new Array("422", "塔什干", "TASHIGAN");
	arriveCityArray[423] = new Array("423", "斯里巴加湾", "SILIBAJIAWAN");
	arriveCityArray[424] = new Array("424", "万象", "WANXIANG");
	arriveCityArray[425] = new Array("425", "北汕", "BEISHAN");
	arriveCityArray[426] = new Array("426", "马尼拉", "MANILA");
	arriveCityArray[427] = new Array("427", "宿务", "SUWU");
	arriveCityArray[428] = new Array("428", "马斯喀特", "MASIKATE");
	arriveCityArray[429] = new Array("429", "塞拉莱/萨拉拉", "SAILALAI");
	arriveCityArray[430] = new Array("430", "蒂卡尔", "DIKAER");
	arriveCityArray[431] = new Array("431", "阿什贾巴特", "ASHIJIABATE");
	arriveCityArray[432] = new Array("432", "乌兰巴托", "WULANBATUO");
	arriveCityArray[433] = new Array("433", "喀布尔", "KABUER");
	arriveCityArray[434] = new Array("434", "坎大哈", "KANDAHA");
	arriveCityArray[435] = new Array("435", "德里", "DELI");
	arriveCityArray[436] = new Array("436", "孟买", "MENGMAI");
	arriveCityArray[437] = new Array("437", "班加罗尔", "BANJIALUOER");
	arriveCityArray[438] = new Array("438", "晨奈", "CHENNAI");
	arriveCityArray[439] = new Array("439", "海德拉巴", "HAIDELABA");
	arriveCityArray[440] = new Array("440", "格雅", "GEYA");
	arriveCityArray[441] = new Array("441", "瓦拉纳西", "WALANAXI");
	arriveCityArray[442] = new Array("442", "伊斯兰堡", "YISILANBAO");
	arriveCityArray[443] = new Array("443", "阿塔克", "ATAKE");
	arriveCityArray[444] = new Array("444", "巴哈瓦尔布尔", "BAHAWAERBUER");
	arriveCityArray[445] = new Array("445", "本努", "BENNV");
	arriveCityArray[446] = new Array("446", "坎贝尔布尔", "KANBEIERBUER");
	arriveCityArray[447] = new Array("447", "巴库", "BAKU");
	arriveCityArray[448] = new Array("448", "托雷翁", "TUOLEIWONG");
	arriveCityArray[449] = new Array("449", "韦拉克鲁斯", "WEILAKELUSI");
	arriveCityArray[450] = new Array("450", "比亚埃尔莫萨", "BIYAAIERMOSA");
	arriveCityArray[451] = new Array("451", "萨卡特卡斯", "SAKATEKASI");
	arriveCityArray[452] = new Array("452", "伊斯塔巴/西华达内荷", "YISITABA");
	arriveCityArray[453] = new Array("453", "曼萨尼约", "MANSANIYUE");
	arriveCityArray[454] = new Array("454", "弗里波特", "FULIBOTE");
	arriveCityArray[455] = new Array("455", "拿骚", "NASAO");
	arriveCityArray[456] = new Array("456", "西班牙港", "XIBANYAGANG");
	arriveCityArray[457] = new Array("457", "布里顿", "BULIDUN");
	arriveCityArray[458] = new Array("458", "哈瓦那", "HAWANA");
	arriveCityArray[459] = new Array("459", "布里奇敦", "BULIQIDUN");
	arriveCityArray[460] = new Array("460", "金斯敦", "JINSIDUN");
	arriveCityArray[461] = new Array("461", "库拉索岛", "KULASUODAO");
	arriveCityArray[462] = new Array("462", "蒙特哥贝", "MENGTEGEBEI");
	arriveCityArray[463] = new Array("463", "大开曼岛", "DAKAIMANDAO");
	arriveCityArray[464] = new Array("464", "普拉塔港", "PULATAGANG");
	arriveCityArray[465] = new Array("465", "蓬塔卡纳", "PENGTAKANA");
	arriveCityArray[466] = new Array("466", "圣多明各", "SHENGDUOMINGGE");
	arriveCityArray[467] = new Array("467", "利马", "LIMA");
	arriveCityArray[468] = new Array("468", "塔拉拉", "TALALA");
	arriveCityArray[469] = new Array("469", "加拉加斯", "JIALAJIASI");
	arriveCityArray[470] = new Array("470", "巴基西梅托", "BAJIXIMEITUO");
	arriveCityArray[471] = new Array("471", "巴利纳斯", "BALINASI");
	arriveCityArray[472] = new Array("472", "马拉开波", "MALAKAIBO");
	arriveCityArray[473] = new Array("473", "阿普雷河畔圣费尔南多", 
	
	"APULEIHEPANSHENGFEIERNANDUO");
	arriveCityArray[474] = new Array("474", "波哥大", "BOGEDA");
	arriveCityArray[475] = new Array("475", "卡利", "KALI");
	arriveCityArray[476] = new Array("476", "弗洛伦西亚", "FULUOLUNXIYA");
	arriveCityArray[477] = new Array("477", "巴兰基亚", "BALANJIYA");
	arriveCityArray[478] = new Array("478", "卡塔赫纳", "KATAHENA");
	arriveCityArray[479] = new Array("479", "圣保罗", "SHENGBAOLUO");
	arriveCityArray[480] = new Array("480", "巴西利亚", "BAXILIYA");
	arriveCityArray[481] = new Array("481", "里约热内卢", "LIYUERENEILU");
	arriveCityArray[482] = new Array("482", "库里蒂巴", "KULIDIBA");
	arriveCityArray[483] = new Array("483", "萨尔瓦多", "SAERWADUO");
	arriveCityArray[484] = new Array("484", "马塞约 ", "MASAIYUE");
	arriveCityArray[485] = new Array("485", "新伊瓜苏", "XINYIGUASU");
	arriveCityArray[486] = new Array("486", "马瑙斯", "MANAOSI");
	arriveCityArray[487] = new Array("487", "桑托斯", "SANGTUOSI");
	arriveCityArray[488] = new Array("488", "累西腓", "LEIXIFEI");
	arriveCityArray[489] = new Array("489", "苏克雷", "SUKELEI");
	arriveCityArray[490] = new Array("490", "贝伦", "BEILUN");
	arriveCityArray[491] = new Array("491", "圣地亚哥", "SHENGDIYAGE");
	arriveCityArray[492] = new Array("492", "布宜诺斯艾利斯", "BUYINUOSIAILISI");
	arriveCityArray[493] = new Array("493", "瓜亚基尔", "GUAYAJIER");
	arriveCityArray[494] = new Array("494", "基多", "JIDUO");
	arriveCityArray[495] = new Array("495", "蓬塞", "PENGSAI");
	arriveCityArray[496] = new Array("496", "圣胡安", "SHENGHUAN");
	arriveCityArray[497] = new Array("497", "巴拿马城", "BANAMACHENG");
	arriveCityArray[498] = new Array("498", "圣托马斯", "SHENGTUOMASI");
	arriveCityArray[499] = new Array("499", "圣马滕", "SHENGMATENG");
	arriveCityArray[500] = new Array("500", "蒙得维的亚", "MENGDEWEIDIYA");
	arriveCityArray[501] = new Array("501", "亚松森", "YASONGSEN");
	arriveCityArray[502] = new Array("502", "卡宴", "KAYAN");
	arriveCityArray[503] = new Array("503", "乔治敦", "QIAOZHIDUN");
	arriveCityArray[504] = new Array("504", "帕拉马里博", "PALAMALIBO");
	arriveCityArray[505] = new Array("505", "莫尔兹比港", "MOERZIBIGANG");
	arriveCityArray[506] = new Array("506", "罗阿坦", "LUOATAN");
	arriveCityArray[507] = new Array("507", "圣佩德罗苏拉", "SHENGPEIDELUOSULA");
	arriveCityArray[508] = new Array("508", "维瓦克", "WEIWAKE");
	arriveCityArray[509] = new Array("509", "莱城", "LAICHENG");
	arriveCityArray[510] = new Array("510", "特古西加尔巴", "TEGUXIJIAERBA");
	arriveCityArray[511] = new Array("511", "马当", "MADANG");
	arriveCityArray[512] = new Array("512", "利比里亚", "LIBILIYA");
	arriveCityArray[513] = new Array("513", "苏瓦", "SUWA");
	arriveCityArray[514] = new Array("514", "南迪", "NANDI");
	arriveCityArray[515] = new Array("515", "努库阿洛法", "NVKUALUOFA");
	arriveCityArray[516] = new Array("516", "瑙鲁岛   ", "NAOLUDAO");
	arriveCityArray[517] = new Array("517", "霍尼亚拉", "HUONIYALA");
	arriveCityArray[518] = new Array("518", "富纳富提环礁", "FUNAFUTIHUANJIAO");
	arriveCityArray[519] = new Array("519", "塔拉瓦", "TALAWA");
	arriveCityArray[520] = new Array("520", "阿皮亚", "APIYA");
	arriveCityArray[521] = new Array("521", "巴林", "BALIN");
	arriveCityArray[522] = new Array("522", "穆哈拉格", "MUHALAGE");
	arriveCityArray[523] = new Array("523", "马纳马", "MANAMA");
	arriveCityArray[524] = new Array("524", "廷布", "TINGBU");
	arriveCityArray[525] = new Array("525", "卡拉干达", "KALAGANDA");
	arriveCityArray[526] = new Array("526", "阿尔马蒂", "AERMADI");
	arriveCityArray[527] = new Array("527", "金边", "JINBIAN");
	arriveCityArray[528] = new Array("528", "拜林", "BAILIN");
	arriveCityArray[529] = new Array("529", "贡布", "GONGBU");
	arriveCityArray[530] = new Array("530", "上丁", "SHANGDING");
	arriveCityArray[531] = new Array("531", "柴桢", "CHAIZHEN");
	arriveCityArray[532] = new Array("532", "腊塔纳基里", "LATANAJILI");
	arriveCityArray[533] = new Array("533", "希姆雷普", "XIMULEIPU");
	arriveCityArray[534] = new Array("534", "多哈", "DUOHA");
	arriveCityArray[535] = new Array("535", "迪拜", "DIBAI");
	arriveCityArray[536] = new Array("536", "阿布扎比", "ABUZHABI");
	arriveCityArray[537] = new Array("537", "杜尚别", "DUSHANGBIE");
	arriveCityArray[538] = new Array("538", "尼科西亚", "NIKEXIYA");
	arriveCityArray[539] = new Array("539", "阿克罗蒂里", "AKELUODILI");
	arriveCityArray[540] = new Array("540", "拉纳卡", "LANAKA");
	arriveCityArray[541] = new Array("541", "阿亚纳帕", "AYANAPA");
	arriveCityArray[542] = new Array("542", "阿伦敦", "ALUNDUN");
	arriveCityArray[543] = new Array("543", "阿尔伯克基", "AERBOKEJI");
	arriveCityArray[544] = new Array("544", "楠塔基特", "NANTAJITE");
	arriveCityArray[545] = new Array("545", "阿卡塔", "AKATA");
	arriveCityArray[546] = new Array("546", "亚历山德里亚", "YALISHANDELIYA");
	arriveCityArray[547] = new Array("547", "奥古斯塔", "AOGUSITA");
	arriveCityArray[548] = new Array("548", "阿森斯", "ASENSI");
	arriveCityArray[549] = new Array("549", "阿莱恩斯", "ALAIENSI");
	arriveCityArray[550] = new Array("550", "奥尔巴尼", "AOERBANI");
	arriveCityArray[551] = new Array("551", "阿拉莫萨", "ALAMOSA");
	arriveCityArray[552] = new Array("552", "阿马里洛", "AMALILUO");
	arriveCityArray[553] = new Array("553", "安克雷奇", "ANKELEIQI");
	arriveCityArray[554] = new Array("554", "阿尔托纳", "AERTUONA");
	arriveCityArray[555] = new Array("555", "沃特敦", "WOTEDUN");
	arriveCityArray[556] = new Array("556", "阿斯彭", "ASIPENG");
	arriveCityArray[557] = new Array("557", "亚特兰大", "YATELANDA");
	arriveCityArray[558] = new Array("558", "阿普尔顿", "APUERDUN");
	arriveCityArray[559] = new Array("559", "奥古斯塔", "AOGUSITA");
	arriveCityArray[560] = new Array("560", "奥斯汀", "AOSITING");
	arriveCityArray[561] = new Array("561", "阿什维尔", "ASHIWEIER");
	arriveCityArray[562] = new Array("562", "维尔克斯巴里", "WEIERKESIBALI");
	arriveCityArray[563] = new Array("563", "卡拉马祖", "KALAMAZU");
	arriveCityArray[564] = new Array("564", "哈特福德", "HATEFUDE");
	arriveCityArray[565] = new Array("565", "贝德福德", "BEIDEFUDE");
	arriveCityArray[566] = new Array("566", "布拉德福德", "BULADEFUDE");
	arriveCityArray[567] = new Array("567", "斯科茨布拉夫", "SIKECIBULAFU");
	arriveCityArray[568] = new Array("568", "贝克斯菲尔德", "BEIKESIFEIERDE");
	arriveCityArray[569] = new Array("569", "宾厄姆顿", "BINEMUDUN");
	arriveCityArray[570] = new Array("570", "班戈", "BANGE");
	arriveCityArray[571] = new Array("571", "巴港", "BAGANG");
	arriveCityArray[572] = new Array("572", "伯明翰", "BOMINGHAN");
	arriveCityArray[573] = new Array("573", "比灵斯", "BILINGSI");
	arriveCityArray[574] = new Array("574", "俾斯麦", "BISIMAI");
	arriveCityArray[575] = new Array("575", "贝克利", "BEIKELI");
	arriveCityArray[576] = new Array("576", "布卢菲尔德", "BULUFEIERDE");
	arriveCityArray[577] = new Array("577", "布卢明顿诺马尔", "BULUMINGDUNNUOMAER");
	arriveCityArray[578] = new Array("578", "纳什维尔", "NASHIWEIER");
	arriveCityArray[579] = new Array("579", "博伊西", "BOYIXI");
	arriveCityArray[580] = new Array("580", "波士顿", "BOSHIDUN");
	arriveCityArray[581] = new Array("581", "博蒙特", "BOMENGTE");
	arriveCityArray[582] = new Array("582", "巴吞鲁日", "BATUNLURI");
	arriveCityArray[583] = new Array("583", "墨西哥城", "MOXIGECHENG");
	arriveCityArray[584] = new Array("584", "伯灵顿", "BOLINGDUN");
	arriveCityArray[585] = new Array("585", "布法罗", "BUFALUO");
	arriveCityArray[586] = new Array("586", "伯班克", "BOBANKE");
	arriveCityArray[587] = new Array("587", "巴尔的摩", "BAERDIMO");
	arriveCityArray[588] = new Array("588", "哥伦比亚", "GELUNBIYA");
	arriveCityArray[589] = new Array("589", "阿克伦", "AKELUN");
	arriveCityArray[590] = new Array("590", "查德隆", "CHADELONG");
	arriveCityArray[591] = new Array("591", "克林森特城", "KELINSENTECHENG");
	arriveCityArray[592] = new Array("592", "科特斯", "KETESI");
	arriveCityArray[593] = new Array("593", "查塔努加", "CHATANUJIA");
	arriveCityArray[594] = new Array("594", "芝加哥", "ZHIJIAGE");
	arriveCityArray[595] = new Array("595", "夏洛茨维尔", "XIALUOCIWEIER");
	arriveCityArray[596] = new Array("596", "查尔斯顿", "CHAERSIDUN");
	arriveCityArray[597] = new Array("597", "奇科", "QIKE");
	arriveCityArray[598] = new Array("598", "希达拉匹兹", "BUDALAPIZI");
	arriveCityArray[599] = new Array("599", "克拉克斯堡", "KELAKESIBAO");
	arriveCityArray[600] = new Array("600", "圣迭戈", "SHENGDIEGE");
	arriveCityArray[601] = new Array("601", "克利夫兰", "KELIFULAN");
	arriveCityArray[602] = new Array("602", "克利奇站", "KELIQIZHAN");
	arriveCityArray[603] = new Array("603", "夏洛特", "XIALUOTE");
	arriveCityArray[604] = new Array("604", "哥伦布", "GELUNBU");
	arriveCityArray[605] = new Array("605", "科迪", "KEDI");
	arriveCityArray[606] = new Array("606", "克罗拉多斯普林斯", "KELUOLADUOSIPULINSI");
	arriveCityArray[607] = new Array("607", "卡斯帕", "KASIPA");
	arriveCityArray[608] = new Array("608", "科帕斯科里斯蒂", "KEPASIKELISIDI");
	arriveCityArray[609] = new Array("609", "查尔斯顿", "CHAERSIDUN");
	arriveCityArray[610] = new Array("610", "辛辛那提", "XINXINNATI");
	arriveCityArray[611] = new Array("611", "夏延", "XIAYAN");
	arriveCityArray[612] = new Array("612", "代托纳比奇", "DAITUONABIQI");
	arriveCityArray[613] = new Array("613", "代顿", "DAIDUN");
	arriveCityArray[614] = new Array("614", "道奇城", "DAOQICHENG");
	arriveCityArray[615] = new Array("615", "丹佛", "DANFO");
	arriveCityArray[616] = new Array("616", "达拉斯", "DALASI");
	arriveCityArray[617] = new Array("617", "迪金森", "DIJINSEN");
	arriveCityArray[618] = new Array("618", "杜兰戈", "DULANGE");
	arriveCityArray[619] = new Array("619", "得梅因", "DEMEIYIN");
	arriveCityArray[620] = new Array("620", "底特律", "DITELV");
	arriveCityArray[621] = new Array("621", "杜波伊斯", "DUBOYISI");
	arriveCityArray[622] = new Array("622", "卡尼", "KANI");
	arriveCityArray[623] = new Array("623", "韦尔", "WEIER");
	arriveCityArray[624] = new Array("624", "埃尔迈拉", "AIERMAILA");
	arriveCityArray[625] = new Array("625", "埃尔帕索", "AIERPASUO");
	arriveCityArray[626] = new Array("626", "伊利", "YILI");
	arriveCityArray[627] = new Array("627", "尤金", "YOUJIN");
	arriveCityArray[628] = new Array("628", "埃文斯维尔", "AIWENSIWEIER");
	arriveCityArray[629] = new Array("629", "纽伯恩", "NIUBOEN");
	arriveCityArray[630] = new Array("630", "纽瓦克", "NIUWAKE");
	arriveCityArray[631] = new Array("631", "基韦斯特", "JIWEISITE");
	arriveCityArray[632] = new Array("632", "法戈", "FAGE");
	arriveCityArray[633] = new Array("633", "弗雷斯诺", "FULEISINUO");
	arriveCityArray[634] = new Array("634", "费耶特韦尔", "FEIYETEWEIER");
	arriveCityArray[635] = new Array("635", "富兰克林", "FULANKELIN");
	arriveCityArray[636] = new Array("636", "大峡谷", "DAXIAGU");
	arriveCityArray[637] = new Array("637", "劳德代尔堡", "LAODEDAIERBAO");
	arriveCityArray[638] = new Array("638", "佛罗伦斯", "FOLUOLUNSI");
	arriveCityArray[639] = new Array("639", "法明顿", "FAMINGDUN");
	arriveCityArray[640] = new Array("640", "迈尔斯堡", "MAIERSIBAO");
	arriveCityArray[641] = new Array("641", "苏弗尔斯", "SUFUERSI");
	arriveCityArray[642] = new Array("642", "韦恩堡", "WEIENBAO");
	arriveCityArray[643] = new Array("643", "大本德", "DABENDE");
	arriveCityArray[644] = new Array("644", "吉莱特", "JILAITE");
	arriveCityArray[645] = new Array("645", "加登城", "JIADENGCHENG");
	arriveCityArray[646] = new Array("646", "斯坎波", "SIKANBO");
	arriveCityArray[647] = new Array("647", "大章克申", "DAZHANGKESHEN");
	arriveCityArray[648] = new Array("648", "盖恩斯维尔", "GAIENSIWEIER");
	arriveCityArray[649] = new Array("649", "格尔夫波特", "GEERFUBOTE");
	arriveCityArray[650] = new Array("650", "格林贝", "GELINBEI");
	arriveCityArray[651] = new Array("651", "格兰德岛", "GELANDEDAO");
	arriveCityArray[652] = new Array("652", "大急流城", "DAJILIUCHENG");
	arriveCityArray[653] = new Array("653", "格林斯伯勒", "GELINSIBOLE");
	arriveCityArray[654] = new Array("654", "格林维尔", "GELINWEIER");
	arriveCityArray[655] = new Array("655", "甘尼森", "GANNISEN");
	arriveCityArray[656] = new Array("656", "哈里斯堡", "HALISIBAO");
	arriveCityArray[657] = new Array("657", "海登", "HAIDENG");
	arriveCityArray[658] = new Array("658", "黑格斯顿", "HEIGESIDUN");
	arriveCityArray[659] = new Array("659", "希尔顿黑德", "XIERDUNHEIDE");
	arriveCityArray[660] = new Array("660", "莱克哈瓦苏城", "LAIKEHAWASUCHENG");
	arriveCityArray[661] = new Array("661", "檀香山", "TANXIANGSHAN");
	arriveCityArray[662] = new Array("662", "休斯敦", "XIUSIDUN");
	arriveCityArray[663] = new Array("663", "韦斯特切斯特郡", "WEISITEQIESITEJUN");
	arriveCityArray[664] = new Array("664", "哈灵根", "HALINGGEN");
	arriveCityArray[665] = new Array("665", "亨茨韦尔", "HENGCIWEIER");
	arriveCityArray[666] = new Array("666", "亨廷登", "HENGTINGDENG");
	arriveCityArray[667] = new Array("667", "纽黑文", "NIUHEIWEN");
	arriveCityArray[668] = new Array("668", "西亚尼斯", "XIYANISI");
	arriveCityArray[669] = new Array("669", "海斯", "HAISI");
	arriveCityArray[670] = new Array("670", "威奇托", "WEIQITUO");
	arriveCityArray[671] = new Array("671", "威尔明顿", "WEIERMINGDUN");
	arriveCityArray[672] = new Array("672", "印第安纳波利斯", "YINDIANNABOLISI");
	arriveCityArray[673] = new Array("673", "威廉斯波特", "WEILIANSIBOTE");
	arriveCityArray[674] = new Array("674", "威利斯顿", "WEILISIDUN");
	arriveCityArray[675] = new Array("675", "伊斯利普", "YISILIPU");
	arriveCityArray[676] = new Array("676", "伊萨卡", "YISAKA");
	arriveCityArray[677] = new Array("677", "希洛", "XILUO");
	arriveCityArray[678] = new Array("678", "因约肯", "YINYUEKEN");
	arriveCityArray[679] = new Array("679", "杰克逊", "JIEKEXUN");
	arriveCityArray[680] = new Array("680", "杰克逊", "JIEKEXUN");
	arriveCityArray[681] = new Array("681", "杰克逊维尔", "JIEKEXUNWEIER");
	arriveCityArray[682] = new Array("682", "卡帕鲁阿", "KAPALUA");
	arriveCityArray[683] = new Array("683", "詹姆斯敦", "ZHANMUSIDUN");
	arriveCityArray[684] = new Array("684", "约翰斯敦", "YUEHANSIDUN");
	arriveCityArray[685] = new Array("685", "科纳", "KENA");
	arriveCityArray[686] = new Array("686", "兰辛", "LANXIN");
	arriveCityArray[687] = new Array("687", "拉勒米", "LALEMI");
	arriveCityArray[688] = new Array("688", "拉斯维加斯", "LASIWEIJIASI");
	arriveCityArray[689] = new Array("689", "洛杉矶", "LUOSHANJI");
	arriveCityArray[690] = new Array("690", "拉伯克", "LABOKE");
	arriveCityArray[691] = new Array("691", "拉特罗布", "LATELUOBU");
	arriveCityArray[692] = new Array("692", "北普拉特", "BEIPULATE");
	arriveCityArray[693] = new Array("693", "利伯勒尔", "LIBOLEER");
	arriveCityArray[694] = new Array("694", "莱克查尔斯", "LAIKECHAERSI");
	arriveCityArray[695] = new Array("695", "黎巴嫩", "LIBANEN");
	arriveCityArray[696] = new Array("696", "列克星敦", "LIEKEXINGDUN");
	arriveCityArray[697] = new Array("697", "拉斐特", "LAFEITE");
	arriveCityArray[698] = new Array("698", "长滩", "CHANGTAN");
	arriveCityArray[699] = new Array("699", "考爱岛", "KAOAIDAO");
	arriveCityArray[700] = new Array("700", "小石城", "XIAOSHICHENG");
	arriveCityArray[701] = new Array("701", "林肯", "LINKEN");
	arriveCityArray[702] = new Array("702", "拉奈岛", "LANAIDAO");
	arriveCityArray[703] = new Array("703", "刘易斯堡", "LIUYISIBAO");
	arriveCityArray[704] = new Array("704", "林奇堡", "LINQIBAO");
	arriveCityArray[705] = new Array("705", "米德兰", "MIDELAN");
	arriveCityArray[706] = new Array("706", "萨吉诺", "SAJINUO");
	arriveCityArray[707] = new Array("707", "麦库克", "MAIKUKE");
	arriveCityArray[708] = new Array("708", "孟菲斯", "MENGFEISI");
	arriveCityArray[709] = new Array("709", "麦克艾伦", "MAIKEAILUN");
	arriveCityArray[710] = new Array("710", "梅福德", "MEIFUDE");
	arriveCityArray[711] = new Array("711", "蒙哥马利", "MENGGEMALI");
	arriveCityArray[712] = new Array("712", "曼格顿", "MANGEDUN");
	arriveCityArray[713] = new Array("713", "曼彻斯特", "MANCHESITE");
	arriveCityArray[714] = new Array("714", "迈阿密", "MAIAMI");
	arriveCityArray[715] = new Array("715", "堪萨斯城", "KANSASICHENG");
	arriveCityArray[716] = new Array("716", "密尔沃基", "MIERWOJI");
	arriveCityArray[717] = new Array("717", "墨尔本", "MOERBEN");
	arriveCityArray[718] = new Array("718", "莫林", "MOLIN");
	arriveCityArray[719] = new Array("719", "门罗", "MENLUO");
	arriveCityArray[720] = new Array("720", "莫比尔", "MOBIER");
	arriveCityArray[721] = new Array("721", "莫德斯托", "MODESITUO");
	arriveCityArray[722] = new Array("722", "蒙特雷", "MENGTELEI");
	arriveCityArray[723] = new Array("723", "麦迪逊", "MAIDIXUN");
	arriveCityArray[724] = new Array("724", "米苏拉", "MISULA");
	arriveCityArray[725] = new Array("725", "明尼阿波利斯", "MINGNIABOLISI");
	arriveCityArray[726] = new Array("726", "马塞纳", "MASAINA");
	arriveCityArray[727] = new Array("727", "新奥尔良", "XINAOERLIANG");
	arriveCityArray[728] = new Array("728", "蒙特罗斯", "MENGTELUOSI");
	arriveCityArray[729] = new Array("729", "莫特尔比奇", "MOTEERBIQI");
	arriveCityArray[730] = new Array("730", "纽约", "NIUYUE");
	arriveCityArray[731] = new Array("731", "杰克逊维尔", "JIEKEXUNWEIER");
	arriveCityArray[732] = new Array("732", "奥克兰", "AOKELAN");
	arriveCityArray[733] = new Array("733", "诺福克", "NUOFUKE");
	arriveCityArray[734] = new Array("734", "卡胡卢伊", "KAHULUYI");
	arriveCityArray[735] = new Array("735", "奥格登斯堡", "AOGEDENGSIBAO");
	arriveCityArray[736] = new Array("736", "俄克拉荷马城", "EKELAHEMACHENG");
	arriveCityArray[737] = new Array("737", "奥马哈", "AOMAHA");
	arriveCityArray[738] = new Array("738", "安大略", "ANDALVE");
	arriveCityArray[739] = new Array("739", "诺福克", "NUOFUKE");
	arriveCityArray[740] = new Array("740", "奥兰多", "AOLANDUO");
	arriveCityArray[741] = new Array("741", "奥克斯纳德", "AOKESINADE");
	arriveCityArray[742] = new Array("742", "西棕榈滩", "XIZONGLVTAN");
	arriveCityArray[743] = new Array("743", "波特兰", "BOTELAN");
	arriveCityArray[744] = new Array("744", "帕纳马城", "PANAMACHENG");
	arriveCityArray[745] = new Array("745", "佩奇", "PEIQI");
	arriveCityArray[746] = new Array("746", "格林维尔", "GELINWEIER");
	arriveCityArray[747] = new Array("747", "汉普顿", "HANPUDUN");
	arriveCityArray[748] = new Array("748", "费城", "FEICHENG");
	arriveCityArray[749] = new Array("749", "凤凰城", "FENGHUANGCHENG");
	arriveCityArray[750] = new Array("750", "皮奥里亚", "PIAOLIYA");
	arriveCityArray[751] = new Array("751", "皮埃尔", "PIAIER");
	arriveCityArray[752] = new Array("752", "匹兹堡", "PIZIBAO");
	arriveCityArray[753] = new Array("753", "帕克斯堡", "PAKESIBAO");
	arriveCityArray[754] = new Array("754", "彭萨科拉", "PENGSAKELA");
	arriveCityArray[755] = new Array("755", "普雷斯克岛", "PULEISIKEDAO");
	arriveCityArray[756] = new Array("756", "普雷斯克特", "PULEISIKETE");
	arriveCityArray[757] = new Array("757", "帕斯科", "PASIKE");
	arriveCityArray[758] = new Array("758", "帕姆斯普林斯", "PAMUSIPULINSI");
	arriveCityArray[759] = new Array("759", "普埃布罗", "PUAIBULUO");
	arriveCityArray[760] = new Array("760", "普罗维登斯", "PULUOWEIDENGSI");
	arriveCityArray[761] = new Array("761", "波特兰", "BOTELAN");
	arriveCityArray[762] = new Array("762", "拉皮德城", "LAPIDECHENG");
	arriveCityArray[763] = new Array("763", "雷丁", "LEIDING");
	arriveCityArray[764] = new Array("764", "雷丁", "LEIDING");
	arriveCityArray[765] = new Array("765", "雷德蒙德", "LEIDEMENGDE");
	arriveCityArray[766] = new Array("766", "罗利", "LUOLI");
	arriveCityArray[767] = new Array("767", "里士满", "LISHIMAN");
	arriveCityArray[768] = new Array("768", "里弗顿", "LIFUDUN");
	arriveCityArray[769] = new Array("769", "罗克兰", "LUOKELAN");
	arriveCityArray[770] = new Array("770", "罗克斯普林斯", "LUOKESIPULINSI");
	arriveCityArray[771] = new Array("771", "里诺", "LINUO");
	arriveCityArray[772] = new Array("772", "罗阿诺克", "LUOANUOKE");
	arriveCityArray[773] = new Array("773", "罗切斯特", "LUOQIESITE");
	arriveCityArray[774] = new Array("774", "圣菲", "SHENGFEI");
	arriveCityArray[775] = new Array("775", "圣迭戈", "SHENGDIEGE");
	arriveCityArray[776] = new Array("776", "圣安东尼奥", "SHENGANDONGNIAO");
	arriveCityArray[777] = new Array("777", "萨凡纳", "SAFANNA");
	arriveCityArray[778] = new Array("778", "圣巴巴拉", "SHENGBABALA");
	arriveCityArray[779] = new Array("779", "南本德", "NANBENDE");
	arriveCityArray[780] = new Array("780", "萨里斯波里—欧申城", "SALISIBOLI-OUSHENCHENG");
	arriveCityArray[781] = new Array("781", "斯泰特克利奇", "SITAITEKELIQI");
	arriveCityArray[782] = new Array("782", "斯托克顿", "SITUOKEDUN");
	arriveCityArray[783] = new Array("783", "路易斯维尔", "LUYISIWEIER");
	arriveCityArray[784] = new Array("784", "西雅图", "XIYATU");
	arriveCityArray[785] = new Array("785", "三藩市", "SANFANSHI");
	arriveCityArray[786] = new Array("786", "斯普林菲尔德", "SIPULINFEIERDE");
	arriveCityArray[787] = new Array("787", "圣乔治", "SHENGQIAOZHI");
	arriveCityArray[788] = new Array("788", "斯汤顿", "SITANGDUN");
	arriveCityArray[789] = new Array("789", "谢里登", "XIELIDENG");
	arriveCityArray[790] = new Array("790", "什里夫波特", "SHILIFUBOTE");
	arriveCityArray[791] = new Array("791", "圣何塞", "SHENGHESAI");
	arriveCityArray[792] = new Array("792", "盐湖城", "YANHUCHENG");
	arriveCityArray[793] = new Array("793", "萨利纳", "SALINA");
	arriveCityArray[794] = new Array("794", "萨克拉门托", "SAKELAMENTUO");
	arriveCityArray[795] = new Array("795", "圣玛丽亚", "SHENGMALIYA");
	arriveCityArray[796] = new Array("796", "圣安娜", "SHENGANNA");
	arriveCityArray[797] = new Array("797", "斯普林菲尔德", "SIPULINFEIERDE");
	arriveCityArray[798] = new Array("798", "萨拉索塔", "SALASUOTA");
	arriveCityArray[799] = new Array("799", "圣路易斯", "SHENGLUYISI");
	arriveCityArray[800] = new Array("800", "纽堡", "NIUBAO");
	arriveCityArray[801] = new Array("801", "锡拉丘兹", "XILAQIUZI");
	arriveCityArray[802] = new Array("802", "特柳莱德", "TELIULAIDE");
	arriveCityArray[803] = new Array("803", "塔拉哈西", "TALAHAXI");
	arriveCityArray[804] = new Array("804", "托莱多", "TUOLAIDUO");
	arriveCityArray[805] = new Array("805", "坦帕", "TANPA");
	arriveCityArray[806] = new Array("806", "特伦顿", "TELUNDUN");
	arriveCityArray[807] = new Array("807", "塔尔萨", "TAERSA");
	arriveCityArray[808] = new Array("808", "图森", "TUSEN");
	arriveCityArray[809] = new Array("809", "特拉弗斯城", "TELAFUSICHENG");
	arriveCityArray[810] = new Array("810", "诺克斯维尔", "NUOKESIWEIER");
	arriveCityArray[811] = new Array("811", "维塞利亚", "WEISAILIYA");
	arriveCityArray[812] = new Array("812", "瓦尔帕莱索", "WAERPALAISUO");
	arriveCityArray[813] = new Array("813", "华盛顿", "HUASHENGDUN");
	arriveCityArray[814] = new Array("814", "沃兰", "WOLAN");
	arriveCityArray[815] = new Array("815", "苏圣玛丽", "SUSHENGMALI");
	arriveCityArray[816] = new Array("816", "纳莫奈", "NAMONAI");
	arriveCityArray[817] = new Array("817", "卡斯尔加", "KASIERJIA");
	arriveCityArray[818] = new Array("818", "迪尔莱克", "DIERLAIKE");
	arriveCityArray[819] = new Array("819", "埃德蒙顿", "AIDEMENGDUN");
	arriveCityArray[820] = new Array("820", "弗雷德里克顿", "FULEIDELIKEDUN");
	arriveCityArray[821] = new Array("821", "金斯顿", "JINSIDUN");
	arriveCityArray[822] = new Array("822", "哈里法克斯", "HALIFAKES");
	arriveCityArray[823] = new Array("823", "堪卢普斯", "KANLUPUSI");
	arriveCityArray[824] = new Array("824", "基洛纳", "JILUONA");
	arriveCityArray[825] = new Array("825", "麦克默里堡", "MAIKEMOLIBAO");
	arriveCityArray[826] = new Array("826", "蒙特利尔", "MENGTELIER");
	arriveCityArray[827] = new Array("827", "渥太华", "WOTAIHUA");
	arriveCityArray[828] = new Array("828", "鲁珀特王子城", "LUPOTEWANGZICHENG");
	arriveCityArray[829] = new Array("829", "魁北克", "KUIBEIKE");
	arriveCityArray[830] = new Array("830", "温莎", "WENSHA");
	arriveCityArray[831] = new Array("831", "蒙克顿", "MENGKEDUN");
	arriveCityArray[832] = new Array("832", "里贾纳", "LIJIANA");
	arriveCityArray[833] = new Array("833", "桑德贝", "SANGDEBEI");
	arriveCityArray[834] = new Array("834", "大草原城", "DACAOYUANCHENG");
	arriveCityArray[835] = new Array("835", "悉尼（加拿大)", "XINI");
	arriveCityArray[836] = new Array("836", "萨德伯里", "SADEBOLI");
	arriveCityArray[837] = new Array("837", "圣约翰堡", "SHENGYUEHANBAO");
	arriveCityArray[838] = new Array("838", "多伦多", "DUOLUNDUO");
	arriveCityArray[839] = new Array("839", "温哥华", "WENGEHUA");
	arriveCityArray[840] = new Array("840", "温伯尼", "WENBONI");
	arriveCityArray[841] = new Array("841", "克兰布鲁克", "KELANBULUKE");
	arriveCityArray[842] = new Array("842", "萨斯卡通", "SASIKATONG");
	arriveCityArray[843] = new Array("843", "圣约翰堡", "SHENGYUEHANBAO");
	arriveCityArray[844] = new Array("844", "乔治王子城", "QIAOZHIWANGZICHENG");
	arriveCityArray[845] = new Array("845", "特勒斯", "TELESI");
	arriveCityArray[846] = new Array("846", "伦敦", "LUNDUN");
	arriveCityArray[847] = new Array("847", "白马市", "BAIMASHI");
	arriveCityArray[848] = new Array("848", "卡尔加里", "KAERJIALI");
	arriveCityArray[849] = new Array("849", "史密瑟斯", "SHIMISESI");
	arriveCityArray[850] = new Array("850", "彭蒂克顿", "PENGDIKEDUN");
	arriveCityArray[851] = new Array("851", "夏洛特敦", "XIALUOTEDUN");
	arriveCityArray[852] = new Array("852", "维多利亚", "WEIDUOLIYA");
	arriveCityArray[853] = new Array("853", "圣约翰斯", "SHENGYUEHANSI");
	arriveCityArray[854] = new Array("854", "桑兹皮特", "SANGZIPITE");
	arriveCityArray[855] = new Array("855", "温得和克", "WENDEHEKE");
	arriveCityArray[856] = new Array("856", "基苏木", "JISUMU");
	arriveCityArray[857] = new Array("857", "桑给巴尔", "SANGGEIBAER");
	arriveCityArray[858] = new Array("858", "塔那那利佛", "TANANALIFO");
	arriveCityArray[859] = new Array("859", "鲸湾港", "JINGWANGANG");
	arriveCityArray[860] = new Array("860", "马塞卢", "MASAILU");
	arriveCityArray[861] = new Array("861", "维多利亚瀑布城", "WEIDUOLIYAPUBUCHENG");
	arriveCityArray[862] = new Array("862", "布拉瓦约", "BULAWAYUE");
	arriveCityArray[863] = new Array("863", "布兰太尔", "BULANTAIER");
	arriveCityArray[864] = new Array("864", "香港", "XIANGGANG");
	arriveCityArray[865] = new Array("865", "澳门", "AOMEN");
	arriveCityArray[866] = new Array("866", "台北", "TAIBEI");
	arriveCityArray[867] = new Array("867", "高雄", "GAOXIONG");
	arriveCityArray[868] = new Array("868", "泗水", "SISHUI");
	arriveCityArray[869] = new Array("869", "雅温德", "YAWENDE");
	arriveCityArray[870] = new Array("870", "哈科特港", "HAKETEKANG");
	arriveCityArray[871] = new Array("871", "阿布贾", "ABUJIA");
	arriveCityArray[872] = new Array("872", "特拉维夫－雅法", "TELAWEIFU-YAFA");
	arriveCityArray[873] = new Array("873", "阿斯塔纳", "ASITANA");
	arriveCityArray[874] = new Array("874", "辛菲罗波尔", "XINFEILUOBOER");
	arriveCityArray[875] = new Array("875", "克拉斯诺达尔", "KELASINUODAER");
	arriveCityArray[876] = new Array("876", "新西伯利亚", "XINXIBOLIYA");
	arriveCityArray[877] = new Array("877", "车里雅宾斯克", "CHELIYABINSIKE");
	arriveCityArray[878] = new Array("878", "古晋", "GUJIN");
	arriveCityArray[879] = new Array("879", "沙巴", "SHABA");
	arriveCityArray[880] = new Array("880", "阿克苏", "AKESU");
	arriveCityArray[881] = new Array("881", "阿尔泰", "AERTAI");
	arriveCityArray[882] = new Array("882", "安康", "ANKANG");
	arriveCityArray[883] = new Array("883", "安庆", "ANQING");
	arriveCityArray[884] = new Array("884", "梅县", "MEIXIAN");
	arriveCityArray[885] = new Array("885", "鞍山", "ANSHAN");
	arriveCityArray[886] = new Array("886", "安顺", "ANSHUN");
	arriveCityArray[887] = new Array("887", "安阳", "ANYANG");
	arriveCityArray[888] = new Array("888", "保山", "BAOSHAN");
	arriveCityArray[889] = new Array("889", "包头", "BAOTOU");
	arriveCityArray[890] = new Array("890", "北海", "BEIHAI");
	arriveCityArray[891] = new Array("891", "北京", "BEIJING");
	arriveCityArray[892] = new Array("892", "蚌埠", "BANGBU");
	arriveCityArray[893] = new Array("893", "长春", "CHANGCHUN");
	arriveCityArray[894] = new Array("894", "常德", "CHANGDE");
	arriveCityArray[895] = new Array("895", "长安", "CHANGAN");
	arriveCityArray[896] = new Array("896", "绵阳", "MIANYANG");
	arriveCityArray[897] = new Array("897", "长海", "CHANGHAI");
	arriveCityArray[898] = new Array("898", "长沙", "CHANGSHA");
	arriveCityArray[899] = new Array("899", "长治", "CHANGZHI");
	arriveCityArray[900] = new Array("900", "常州", "CHANGZHOU");
	arriveCityArray[901] = new Array("901", "朝阳", "CHAOYANG");
	arriveCityArray[902] = new Array("902", "潮州", "CHAOZHOU");
	arriveCityArray[903] = new Array("903", "成都", "CHENGDU");
	arriveCityArray[904] = new Array("904", "赤峰", "CHIFENG");
	arriveCityArray[905] = new Array("905", "重庆", "CHONGQING");
	arriveCityArray[906] = new Array("906", "大理", "DALI");
	arriveCityArray[907] = new Array("907", "大连", "DALIAN");
	arriveCityArray[908] = new Array("908", "丹东", "DANDONG");
	arriveCityArray[909] = new Array("909", "大同", "DATONG");
	arriveCityArray[910] = new Array("910", "达县", "DAXIAN");
	arriveCityArray[911] = new Array("911", "迪庆香格里拉", "DIQINGXIANGGELILA");
	arriveCityArray[912] = new Array("912", "东营", "DONGYING");
	arriveCityArray[913] = new Array("913", "敦煌", "DUNHUANG");
	arriveCityArray[914] = new Array("914", "恩施", "ENSHI");
	arriveCityArray[915] = new Array("915", "佛山", "FOSHAN");
	arriveCityArray[916] = new Array("916", "阜阳", "FUYANG");
	arriveCityArray[917] = new Array("917", "富蕴", "FUYUN");
	arriveCityArray[918] = new Array("918", "福州", "FUZHOU");
	arriveCityArray[919] = new Array("919", "赣州", "GANZHOU");
	arriveCityArray[920] = new Array("920", "格尔木", "GEERMU");
	arriveCityArray[921] = new Array("921", "广汉", "GUANGHAN");
	arriveCityArray[922] = new Array("922", "广州", "GUANGZHOU");
	arriveCityArray[923] = new Array("923", "桂林", "GUILIN");
	arriveCityArray[924] = new Array("924", "贵阳", "GUIYANG");
	arriveCityArray[925] = new Array("925", "海口", "HAIKOU");
	arriveCityArray[926] = new Array("926", "海拉尔", "HALAER");
	arriveCityArray[927] = new Array("927", "哈密", "HAMI");
	arriveCityArray[928] = new Array("928", "杭州", "HANGZHOU");
	arriveCityArray[929] = new Array("929", "汉中", "HANZHONG");
	arriveCityArray[930] = new Array("930", "哈尔滨", "HAERBIN");
	arriveCityArray[931] = new Array("931", "合肥", "HEFEI");
	arriveCityArray[932] = new Array("932", "黑河", "HEIHE");
	arriveCityArray[933] = new Array("933", "衡阳", "HENGYANG");
	arriveCityArray[934] = new Array("934", "和田", "HETIAN");
	arriveCityArray[935] = new Array("935", "呼和浩特", "HUHEHAOTE");
	arriveCityArray[936] = new Array("936", "黄山", "HUANGSHAN");
	arriveCityArray[937] = new Array("937", "黄岩", "HUANGYAN");
	arriveCityArray[938] = new Array("938", "徽州", "HUIZHOU");
	arriveCityArray[939] = new Array("939", "佳木斯", "JIAMUSI");
	arriveCityArray[940] = new Array("940", "吉安", "JIAN");
	arriveCityArray[941] = new Array("941", "嘉峪关", "JIAYUGUAN");
	arriveCityArray[942] = new Array("942", "牡丹江", "MUDANJIANG");
	arriveCityArray[943] = new Array("943", "吉林", "JILIN");
	arriveCityArray[944] = new Array("944", "济南", "JINAN");
	arriveCityArray[945] = new Array("945", "景德镇", "JINGDEZHEN");
	arriveCityArray[946] = new Array("946", "济宁", "JINING");
	arriveCityArray[947] = new Array("947", "南昌", "NANCHANG");
	arriveCityArray[948] = new Array("948", "晋江", "JINJIANG");
	arriveCityArray[949] = new Array("949", "锦州", "JINZHOU");
	arriveCityArray[950] = new Array("950", "九江", "JIUJIANG");
	arriveCityArray[951] = new Array("951", "酒泉", "JIUQUAN");
	arriveCityArray[952] = new Array("952", "九寨沟", "JIUZHAIGOU");
	arriveCityArray[953] = new Array("953", "克拉玛依", "KELAMAYI");
	arriveCityArray[954] = new Array("954", "喀什", "KASHI");
	arriveCityArray[955] = new Array("955", "库尔勒", "KUERLE");
	arriveCityArray[956] = new Array("956", "南充", "NANCHONG");
	arriveCityArray[957] = new Array("957", "南京", "NANJING");
	arriveCityArray[958] = new Array("958", "南宁", "NANNING");
	arriveCityArray[959] = new Array("959", "南通", "NANTONG");
	arriveCityArray[960] = new Array("960", "南阳", "NANYANG");
	arriveCityArray[961] = new Array("961", "宁波", "NINGBO");
	arriveCityArray[962] = new Array("962", "库车", "KUCHE");
	arriveCityArray[963] = new Array("963", "昆明", "KUNMING");
	arriveCityArray[964] = new Array("964", "攀枝花", "PANZHIHUA");
	arriveCityArray[965] = new Array("965", "兰州", "LANZHOU");
	arriveCityArray[966] = new Array("966", "拉萨", "LASA");
	arriveCityArray[967] = new Array("967", "且末", "QIEMO");
	arriveCityArray[968] = new Array("968", "梁平", "LIANGPING");
	arriveCityArray[969] = new Array("969", "连云港", "LIANYUNGANG");
	arriveCityArray[970] = new Array("970", "旧金山", "JIUJINSHAN");
	arriveCityArray[971] = new Array("971", "隆目", "LONGMU");
	arriveCityArray[972] = new Array("972", "加尔各答", "JIAERGEDA");
	arriveCityArray[973] = new Array("973", "马尔代夫", "MAERDAIFU");
	arriveCityArray[974] = new Array("974", "卡拉奇", "KALAQI");
	arriveCityArray[975] = new Array("975", "关岛", "GUANDAO");
	arriveCityArray[976] = new Array("976", "苏梅岛", "SUMEIDAO");
	arriveCityArray[977] = new Array("977", "大豆", "DADOU");
	arriveCityArray[978] = new Array("978", "玉米", "YUMI");

		
	window.onload = function(){
		$quickQuery(arriveCityArray);
	}
</script>
 


<div>

	<div id="n1">
		<label for="q1">商品名称:</label>
		<input class="quickQuery$focus" id="q1" style="border: 3px solid #ccc;" />
		<button id="select1">查询</button>
    </div>
    
    <div class="quickQuery$focus" "></div>	
</div>
	


<style type="text/css">

#quickQuery_container { 
    left: 250px ! important;
    top: 98px ! important;
    z-index: 99;
    display: block;
    }
</style>
	
	
	

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
	border: 5px solid #abc;
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
					<tbody>
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

		<div class="row">
			<div class="col-md-9" id="save_product" >
				<form class="form-horizontal" modelAttribute="billDetail">
					<table id="table2" class="">
						<tbody>
							<tr class="tr">
								<th><input type="text" id="ad0"  size="15" /></th>
								<input type="hidden" id="ad1" size="15">
								<th><select id="ad2" class="form-control se2"
									name="productname" style="width: 120px;" /></th>
								<th><input type="text" id="ad3" size="16" readonly="readonly"/></th>
								<th><input type="text" id="ad4" size="17"></th>
								<th><input type="text" id="ad5" size="17" readonly="readonly"/></th>
								<th><input type="text" id="ad6" size="17" readonly="readonly"/></th>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="btn btn-primary glyphicon glyphicon-plus" id="yes_btn" style="margin-top:4px;" >确定</div>
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
				$("#ad2").val([ info.id ]); 
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





