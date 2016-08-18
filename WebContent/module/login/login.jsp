<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="bg-dark">
<head> 
	<meta charset="utf-8" /> 
	<title>毕加数据</title> 
	<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" /> <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
	<link rel="stylesheet" href="/BJAdmin/css/app.v2.css" type="text/css" /> 
	<script src="/BJAdmin/js/app.v2.js"></script>
	    <script src="<%=request.getContextPath() %>/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="/BJAdmin/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script 
		src="/BJAdmin/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="/BJAdmin/resources/js/jquery.validate.min.js"></script>
</head>
<body> 
	<section id="content" class="m-t-lg wrapper-md animated fadeInUp"> 
		<div class="container aside-xxl"> 
			<a class="navbar-brand block" > <font size="6">毕加数据</font></a> 
			<font size="4"  style="padding-left: 141px;">提升水泥销售业绩</font>
			
		
			<section class="panel panel-default bg-white m-t-lg"> 
				<header class="panel-heading text-center"> 
					<strong>登录</strong> 
				</header>  
				<form action="" id="login" role="form" class="panel-body wrapper-lg" method="post"> 
					<div class="form-group"> 
						<label class="control-label">账号</label> 
						<input placeholder="请输入账号" name="user.userName" class="form-control input-lg"> 
					</div> 
					<div class="form-group"> <label class="control-label">密码</label> 
					<input type="password" id="inputPassword" placeholder="请输入密码" name="user.password" class="form-control input-lg"> 
					<br> 
					<button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
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
					                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					            </div>
					        </div>
					        <!-- /.modal-content -->
					    </div>
					</div>
				</form> 
			</section> 
		</div> 
	</section> 
	<!-- footer --> 
	<footer id="footer"> 
		<div class="text-center padder"> 
			<p> <small>毕加数据@2015<br></small> </p> 
		</div> 
	</footer>
	
	
	<script type="text/javascript"> 
	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#login").validate({
			rules: {
				'user.userName': {
					required: true,

				},
				'user.password': {
					required: true,
					minlength: 3
				}
			},
			messages: {
				'user.userName': "请输入用户名",
				'user.password': {
					required: "请输入密码",
					minlength: "密码至少3个字符"
				}
			},
			submitHandler:function(form){
    		    var txtHtml;
    			 var curWwwPath=window.document.location.href;
    			   //获取主机地址之后的目录，如： myproj/view/my.jsp
    			  var pathName=window.document.location.pathname;
    			  var pos=curWwwPath.indexOf(pathName);
    			  //获取主机地址，如： http://localhost:8083
    			  var localhostPaht=curWwwPath.substring(0,pos);
    			  //获取带"/"的项目名，如：/myproj
    			  var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    			 
    			 //得到了 http://localhost:8083/myproj
    			  var realPath=localhostPaht+projectName;
    			$.ajax({
    				url:realPath+'/module/login/login',
    				data:$('#login').serialize(), 
    				type:"POST",
    				success:function(data){
    					
    					var json;
    					 try {
    							json = $.parseJSON(data);
    						}   catch  (e)   {
    						    alert("网络异常 请重新登陆");
    						} 
    					
    	                if(json.resultcode=="200"){
    	    				window.location.href=json.url;
    	                }else{
    	                	txtHtml="<p class='text-warning'>" + json.info + "</p>";
        					$("#result").html(txtHtml);
        					$("#myModal").modal("show");
    	                }

    	            }
    			});
	        }
		});
	});
	</script>
</body>

</html>