<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="../../resources/js/jquery.validate.min.js"></script>
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
    
    <section class="panel panel-default"> 
        <div class="panel-body"> 
            <form class="form-inline" action="getAllOpponent" role="form" method="post" target="mFrame"> 
                <div class="form-group"> 
                    <label class="" for="exampleInputEmail2">对手名称</label> 
                    <input type="text" name="opponentName" class="form-control" id="exampleInputEmail2" 
                    			placeholder="对手名称"> 
                </div> 
                 <c:if test="${branchCompany.type!=1}">
                <div class="form-group"> 
                    <label class="" for="exampleInputPassword2">业务员</label> 
                      <select  class="form-control" name="clientName"> 
                       <option value="全部">全部</option>
                    	<c:forEach items="${list}" var="recoreds" varStatus="s">
                    	     <option value="${recoreds.area}/${recoreds.trueName}">${recoreds.area}/${recoreds.trueName}</option>
                      </c:forEach>
                      </select>
                
                </div> 
                 </c:if>
                <div class="form-group"> 
                    <label class="" for="exampleInputPassword2">规模</label> 
                        <select name="scale" class="form-control">
                        	<option value="全部" >全部</option>
							<option value="粉磨站" >粉磨站</option>
							<option value="2500t/d" >2500t/d</option>
							<option value="5000t/d" >5000t/d</option>
							<option value="5000t/d以上" >5000t/d以上</option>
						</select>
                </div> 
                 <button style="margin-top: 22px; margin-left: 31px;" type="submit" 
                 					class="btn btn-s-md btn-dark pull-right">提交</button>
                
            </form> 
        </div> 
    </section>
   
    
    
    
        <iframe src="getAllOpponent" id="mFrame" name="mFrame" class="ifr_page"
				scrolling="no" height="900px" width="100%" frameborder="0"	>
		</iframe>
	
	
   
    <%@ include file="../../navTail.jsp" %>
</body>
</html>