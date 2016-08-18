<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>标题</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<script type="text/javascript" src="../../js/jquery.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/app.v2.css" type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/font.css" type="text/css"
	cache="false" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/js/calendar/bootstrap_calendar.css"
	type="text/css" cache="false" />

<body>

	<div class="panel panel-default">
		<div class="panel-heading">客户信息</div>
		<!-- /.panel-heading -->
		<div class="panel-body">

			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>客户名称</th>
							<th>单位地址</th>
							<th>类别</th>
							<th>是否合作</th>
							<th>业务员</th>
							<th>负责人电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<tbody>
						<c:forEach items="${list}" var="recoreds" varStatus="s">
							<tr>
							<td><c:out value="${s.index+1}" /></td>
								<td><c:out value="${recoreds.name}" /></td>
								<td><c:out value="${recoreds.address}" /></td>
								<td><c:out value="${recoreds.type}" /></td>

								<c:if test="${recoreds.status=='已合作'}">
									<td><font color="green"><c:out
												value="${recoreds.status}" /></font></td>
								</c:if>
								<c:if test="${recoreds.status=='未合作'}">
									<td><font color="red"><c:out
												value="${recoreds.status}" /></font></td>
								</c:if>
								<c:if test="${recoreds.status=='待合作'}">
									<td><c:out value="${recoreds.status}" /></td>
								</c:if>


								<td><c:out value="${recoreds.clientName}" /></td>

								<c:if test="${recoreds.type==\"民用市场\"}">
									<td><c:out value="${recoreds.phone1}" /></td>
								</c:if>

								<c:if test="${recoreds.type!=\"民用市场\"}">
									<td><c:out value="${recoreds.landline}" /></td>
								</c:if>

								<td><c:if test="${recoreds.type==\"民用市场\"}">
										<a href="getByIdWith1?id=<c:out value="${recoreds.id}" />"
											class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
											更新
										</a>
									</c:if> <c:if test="${recoreds.type!=\"民用市场\"}">
										<a href="getByIdWith2?id=<c:out value="${recoreds.id}" />"
											class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
											更新
										</a>
									</c:if> <c:if test="${branchCompany.type==1}">
										<a onclick="deleteByID(${recoreds.id})"
											href="javascript:void(0)" class="btn btn-danger btn-xs">
											<i class="fa fa-trash-o"></i> 删除
										</a>
									</c:if></td>
							</tr>
							
						</c:forEach>






					</tbody>
				</table>
				<div id="page-selection" style="float: right;"></div>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>


	<!--弹出显示框-->
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
					<button
						onclick="javascript:parent.location.href='customerInfo.jsp'"
						type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>


</body>
<!-- jQuery -->

<script src="../../resources/js/jquery.validate.min.js"></script>
<script src="../../resources/js/messages_zh.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


<script src="../../js/jquery.bootpag.js"></script>



<script type="text/javascript">
    function deleteByID(myid) {
       
        $.ajax({
			url:'delete?id='+myid,
			type:"POST",
			success:function(data2){
				var data;
					 try {
						  data = $.parseJSON(data2);
						}   catch  (e)   {
						    alert("网络异常 请重新登陆");
						} 
						
	                if(data.resultcode == "200"){
	                	txtHtml="<p class='text-info'>客户删除成功</p>";
	                }else{
	                	txtHtml="<p class='text-warning'>删除失败 </p>";
	                }
	                $("#result").html(txtHtml);
    				$("#myModal").modal("show");
            
            }
		});
    }

$('#page-selection').bootpag({
    total: ${
    	totalPage
    },
    page: ${
    	currentPage
    },
    maxVisible: 5,
    leaps: true,
    firstLastUse: true,
    first: '←',
    last: '→',
    wrapClass: 'pagination',
    activeClass: 'active',
    disabledClass: 'disabled',
    nextClass: 'next',
    prevClass: 'prev',
    lastClass: 'last',
    firstClass: 'first'
}).on("page",
function(event,
/* page number here */
num) {
    //  $("#content").html("Insert content"+num); // some ajax content loading...
    var url="getAllCustomer.action?byPage=ture&currentPage=" + num + "";
//    var type='${customer.type}';
//    var customerName='${customer.type}';
//    var clientName='${clientName}';
///    if(type!="")
//    	url+="customer.type="+type;
//    if(customerName!="")
//        url+="customer.name="+customerName;
//    if(clientName!="")
//        url+="clientName="+clientName;
//    alert(url);
    location.href = url;

});
</script>
</html>