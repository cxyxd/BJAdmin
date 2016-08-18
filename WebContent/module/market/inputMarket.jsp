<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<%@ include file="../../navHead.jsp" %>
	<div class="col-lg-7">
	<h3>市场信息录入</h3>
	<br>
	<form action="insertMarket" id="market" method="post" sytle="display:"> 
		<div class="form-group">
			<label for="Select">匹配竞争对手</label>
						<select name="market.opponentId"
							id="disabledSelect" class="form-control">
							<c:forEach items="${list}" var="recoreds" varStatus="s">
								<option value=<c:out value="${recoreds.id}"/>>
									<c:out value="${recoreds.name}" />
								</option>
							</c:forEach>
						</select>
		</div>

		<div class="form-group">
			<label >产品名称</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入内容'}" 
			id="name1" placeholder="请输入产品名称" name="market.productName" />
		</div>
		<div class="form-group">
			<label>出厂价格</label>
			<div class="input-group m-b">
			<input class="form-control" placeholder="请输入出厂价格" name="market.leaveFacPrice">
			<span class="input-group-addon">元/吨</span>
			</div>
		</div>
		<div class="form-group">
			<label>运距</label>
			<div class="input-group m-b">
			<input class="form-control" placeholder="请输入运距" name="market.distance">
			<span class="input-group-addon">km</span>
			</div>
		</div>
		<div class="form-group">
			<label>运费</label>
			<div class="input-group m-b">
			<input class="form-control" placeholder="请输入运费" name="market.freight">
			<span class="input-group-addon">元/吨/km</span>
			</div>
		</div>
		<div class="form-group">
			<label>落地价格</label>
			<div class="input-group m-b">
			<input class="form-control" placeholder="请输入落地价格" name="market.truePrice">
			<span class="input-group-addon">元/吨</span>
			</div>
		</div>
		<div class="form-group">
			<label>终端销售价格</label>
			<div class="input-group m-b">
			<input class="form-control" placeholder="请输入终端销售价格" name="market.sellPrice">
			<span class="input-group-addon">元/吨</span>
			</div>
		</div>
		<div class="form-group">
			<label>营销政策</label>
			<textarea class="form-control" name="Message" rows="3" name="market.policy"></textarea>
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
								onclick="javascript:parent.location.href='../market/marketInfo.jsp'"
								type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>
	</form>
	</div>
	<script>

	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#market").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
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
    				url:realPath+'/module/market/insertMarket',
    				data:$('#market').serialize(),
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