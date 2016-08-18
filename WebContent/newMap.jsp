<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="js/app.v2.js"></script>
</head>
<body>
	<%@ include file="navHead.jsp" %>
	<script type="text/javascript">  
	function initialize() {  
	//	var data = eval('(${data})'); 

		var mp = new BMap.Map('map');  
		var point = new BMap.Point(108.94, 34.27);
		mp.centerAndZoom(point, 11);  
		mp.addControl(new BMap.NavigationControl());    
		mp.addControl(new BMap.ScaleControl());    
		mp.addControl(new BMap.OverviewMapControl());    
		mp.enableScrollWheelZoom();
		mp.enableAutoResize();
		
		var marker = new Array();		
		 for (var i = 0; i < data.result.length; i++) {
		 	var point1 = new BMap.Point(data.result[i].latitude, data.result[i].longitude);
		 	marker[i] = new BMap.Marker(point1); 
		 	mp.addOverlay(marker[i]);		
		 	marker[i].setTitle(data.result[i].customerName);				 
		 }
	}  
	   
	function loadScript() {  
	  var script = document.createElement("script");  
	  script.src = "http://api.map.baidu.com/api?v=1.5&ak=FXmQCEnVoHuSR5nYfX40C7Sp&callback=initialize";//此为v1.5版本的引用方式  
	  document.body.appendChild(script);  
	}     
	window.onload = loadScript;  
	</script>  			
	<br>
	<div class="panel panel-success" >
		<div class="panel-heading">
			地图显示
		</div>
		<div class="panel-body"id="mapPanel">
			<div id="map" style="width:1000px;height:620px"></div>  
		</div>
	</div>
	<script>
	function adaptMap() {
		var width = $("#mapPanel").width();
		var height = $("#mapPanel").height();
		document.getElementById("map").style.width = width+"px";
		document.getElementById("map").style.height = height+"px";
	}
	adaptMap();
	window.addEventListener("resize", function () {  
	    adaptMap();
	}, true);  
	</script>
	<%@ include file="navTail.jsp" %>

</body>
</html>