<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../../css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../../js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../../js/app.v2.js"></script>
</head>
<body>
	
	<script type="text/javascript">  
	function initialize() { 
		var data = eval('(${resultObj})'); 
		var mp = new BMap.Map('map');  
		var point = new BMap.Point(108.94, 34.27);
		mp.centerAndZoom(point, 11);  
		mp.addControl(new BMap.NavigationControl());    
		mp.addControl(new BMap.ScaleControl());    
		mp.addControl(new BMap.OverviewMapControl());    
		mp.enableScrollWheelZoom();
			
		var marker = new Array();
				
		for (var i = 0; i < data.result.length; i++) {
			var point1 = new BMap.Point(data.result[i].longitude, data.result[i].latitude);
			marker[i] = new BMap.Marker(point1); 
			marker[i].setTitle(data.result[i].customerName);	
			mp.addOverlay(marker[i]);
		}
	}  
	   
	function loadScript() {  
	  var script = document.createElement("script");  
	  script.src = "http://api.map.baidu.com/api?v=2.0&ak=FXmQCEnVoHuSR5nYfX40C7Sp&callback=initialize";//此为v1.5版本的引用方式  
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
	<div class="panel panel-default">
        <div class="panel-heading">
            销售拜访记录查看
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>客户名称</th>
                            <th>时间</th>
                            <th>拜访记录内容</th>
                            <th>查看照片</th>
                            <c:if test="${branchCompany.type==1}">
                            <th>操作 </th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${list}" var="recoreds" varStatus="s">
									<tr>
										<td><c:out value="${s.index+1}" /></td>
										<td><c:out value="${recoreds.customerName}" /></td>
										<td><c:out value="${recoreds.date}" /></td>
										<td><c:out value="${recoreds.msg}" /></td>

										<td>
											<a href="../visit/getPic.jsp?visitId=${recoreds.id}"	
													class="btn btn-info btn-xs" target="_blank"> 
													<i	class="fa fa-linkedin-square"></i>
											  查看图片</a>
										</td>
										
										<c:if test="${branchCompany.type==1}">
										<td>
												<a onclick="deleteByID(${recoreds.id})" href="javascript:void(0)" 
 											class="btn btn-danger btn-xs">
                                			    <i class="fa fa-trash-o"></i>
                                			    删除</a>
                                	     </td>
										</c:if>
										
									</tr>
								</c:forEach>
                    </tbody>
                </table>
                <div id="page-selection" style="float: right;"></div>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
    </div>
    
     <!--弹出显示框-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">提示</h4>
		            </div>
		            <div class="modal-body">
		           		<div id="result"></div>
		            </div>
		            <div class="modal-footer">
						  <button  onclick="javascript:parent.location.href='../map/searchTop.jsp'"
										type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>
    <script src="../../js/jquery.bootpag.js"></script>
    
    
  
    <script type="text/javascript">
    
 function deleteByID(myid) {
        
        $.ajax({
			url:'delete?id='+myid,
			type:"POST",
			success:function(data2){
				var data;
					 try {
						  data = $.parseJSON(data2);
						}   catch  (e)   {
						    alert("网络异常 请重新登陆");
						} 
	                if(data.resultcode == "200"){
	                	txtHtml="<p class='text-info'>拜访信息删除成功</p>";
	                }else{
	                	txtHtml="<p class='text-warning'>拜访删除失败 </p>";
	                }
	                $("#result").html(txtHtml);
    				$("#myModal").modal("show");
            
            }
		});
    }


$('#page-selection').bootpag({
    total: ${
    	totalPage
    },
    page: ${
    	currentPage
    },
    maxVisible: 5,
    leaps: true,
    firstLastUse: true,
    first: '←',
    last: '→',
    wrapClass: 'pagination',
    activeClass: 'active',
    disabledClass: 'disabled',
    nextClass: 'next',
    prevClass: 'prev',
    lastClass: 'last',
    firstClass: 'first'
}).on("page",
function(event,
/* page number here */
num) {
    //  $("#content").html("Insert content"+num); // some ajax content loading...
    var url="getAllVisit.action?byPage=ture&currentPage=" + num + "";
//    var type='${customer.type}';
//    var customerName='${customer.type}';
//    var clientName='${clientName}';
///    if(type!="")
//    	url+="customer.type="+type;
//    if(customerName!="")
//        url+="customer.name="+customerName;
//    if(clientName!="")
//        url+="clientName="+clientName;
//    alert(url);
    location.href = url;

});
</script>

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

</body>
</html>

