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
<script src="../../resources/js/jquery.validate.min.js"></script>
</head>
<body>
	<%@ include file="../../navHead.jsp" %>
	<div class="col-lg-7">
	<div class="m-b-sm"> 
		<div class="btn-group btn-group-justified"> 
			<a class="btn btn-primary" onclick="showOne()">商混市场/重点工程/水泥制品</a> 
			<a class="btn btn-info" onclick="showTwo()">民用市场</a> 
		</div> 
	</div>
	
	<font size=5>客户信息录入</font> <font size=3 id="h_one" >&nbsp;&nbsp;商混市场/重点工程/水泥制品</font> 
	<font size=3 id="h_two"  style="display:none" >&nbsp;&nbsp;民用市场</font>
	<br>
	
	<form id="one" action="insertCustomer" class="myform" method="post" sytle="display:"> 
	
		<div class="form-group">
			<label for="Select">类别</label>
			<select id="disabledSelect" class="form-control" name="customer.type">
				<option>水泥制品</option> 
				<option>商混市场</option>
				<option>重点工程</option>
			</select>
		</div>
		<div class="form-group">
			<label >客户名称</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入内容'}" id="name1" 
			name="customer.name" placeholder="请输入客户名称" />
		</div>
		<div class="form-group">
			<label>单位地址</label>
			<input class="form-control" name="customer.address" placeholder="请输入单位地址">
		</div>
		<div class="form-group">
			<label>单位座机</label>
			<input class="form-control" name="customer.landline" placeholder="请输入单位座机">
		</div>
		<div class="form-group">
			<label>单位联系人1</label>
			<input class="form-control"  name="customer.leader1_info" placeholder="姓名/职务/联系人电话/手机 ">
		</div>
		<div class="form-group">
			<label>单位联系人2</label>
			<input class="form-control" name="customer.leader2_info" placeholder="姓名/职务/联系人电话/手机 ">
		</div>
		<div class="form-group">
			<label>单位联系人3</label>
			<input class="form-control" name="customer.leader3_info" placeholder="姓名/职务/联系人电话/手机 ">
		</div>
		<div class="form-group">
			<label>公司邮箱</label>
			<input class="form-control" name="customer.email" placeholder="请输入公司邮箱">
		</div>
		<div class="form-group">
			<label>公司邮编</label>
			<input class="form-control" name="customer.postalCode" placeholder="请输入公司邮编">
		</div>
	  	<div class="form-group">
			<label for="Select">合作状态</label>
			<select id="disabledSelect" class="form-control" name="customer.status">
				<option>已合作</option>
				<option>未合作</option>
				<option>待合作</option>
			</select>
		</div>
		<div class="form-group">
			<label>客户描述</label>
			<textarea class="form-control" name="customer.cus_desc" rows="3"></textarea>
		</div>
  		<br>
	  	<button type="submit" class="btn btn-large btn-success">提交</button>
	</form>
	
	<form id="two" action="insertCustomer"  class="myform" method="post" style="display:none"> 
		
	<input class="form-control" id="name1" 
			name="customer.type" value="民用市场"  type="hidden"  />
		
			
		<div class="form-group">
			<label >客户名称</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入内容'}" id="name1" 
			   name="customer.name" placeholder="请输入客户名称" />
		</div>
		<div class="form-group">
			<label>客户地址</label>
			<input class="form-control" name="customer.address" placeholder="请输入客户地址">
		</div>
		<div class="form-group">
			<label>联系电话1</label>
			<input class="form-control" name="customer.phone1" placeholder="请输入联系电话">
		</div>
		<div class="form-group">
			<label>联系电话2</label>
			<input class="form-control"  name="customer.phone2" placeholder="请输入联系电话">
		</div>
		<div class="form-group">
			<label>邮箱</label>
			<input class="form-control"  name="customer.email" placeholder="请输入邮箱">
		</div>
		<div class="form-group">
			<label>邮编</label>
			<input class="form-control" name="customer.postalCode" placeholder="请输入邮编">
		</div>
		<div class="form-group">
			<label for="Select">级别</label>
			<select id="disabledSelect" class="form-control" name="customer.level" >
				<option>签约</option>
				<option>门店</option>
				<option>散户</option>
			</select>
		</div>
	  	<div class="form-group">
			<label for="Select">合作状态</label>
			<select id="disabledSelect" class="form-control" name="customer.status">
				<option>已合作</option>
				<option>未合作</option>
				<option>待合作</option>
			</select>
		</div>
		<div class="form-group">
			<label>客户描述</label>
			<textarea class="form-control" name="customer.cus_desc"rows="3"></textarea>
		</div>
  		<br>
	  	<button type="submit" class="btn btn-large btn-success">提交</button>
	  	
	  
		
	</form>
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
						  <button  onclick="javascript:window.location.href='../../mainPage.jsp'"
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
	
	
	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#one").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'insertCustomer',
    				data:$('#one').serialize(),
    				type:"POST",
    				success:function(data2){
    					var data;
      					 try {
      						  data = $.parseJSON(data2);
      						}   catch  (e)   {
      						    alert("网络异常 请重新登陆");
      						} 
      						
        	                if(data.resultcode == "200"){
        	                	txtHtml="<p class='text-info'>客户" + data.info + "插入成功</p>";
        	                }else{
        	                	txtHtml="<p class='text-warning'>插入失败 </p>";
        	                }
    	                $("#result").html(txtHtml);
        				$("#myModal").modal("show");
    	            }
    			});
	        }
		});
	});
	
	function showOne() {
		$("#one")[0].style.display = "";
		$("#h_one")[0].style.display = "";
		$("#two")[0].style.display = "none";
		$("#h_two")[0].style.display = "none";
	}
	function showTwo() {
		$("#one")[0].style.display = "none";
		$("#two")[0].style.display = "";
		$("#h_one")[0].style.display = "none";
		$("#h_two")[0].style.display = "";
	}
	
	</script>
	<%@ include file="../../navTail.jsp" %>
</body>
</html>