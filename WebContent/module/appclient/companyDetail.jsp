<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../../css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../../js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../../js/app.v2.js"></script>
<script src="../../resources/js/jquery.validate.min.js"></script>
</head>
<body>
	<%@ include file="../../navHead3.jsp" %>
    <div class="col-lg-6">
        <h3>账号信息查看</h3>
        <br>
	<section class="panel panel-info portlet-item"> 
        <header class="panel-heading"> 总经理账号 </header> 
         <form id="companyDetail"  method="post" sytle="display:"> 
            <input class="form-control"  value="${user.id}" style="display:none" name="user.id">
           <input class="form-control"  value="3" style="display:none" name="user.type">      
        <div class="list-group bg-white" style="font-size:18px"> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-envelope"></i> 用户名：<div class="pull-right">
                <input class="form-control" placeholder="请输入用户名" value="${user.userName}" 
                style="border:0px; text-align:right; font-size:24px" name="user.userName">
                </div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-eye"></i> 密码:<div class="pull-right">
                <input class="form-control" placeholder="请输入密码" value="${user.password}" 
                style="border:0px; text-align:right; font-size:24px" name="user.password">
                </div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-phone"></i> 所属单位: <div class="pull-right">
                  <input class="form-control" placeholder="" value="${user.companyName}" 
                style="border:0px; text-align:right; font-size:24px" name="user.password" disabled="disabled">
                </div>
            </a> 
            <a href="#" class="list-group-item"> 
                <i class="fa fa-fw fa-comments-o"></i> 区域经理数量: <div class="pull-right">
                 <input class="form-control" placeholder="" value="${count}" 
                style="border:0px; text-align:right; font-size:24px"  disabled="disabled">
                </div>
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


	
	
	<script>

	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#companyDetail").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'totalUpdate',
    				data:$('#companyDetail').serialize(),
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