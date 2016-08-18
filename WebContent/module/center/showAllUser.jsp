<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="wrapper">
        <!-- Navigation -->
         <%@ include file="nav.jsp" %>

		<div id="page-wrapper">
		<br>
			<div class="panel panel-default">
                        <div class="panel-heading">
                            企业账户
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>公司名称</th>
                                            <th>APP分配个数</th>
                                            <th>APP已使用个数</th>
                                            <th>截止日期</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${list}" var="recoreds" varStatus="s">

									<c:choose>
										<c:when test="${s.index%4==0}">
											<tr class="info">
										</c:when>
										<c:when test="${s.index%4==1}">
											<tr class="warning">
										</c:when>
										<c:when test="${s.index%4==2}">
											<tr class="success">
										</c:when>
										<c:otherwise>
											<tr class="danger">
										</c:otherwise>
									</c:choose>
								
										<td><c:out value="${s.index+1}" /></td>
										<td><c:out value="${recoreds.companyName}" /></td>
										<td><c:out value="${recoreds.appCount}" /></td>
										<td><c:out value="${recoreds.usedCount}" /></td>
										<td><c:out value="${recoreds.enddate}" /></td>
									</tr>
								</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <button type="button" class="btn btn-primary btn-lg btn-block" 
						onclick="javascript:window.location.href='registerNewCompany.jsp'">注册新企业账户</button>
					
		</div>
		
	</div>
						

</body>
</html>