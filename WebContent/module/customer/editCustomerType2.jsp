<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
	
	<div class="col-lg-7">

	
	<h3>客户信息编辑</h3>
	<br>
	
	<form id="two" action="insertCustomer"  class="myform" method="post" > 
		
	<input class="form-control" id="name1" 
			name="customer.id" value="${customer.id}"  type="hidden"  />

		<div class="form-group">
			<label >客户类型</label>
			<input class="form-control" id="name1" 
			name="customer.type" value="${customer.type}"   />
		</div>
		
		<div class="form-group">
			<label >客户名称</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入内容'}" id="name1" 
			   name="customer.name" value="${customer.name }" placeholder="请输入客户名称" />
		</div>
		<div class="form-group">
			<label>客户地址</label> 
			<input class="form-control" value="${customer.address}" name="customer.address" placeholder="请输入客户地址">
		</div>
		
	<div class="form-group">
			<label>单位座机</label>
			<input class="form-control" name="customer.landline" value="${customer.landline}" 
			placeholder="请输入单位座机">
		</div>
		<div class="form-group">
			<label>单位联系人1</label>
			<input class="form-control"  name="customer.leader1_info" value="${customer.leader1_info}" 
			placeholder="姓名/职务/联系人电话/手机 ">
		</div>
		<div class="form-group">
			<label>单位联系人2</label>
			<input class="form-control" name="customer.leader2_info" value="${customer.leader2_info}" 
			placeholder="姓名/职务/联系人电话/手机 ">
		</div>
		<div class="form-group">
			<label>单位联系人3</label>
			<input class="form-control" name="customer.leader3_info" value="${customer.leader3_info}"
			 placeholder="姓名/职务/联系人电话/手机 ">
		</div>
		<div class="form-group">
			<label>邮箱</label>
			<input class="form-control"  value="${customer.email}"  name="customer.email" placeholder="请输入邮箱">
		</div>
		<div class="form-group">
			<label>邮编</label>
			<input class="form-control"  value="${customer.postalCode}" name="customer.postalCode" placeholder="请输入邮编">
		</div>

		
		<div class="form-group">
			<label>合作状态</label>


				<c:if test="${customer.status=='已合作'}">
					<input class="form-control"  style="color:green" value="${customer.status}" name="customer.status" placeholder="请输入合作状态">
				</c:if>
				<c:if test="${customer.status=='未合作'}">
					<input class="form-control"  style="color:red" value="${customer.status}" name="customer.status" placeholder="请输入合作状态">
				</c:if>
				<c:if test="${customer.status=='待合作'}">
					<input class="form-control"   value="${customer.status}" name="customer.status" placeholder="请输入合作状态">
				</c:if>
				 
		</div>
	
	  	
		<div class="form-group">
			<label>客户描述</label>
			<textarea class="form-control" name="customer.cus_desc"  rows="3">${customer.cus_desc}</textarea>
		</div>
  		<br>
	  	<c:if test="${branchCompany.type==1}">
	  		<button type="submit" class="btn btn-large btn-success">更改</button>
	  	</c:if>
	  	
	  	<button onclick="javascript:parent.location.href='../customer/customerInfo.jsp'"
									type="button" class="btn btn-large btn-danger"
												data-dismiss="modal">关闭</button>
	  	
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
								onclick="javascript:parent.location.href='../../module/customer/getAllAppClent'"
								type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
	
	<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<script>
	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#two").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'insertCustomer',
    				data:$('#two').serialize(),
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

</body>
</html>