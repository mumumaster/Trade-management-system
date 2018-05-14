


$("input[type=button]").on("click",function(){

		var cityName=document.querySelector("#cityName").value;
		//跨域是浏览器的安全策略.
		//我现在是jQuery ，jQuery 怎么去解决
		//jQuery 解决的方式.
		$.ajax({
				url:"http://api.map.baidu.com/telematics/v3/weather",
				type:"get",
				data:{
					  location:cityName,
					  output:'json',
					  ak:'6tYzTvGZSOpYB5Oc2YGGOKt8'
				},
				/*预期服务器端返回的数据类型，假设我现在跨域了，我就改成jsonp 就可以了 */
			dataType:"jsonp",
			success:function(data){
				console.log(data)
				//百度那边的 数据已经回来，我现在要解析这个数据.
				var weatherData=data.results[0].weather_data;
				var obj={
					list:weatherData
				}
				
				console.log(obj);
				
				var html=obj.list[0].date + "  "
					
				+ "<img src="+obj.list[0].dayPictureUrl +">" + "  "

				+ "<img src="+obj.list[0].nightPictureUrl +">" + "  "

				+ obj.list[0].temperature + "  "

				+ obj.list[0].weather +"  "

				+ obj.list[0].wind;				    

				document.querySelector("#city").innerHTML=html;

			}
		})


})