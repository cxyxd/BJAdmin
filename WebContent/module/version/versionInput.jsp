<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../../css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../../css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="../../js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../../js/app.v2.js"></script>
</head>
<body>
	<%@ include file="../../navHead3.jsp" %>
	<div class="col-lg-7">
	<h3>提交新版本</h3>
	<br>
	 <!-- enctype 默认是 application/x-www-form-urlencoded -->  
     <form id="insert" action="insert" enctype="multipart/form-data" method="post" >  
          
                版本介绍：<input type="text" name="version.versionMsg"> <br/>  
               上传apk文件：<input type="file" name="file1"><br/>  
                 <input type="submit" value="提交"/>  
       
     </form>  
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
		              <button
								onclick="javascript:parent.location.href='getHistory'"
								type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>
	
	</div>
	<!-- jQuery -->
	<script	src="../../resources/bower_components/jquery/dist/jquery.min.js"></script>

	<script src="../../resources/js/jquery.validate.min.js"></script>
	<script src="../../resources/js/messages_zh.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<script>
	
	$().ready(function() {	
		// validate signup form on keyup and submit
	
	</script>
	<%@ include file="../../navTail.jsp" %>
</body>
</html>