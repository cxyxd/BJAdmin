<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<c:choose>
		<c:when test="${branchCompany.type==1}">
				<%@ include file="../../navHead.jsp" %>  <!--  业务员 -->
        </c:when>
		<c:when test="${branchCompany.type==2}">
				<%@ include file="../../navHead2.jsp" %> <!--  分公司 -->
        </c:when>
        <c:when test="${branchCompany.type==3}">
				<%@ include file="../../navHead3.jsp" %> <!--  总公司 -->
        </c:when>
	</c:choose>
	
    <div class="col-lg-6">
        <br>
	<section class="panel panel-info portlet-item"> 
        <header class="panel-heading"> 企业账号 </header> 
        <form id="branchDetail"  method="post" sytle="display:"> 
        
         <input class="form-control"  value="${appClient.id}" style="display:none" name="user.id">
          <input class="form-control"  value="2" style="display:none" name="user.type">
                
                
        <div class="list-group bg-white" style="font-size:18px"> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-envelope"></i> 用户名：<div class="pull-right">
                <input class="form-control" placeholder="请输入用户名" value="${appClient.userName}" 
                style="border:0px; text-align:right; font-size:24px" disabled="disabled" name="user.userName">
                </div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-eye"></i> 密码:<div class="pull-right">
                <input class="form-control" placeholder="请输入密码" value="${appClient.password}" 
                style="border:0px; text-align:right; font-size:24px" name="user.password"></div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-phone"></i> 电话: <div class="pull-right">
                <input class="form-control" placeholder="请输入电话" value="${appClient.phone}" 
                style="border:0px; text-align:right; font-size:24px" name="user.phone"></div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-comments-o"></i> 公司名称: <div class="pull-right">
                <input class="form-control" placeholder="请输入公司名称" value="${appClient.companyName}" 
                style="border:0px; text-align:right; font-size:24px" disabled="disabled" name="user.companyName"></div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-comments-o"></i> 分配的App数: <div class="pull-right">
                <input class="form-control" placeholder="请输入分配的app数" value="${appClient.appCount}" 
                style="border:0px; text-align:right; font-size:24px" disabled="disabled" name="user.appCount"></div>
            </a> 
             <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-comments-o"></i> 业务员数量: <div class="pull-right">
                 <input class="form-control" placeholder="请输入分配的app数" value="${appClient.usedCount}" 
              		disabled="disabled" style="border:0px; text-align:right; font-size:24px" name="user.usedCount"></div>
            </a> 
            
         
	  		<button type="submit" class="btn btn-large btn-success">更改</button>
	
	  	
	  	<button onclick="javascript:parent.location.href='../../mainPage.jsp'"
									type="button" class="btn btn-large btn-danger"
												data-dismiss="modal">关闭</button>
        </div> 
        </form>
    </section>
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
							 <button  onclick="javascript:window.location.href='../appclient/getAllBranch'"
									type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>


	
	
		<!-- jQuery -->
	<script	src="../../resources/bower_components/jquery/dist/jquery.min.js"></script>

	<script src="../../resources/js/jquery.validate.min.js"></script>
	<script src="../../resources/js/messages_zh.min.js"></script>
	<script
	src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<script>

	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#branchDetail").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'totalUpdate',
    				data:$('#branchDetail').serialize(),
    				type:"POST",
    				success:function(data2){
    					var data;
     					 try {
     						  data = $.parseJSON(data2);
     						}   catch  (e)   {
     						    alert("网络异常 请重新登陆");
     						} 
     						
       	                if(data.resultcode == "200"){
       	                	txtHtml="<p class='text-info'> " + data.info + " </p>";
       	                }else{
       	                	txtHtml="<p class='text-warning'>更新失败 </p>";
       	                }
   	                $("#result").html(txtHtml);
       				$("#myModal").modal("show");
    	            }
    			});
	        }
		});
	});
	</script>
	<%@ include file="../../navTail.jsp" %>
</body>
</html>