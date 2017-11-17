<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path1 = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>航线选图</title>
<script src="<%=basePath%>scripts/gis/js/jquery.js"></script>
<script src="<%=basePath%>scripts/gis/js/bootstrap.min.js"></script>
<script src="<%=basePath%>scripts/gis/js/jquery-ui.js"></script>
<script src="<%=basePath%>scripts/gis/js/ol.js"></script>
<link rel="stylesheet" href="<%=basePath%>styles/gis/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>styles/gis/css/ol.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>styles/gis/css/jquery-ui/themes/smoothness/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>styles/gis/css/main.css" type="text/css">
</head>
<body>
	<div id="mapcontainer">
		<div id="map" tabindex="1"></div>
		<div id="progress"></div>
		<div class="maptoolbar ol-unselectable ol-control"></div>
	</div>
</body>
<script src="<%=basePath%>scripts/gis/js/main.js"></script>
<script src="<%=basePath%>scripts/gis/js/list.js"></script>
<script src="<%=basePath%>scripts/gis/js/jquery.fixedheadertable.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>styles/gis/css/fixedheadertable.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>styles/gis/css/fixedheadertable.my.css" type="text/css">


<script>
   
   $(function(){
	   var tmp = '${list}'; 
	   var ordernumber = '${ordernum}'; 
	   displayMap(tmp,ordernumber);
   })
 	
 
/**
 * map里选中船只时触发
 */
function onSelectShip(id) {
	alert(id);
}

// 在map里的工具条上加个按钮
addToolbarButton("显示订单的航线", "<img src='styles/gis/images/view.png'>", function() {
	//var route = {"id": "rou-c8b30ad9-35fe-9b8a-90db-1b9cf571bbda","coords": [[113.20353124999997,22.999098137991353],[114.14835546874998,22.10624694432596],[115.18107031249998,20.90012155827489],[117.64200781249998,19.497916642494445],[121.21020026748329,19.50466356530677],[125.12133307998329,17.755758440632192],[127.51635261123329,16.958826829009652],[128.2853955799833,14.079847347534084],[128.37328620498326,10.775850313246266],[127.97777839248327,9.91123603410746],[127.40648932998327,10.214120833729893],[127.0768994862333,11.228793566250062],[125.80248542373327,11.228793566250062]]}; 
	//{"id":"rou-d5758051-92d8-9576-a397-a0ffd03276f0","coords":[[-239.13499644386113,27.775846041522897],[-233.77366831886113,23.094823303357188],[-221.4689808188611,17.24042724337717],[-179.00024303008922,16.0672123489513],[-131.1877430300892,15.220873585766185],[-106.49047740508922,21.63727934218211]]};
	//alert("Hi");
	//! displayRoute 一个函数。回显一条航线
	//displayRoute(route.id, route.coords, "测试一下"); 
	//removeShip("mytest");
	getAllLine();
});



addToolbarButton("定位船只", "<img src='styles/gis/images/find.png'>", function() {
	//! displayShip 一个函数。
	displayShip("mytest", [0, 0], "起帆号");
	
	//removeRoute("rou-c8b30ad9-35fe-9b8a-90db-1b9cf571bbda");
});
 
//!!
//!! ------------------- 函数表 --------------------
//!!
//!! #1 onSelectSeachart	- 航线选海图时触发
//!! #2 onSelectShip		- map里选中船只时触发
//!! #3 addToolbarButton	- 在map里的工具条上加个按钮
//!! #4 displayRoute		- 回显一条航线
//!! #5 removeRoute			- 删除一条航线。注，不带参数表示删掉全部航线
//!! #6 displayShip			- 显示一条船
//!! #7 removeShip			- 删除一条船。注，不带参数表示删掉全部船
//!! #8 highlightChart		- 高亮显示海图区
//!! #9 showDialog			- 在map里显示一个dialog
//!!
//!! 注，函数的例子见上
//!!
 
	 
</script>
<div id="dialog">
	<div style="height: 250px;width:700px">
	<table id="charts" class="fancyTable" style="display:none;">  
	 		<tr class="header"> 
	 			<td class="csm">序号</td>
				<td>类型</td>
	       		<td>图号</td> 
				<td>图标题</td> 
	  			<td>图比例尺</td>  
				<td>周期
					<select onchange="changePeriod(this)" class="period">
						<option value="1">1</option><option value="2">2</option>
						<option value="3">3</option><option value="4">4</option>
						<option value="5">5</option><option value="6">6</option>
						<option value="7">7</option><option value="8">8</option>
						<option value="9">9</option><option value="10">10</option>
						<option value="11">11</option><option value="12">12</option> 
					</select>
				</td> 
				<td id="head_number">张数</td> 
				<td>高亮</td> 
			</tr> 
	</table>
	
	 
	</div>
</div>
<div id="alert"></div>
<div id="ask"></div>

</html>