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
	<div class="col-lg-7">
	<h3>竞争对手详细信息</h3>
	<br>
	<form id="opponent" method="post" > 
	<input class="form-control" placeholder="请输入单位规模" style="display:none" value=${opponent.id} name="opponent.id">
		<div class="form-group">
			<label >竞争对手</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入内容'}" 
			  value=${opponent.name} name="opponent.name" id="name1" placeholder="请输入竞争对手" />
		</div>
		<div class="form-group">
			<label>单位地址</label>
			<input class="form-control" placeholder="请输入单位地址" value=${opponent.address} name="opponent.address">
		</div>
		
		<div class="form-group">
			<label>单位规模</label>
			<input class="form-control" placeholder="请输入单位规模" value=${opponent.scale} name="opponent.scale">
			
		</div>
		
		<div class="form-group">
			<label>对手描述</label>
			<textarea class="form-control" name="opponent.opp_desc"rows="3">${opponent.opp_desc}</textarea>
		</div>
		
	  
		
  		<br>
  		<c:if test="${branchCompany.type==1}">
	  		<button type="submit" class="btn btn-large btn-success">更改</button>
	  	</c:if>
	  	
	  	<button onclick="javascript:parent.location.href='../opponent/getAllAppClent'"
									type="button" class="btn btn-large btn-danger"
												data-dismiss="modal">关闭</button>
	</form>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
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
								  <button  onclick="javascript:parent.location.href='../opponent/getAllAppClent'"
									type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				
	</div>
	
	
	
		
	<!-- jQuery -->
	<script	src="../../resources/bower_components/jquery/dist/jquery.min.js"></script>

	<script src="../../resources/js/jquery.validate.min.js"></script>
	<script src="../../resources/js/messages_zh.min.js"></script>
	<script
	src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	
	
	<script type="text/javascript">
	$().ready(function() {
		// validate signup form on keyup and submit
		$("#opponent").validate({
			rules: {
				
			},			
			messages: {
				
			},
			submitHandler:function(form){
    		    var txtHtml;
    			$.ajax({
    				url:'insertOpponent',
    				data:$('#opponent').serialize(),
    				type:"POST",
    				success:function(data){
    					var json = $.parseJSON(data);
    	                if(json.resultcode == "200"){
    	                	txtHtml="<p class='text-info'>竞争对手" + json.info + "更新成功  </p>";
    	                }else{
    	                	txtHtml="<p class='text-warning'>" + json.info + "</p>";
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