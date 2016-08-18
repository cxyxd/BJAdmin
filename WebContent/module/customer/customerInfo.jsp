<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../../newPage/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../../newPage/css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="../../newPage/js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../../newPage/js/app.v2.js"></script>

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
        
            <form class="form-inline" role="form" action="getAllCustomer"  method="post" target="mFrame"> 
                <div class="form-group"> 
                    <label class="" for="exampleInputEmail2">客户名称</label> 
                    <input type="text" class="form-control"  name="customer.name" placeholder="客户信息"> 
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
                    <label class="" for="exampleInputPassword2">类别</label> 
                    <select  class="form-control" name="customer.type"> 
                        <option value="全部">全部</option>
                        <option value="商混市场">商混市场</option> 
                        <option value="重点工程">重点工程</option> 
                        <option value="水泥制品">水泥制品</option> 
                        <option value="民用市场">民用市场</option> 
                    </select>
                </div> 
                 <div class="form-group"> 
                    <label class="" for="exampleInputPassword2">合作状态</label> 
                    <select  class="form-control" name="customer.status"> 
                     	 <option value="全部">全部</option> 
                        <option value="已合作">已合作</option>
                        <option value="未合作">未合作</option> 
                        <option value="待合作">待合作</option> 
                    </select>
                </div> 
                
                  <button style="margin-top: 22px; margin-left: 31px;" type="submit" 
                 					class="btn btn-s-md btn-dark pull-right">提交</button>
              </form> 
              
                         
        </div> 
    </section>
         
          
      
    <iframe src="getAllCustomer" id="mFrame" name="mFrame" class="ifr_page"
	scrolling="no" height="1000px" width="100%" frameborder="0"	>
	</iframe>
	
    
    
    <%@ include file="../../navTail.jsp" %>
</body>
</html>