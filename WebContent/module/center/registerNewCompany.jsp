<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
    <%@ include file="nav.jsp" %>
      <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">企业账号注册</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="register" method="post" id="register" >
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名（必填）" name="user.userName"  autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码（必填）" name="user.password" id="password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="重新输入密码（必填）" name="confirm_password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="APP分配个数（必填）" name="user.appCount" type="text" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="公司电话（必填）" name="tel" type="tel" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="公司名称（必填）" name="user.companyName" type="text" value="">
                                </div>
                                <label>截止期限</label>
                                <div class="form-group">
                                    <input class="form-control" placeholder="截止期限（必填）" name="user.enddate" type="date" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="公司地址（必填）" name="user.address" type="text" value="">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block" >注册</button>
                                <!-- Modal -->
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
		$("#register").validate({
			rules: {
				'user.userName': {
					required: true,
					minlength: 2
				},
				'user.password' : {
					required: true,
					minlength: 6
				},
				confirm_password: {
					required: true,
					equalTo: "#password"
				},
				'appClient.phone':{
	                required:true,
	                minlength: 11,
	                maxlength: 11,
	                digits:true
				},
				'appClient.address':{
	                required:true
				}
			},
			messages: {
				'user.password': {
					required: "请输入密码",
					minlength: "密码至少6个字符"
				},
				'user.userName': {
					required:"请输入用户名",
					minlength: "用户名至少2个字符"
				},
				confirm_password: {
					required: "请确认密码",
					equalTo: "两次输入的密码要相同" 
				}
			},
			submitHandler:function(form){
    		    var txtHtml;
    			$.ajax({
    				url:'register',
    				data:$('#register').serialize(),
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