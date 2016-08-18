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
	<h3>注册企业账号</h3>
	<br>
	<form action="insertBranch" id="insertBranch" method="post" > 
		 <input  name="appClient.type" value="2"  style="display:none"   >
		 <input  name="appClient.companyId" value="${branchCompany.id}"  style="display:none"   >
		 <input  name="appClient.usedCount" value="0"  style="display:none"   >

		<div class="form-group">
			<label >用户名</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入客户名称'}" id="name1" 
			   placeholder="请输入用户名" name="appClient.userName"/>
		</div>
		<div class="form-group">
			<label>密码</label>
			<input class="form-control" id="password" placeholder="请输入密码" name="appClient.password">
		</div>
		<div class="form-group">
			<label>确认密码</label>
			<input class="form-control"   name="confirm_password" placeholder="请输入密码" >
		</div>
		<div class="form-group">
			<label>电话</label>
			<input class="form-control" placeholder="请输入电话" name="appClient.phone">
		</div>
		<div class="form-group">
			<label>公司名称</label>
			<input class="form-control" placeholder="请输入公司名称" name="appClient.companyName">
		</div>
		<div class="form-group">
			<label>业务员数量</label>
			<input class="form-control" placeholder="请输入业务员数量" name="appClient.appCount">
		</div>
  		<br>
	  	<button type="submit" class="btn btn-large btn-success">提交</button>
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
								onclick="javascript:parent.location.href='../../module/appclient/getAllBranch'"
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
		$("#insertBranch").validate({
			rules: {
				'appClient.password' : {
					required: true,
					minlength: 6
				},
				'confirm_password': {
					required: true,
					equalTo: "#password"
				}
			},
			messages: {
				'confirm_password': {
					required: "请确认密码",
					equalTo: "两次输入的密码要相同" 
				}

				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'insertBranch',
    				data:$('#insertBranch').serialize(),
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