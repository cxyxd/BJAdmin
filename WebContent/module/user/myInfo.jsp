<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="../../newPage/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../../newPage/css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="../../newPage/js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../../newPage/js/app.v2.js"></script>

<title>企业账号</title>


</head>

<body>
	<div id="wrapper">
         
		</div>	
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"> 公司账号信息</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="update" method="post" id="update" >
                            <fieldset>
                                 <div class="form-group" style="display:none">
                                 
                                    <input class="form-control" name="user.id"  value=${user.id}>
                                </div>
                                
                             
                                <div class="form-group" style="display:none">
                                 
                                    <input class="form-control" name="user.branchId"  value=${user.branchId}>
                                </div>
                                 
                                 <div class="form-group" style="display:none">
                                 
                                    <input class="form-control" name="user.companyId"  value=${user.companyId}>
                                </div>
                                 
                                  <div class="form-group" style="display:none">
                                 
                                    <input class="form-control" name="user.type"  value=${user.type}>
                                </div>
                                <div class="form-group" style="display:none">
                                 
                                    <input class="form-control" name="user.enddate"  value=${user.enddate}>
                                </div>
                                <div class="form-group">
                                                                                                                      用户名  <input class="form-control" placeholder="用户名（必填）" 
                          								name="user.userName"  autofocus value=${user.userName} >
                                </div>
                                <div class="form-group">
                                                                                                                    密码                     <input class="form-control" placeholder="密码（必填）" 
                                              name="user.password" id="password" value=${user.password}  >
                                </div>
                                    
                                <div class="form-group">
                            		       公司名称      <input class="form-control" placeholder="公司名" name="user.companyName" 
                            		       					value=${user.companyName}  >
                                </div>
                                
                                
                              
                                <div class="form-group">
                                  app账号数  <input class="form-control" disabled placeholder="app账号数" name="user.appCount"
                                  				 value=${user.appCount}   >
                                </div>
                                <div class="form-group">
                            			      已注册的app账号数  <input class="form-control" disabled  placeholder="已注册的app账号数" 
                            			      name="user.usedCount"   value=${user.usedCount}    >
                                </div>


                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block" >更改</button>
                                <!-- Modal -->
	                           
	                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
	                            			aria-hidden="true">
	                                <div class="modal-dialog">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" 
	                                            			aria-hidden="true">&times;</button>
	                                            <h4 class="modal-title" id="myModalLabel">提示</h4>
	                                        </div>
	                                        <div class="modal-body">
	                                        <div id="result"></div>
	                                        </div>
	                                        <div class="modal-footer">
	                                          <button  onclick="javascript:window.location.href='../../mainPage.jsp'"
														type="button" class="btn btn-default"
															data-dismiss="modal">关闭</button>
	                                        </div>
	                                    </div>
	                                    <!-- /.modal-content -->
	                                </div>
	                                <!-- /.modal-dialog -->
	                            </div>
	                          
	                            <!-- /.modal -->
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../../resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../resources/dist/js/sb-admin-2.js"></script>
    
	<script src="../../resources/js/jquery.validate.min.js"></script>
    <script src="../../resources/js/messages_zh.min.js"></script>  
    
	<script type="text/javascript">
	$().ready(function() {
		// validate signup form on keyup and submit
		$("#update").validate({
			rules: {
				'appClient.name': {
					required: true,
					minlength: 2
				},
				'appClient.password' : {
					required: true,
					minlength: 6
				},
				confirm_password: {
					required: true,
					equalTo: "#password"
				},
				'appClient.idCard':{
	                required:true,
	                minlength: 18,
	                maxlength: 18,
	                digits:true
				},
				'appClient.phone':{
	                required:true,
	                minlength: 11,
	                maxlength: 11,
	                digits:true
				},
				'appClient.trueName':{
	                required:true
				},
				'appClient.address':{
	                required:true
				}
			},
			messages: {
				'appClient.password': {
					required: "请输入密码",
					minlength: "密码至少6个字符"
				},
				'appClient.name': {
					required:"请输入用户名",
					minlength: "用户名至少2个字符"
				},
				confirm_password: {
					required: "请确认密码",
					equalTo: "两次输入的密码要相同" 
				},
				'appClient.idCard': {
					required:"请输入身份证号",
					minlength:"请输入正确的身份证号",
					maxlength:"请输入正确的身份证号"
				},
				'appClient.phone': {
					required:"请输入移动电话",
					minlength:"请输入正确的电话号码",
					maxlength:"请输入正确的电话号码"
					
				}
			},
			submitHandler:function(form){
    		    var txtHtml;
    			$.ajax({
    				url:'update',
    				data:$('#update').serialize(),
    				type:"POST",
    				success:function(data){
    					
    					var json;
   					 try {
   							json = $.parseJSON(data);
   						}   catch  (e)   {
   						    alert("网络异常 请重新登陆");
   						} 
   					
    	                if(json.resultcode == "200"){
    	                	txtHtml="<p class='text-info'> " + json.info + " </p>";
    	                }else{
    	                	txtHtml="<p class='text-warning'> " + json.info + " </p>";
    	                }
    					$("#result").html(txtHtml);
    					$("#myModal").modal("show");
    	            }
    			});
	        }
		});
	});
	</script>
</body>
</html>