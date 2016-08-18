<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<div class="col-lg-7">
	<h3>业务员账号注册</h3>
	<br>
	<form method="post" id="insertClient">  
		
       <input  name="appClient.type" value="1"  style="display:none"   >
                                     
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名" name="appClient.userName"  
                                     autofocus>
                                </div>
                                
	
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" 
                                   name="appClient.password" id="password" type="password" >
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="重新输入密码"
                                 name="confirm_password" type="password" >
                                </div>
									
                                <div class="form-group">
                                    <input class="form-control" placeholder="身份证号" 
                                  name="appClient.idCard" >
                                </div>
                                
                                 <div class="form-group">
                                    <input class="form-control" placeholder="管理区域" 
                                  name="appClient.area" >
                                </div>
                                
                                			
                                <div class="form-group">
                                    <input class="form-control" placeholder="电话" 
                                 name="appClient.phone"  >
                                </div>
                                
                                							
                                <div class="form-group">
                                    <input class="form-control" placeholder="姓名" 
                                   name="appClient.trueName" type="text" >
                                </div>
                             
                             
                                <label class="radio-inline">
                                        <input type="radio" name="appClient.sex" id="optionsRadiosInline1" value="男" checked="">男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="appClient.sex" id="optionsRadiosInline2" value="女">女
                                    </label>
                             
                               

                                <div class="form-group">
                                    <input class="form-control" placeholder="地址" name="appClient.address" 
                                    type="text" value="">
                                </div>
  		<br>
	  	<button type="submit" class="btn btn-large btn-success">注册</button>
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
		               <button  onclick="javascript:window.location.href='getAllAppClent'"
										type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>
	</form>
	</div>
	
	<!-- jQuery -->
	<script	src="../../resources/bower_components/jquery/dist/jquery.min.js"></script>

	<script src="../../resources/js/jquery.validate.min.js"></script>
	<script src="../../resources/js/messages_zh.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<script>
	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#insertClient").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'insertClient',
    				data:$('#insertClient').serialize(),
    				type:"POST",
    				success:function(data2){
    					var data;
     					 try {
     						  data = $.parseJSON(data2);
     						}   catch  (e)   {
     						    alert("网络异常 请重新登陆");
     						} 
     						
   				
   	              		  if(data.resultcode == "200"){
    	    				txtHtml="<p class='text-warning'>" + data.info + "</p>";
    	                }else{
    	                	txtHtml="<p class='text-warning'>" + data.info + "</p>";
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