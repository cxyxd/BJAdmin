<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

    <title>APP账号</title>
<link
	href="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath() %>/resources/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath() %>/resources/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath() %>/resources/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- jQuery -->
<script
	src="<%=request.getContextPath() %>/resources/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="<%=request.getContextPath() %>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" cache="false" />
<script src="js/jquery/dist/jquery.min.js"></script>
<script src="js/app.v2.js"></script>

</head>

<body>
	<div id="wrapper">
        <!-- Navigation -->
          
		<div id="page-wrapper">
		<br>
			<div class="panel panel-default">
                        <div class="panel-heading">
                            APP账户
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>用户名</th>
                                            <th>密码</th>
                                            <th>所属公司</th>
                                            <th>查看详情</th>
                                        </tr>
                                    </thead>
                                    <tbody>
							
								<c:forEach items="${list}" var="recoreds" varStatus="s">
									<tr>
										<td><c:out value="${s.index+1}" /></td>
										<td><c:out value="${recoreds.userName}" /></td>
										<td><c:out value="${recoreds.password}" /></td>
										<td><c:out value="${recoreds.companyName}" /></td>
										<td>
										<a href="getById?id=<c:out value="${recoreds.id}" />"
										class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
									</a>
										</td>
																			
									</tr>
								</c:forEach>
							</tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="javascript:window.location.href='register.jsp'">注册新APP账户</button>
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
		$('.table tbody tr:odd').addClass('info');
	</script>
	
</body>
</html>