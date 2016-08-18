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
	<%@ include file="../../navHead3.jsp" %>
	<div class="panel panel-default">
        <div class="panel-heading">
            分区经理账号
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>所属公司</th>
                            <th>分配的业务员数量</th>
                            <th>现有的业务员数量</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="recoreds" varStatus="s">
									<tr>
										<td><c:out value="${s.index+1}" /></td>
										<td><c:out value="${recoreds.userName}" /></td>
										<td><c:out value="${recoreds.password}" /></td>
										<td><c:out value="${recoreds.companyName}" /></td>
										<td><c:out value="${recoreds.appCount}" /></td>
										<td><c:out value="${recoreds.usedCount}" /></td>	
										<td>	<a href="getByIdBranch?id=<c:out value="${recoreds.id}" />"
									class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>查看详细</a>
								</td>	
									</tr>
						</c:forEach>
                    </tbody>
                </table>
                  <a href="registerBranch.jsp"  style="margin: 0 auto;" class="btn btn-s-md btn-dark pull-right">注册新账号</a>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
    </div>
	<%@ include file="../../navTail.jsp" %>

</body>
</html>