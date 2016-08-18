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
<script src="../..//resources/js/jquery.validate.min.js"></script>
</head>
<body>
   
   
    
    <div class="panel panel-default">
        <div class="panel-heading">
            售后服务&反馈
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                     <thead>
                        <tr>
                            <th>#</th>
                            <th>客户名称</th>
                            <th>电话</th>
                            <th>地址</th>
                            
                            <th>反馈信息</th>
                            <th>业务员</th>
                            <th>处理状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                      <tbody>
								<c:forEach items="${list}" var="recoreds" varStatus="s">
									<tr>
										<td><c:out value="${s.index+1}" /></td>
										<td><c:out value="${recoreds.customerName}" /></td>
										<td><c:out value="${recoreds.phone}" /></td>
										<td><c:out value="${recoreds.address}" /></td>
										
										<td><c:out value="${recoreds.msg}" /></td>
										<td><c:out value="${recoreds.clientName}" /></td>
										<td><c:out value="${recoreds.status}" /></td>
										
											<td>
											<c:if test="${branchCompany.type==1}">
 										<a onclick="deleteByID(${recoreds.id})" href="javascript:void(0)" 
 												class="btn btn-danger btn-xs">
                                 		   <i class="fa fa-trash-o"></i>
                             		   删除</a>
                                </c:if>
                                
                                	<a  href="getById?id=<c:out value="${recoreds.id}"  />" target="_parent" 
										class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
									更新</a>
                                </td>
                                
                                
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
						  <button  onclick="javascript:parent.location.href='leaveMessageInfo.jsp'"
										type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>
		
</body>

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
	                	txtHtml="<p class='text-info'>反馈信息删除成功</p>";
	                }else{
	                	txtHtml="<p class='text-warning'>反馈信息删除失败 </p>";
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
    var url="getAllComplain.action?byPage=ture&currentPage=" + num + "";
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