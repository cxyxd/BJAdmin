<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../newPage/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../newPage/css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="../newPage/js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../newPage/js/app.v2.js"></script>

</head>
<body>
	<c:choose>
		<c:when test="${branchCompany.type==1}">
		
				<%@ include file="../../navHead.jsp" %>  <!--  业务员 -->
        </c:when>
		<c:when test="${branchCompany.type==2}">
		
				<%@ include file="../../navHead2.jsp" %> <!--  分公司 -->
        </c:when>
        <c:when test="${branchCompany.type==3}">
      
				<%@ include file="../../navHead3.jsp" %> <!--  总公司 -->
        </c:when>
	</c:choose>
        
<h3> 敬请期待...
</h3>
         
      

	
    
    
    <%@ include file="../navTail.jsp" %>
</body>
</html>