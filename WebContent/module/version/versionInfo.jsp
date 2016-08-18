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
   
<%@ include file="../../navHead3.jsp" %> <!--  总公司 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            版本信息
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                     <thead>
                        <tr>
                            <th>#</th>
                            <th>版本号</th>
                            <th>版本信息</th>
                            <th>更新时间</th>
                            
                        </tr>
                    </thead>
                      <tbody>
								<c:forEach items="${list}" var="recoreds" varStatus="s">
									<tr>
										<td><c:out value="${s.index+1}" /></td>
										<td><c:out value="${recoreds.id}" /></td>
										<td><c:out value="${recoreds.versionMsg}" /></td>
										<td><c:out value="${recoreds.date}" /></td>
									</tr>
								</c:forEach>
							</tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
    </div>
      <a href="versionInput.jsp"  style="margin: 0 auto;" class="btn btn-s-md btn-dark pull-right">提交新版本</a>
			<%@ include file="../../navTail.jsp" %>
</body>


</html>