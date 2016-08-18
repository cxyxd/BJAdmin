<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="js/app.v2.js"></script>
</head>
<body>


	<c:choose>
		<c:when test="${branchCompany.type==1}">
		
				<%@ include file="navHead.jsp" %>  <!--  业务员 -->
        </c:when>
		<c:when test="${branchCompany.type==2}">
		
				<%@ include file="navHead2.jsp" %> <!--  分公司 -->
        </c:when>
        <c:when test="${branchCompany.type==3}">
      
				<%@ include file="navHead3.jsp" %> <!--  总公司 -->
        </c:when>
	</c:choose>


	
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">概览</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
	  <c:if test="${branchCompany.type==1}">
	  
	    <div class="col-lg-3 col-md-6">
	        <a href="module/customer/inputCustomer.jsp">
	        <div class="panel panel-primary">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-comments fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">录入数据</div>
	                    </div>
	                </div>
	            </div>
	            <div class="panel-footer">
	                <span class="pull-left">查看详情</span>
	                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                <div class="clearfix"></div>
	            </div>
	        </div>
	        </a>
	    </div>
	  </c:if>  
	   <c:if test="${branchCompany.type!=1}">
	    <div class="col-lg-3 col-md-6">
	        <a href="module/appclient/getAllAppClent">
	        <div class="panel panel-yellow">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-list-alt fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">用户管理</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	   </c:if>
	    
	    <div class="col-lg-3 col-md-6">
	        <a href="module/customer/getAllAppClent">
	        <div class="panel panel-green">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-tasks fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">信息查看</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	    <div class="col-lg-3 col-md-6">
	        <a href="module/map/getAllAppClent">
	        <div class="panel panel-red">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-support fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">地图显示</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>

		 <div class="col-lg-3 col-md-6">
	       <a href="module/complain/getAllAppClent">
	        <div class="panel panel-success">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-shopping-cart fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">售后服务</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	    
	    <div class="col-lg-3 col-md-6">
	       <a href="<%=request.getContextPath() %>/module/blank.jsp">
	        <div class="panel panel-success">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-inbox fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">项目管理</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	    
	    
	    
	    
	      <div class="col-lg-3 col-md-6">
	        <a href="<%=request.getContextPath() %>/module/blank.jsp">
	        <div class="panel panel-red">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-align-center fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">合同管理</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	    
	      <div class="col-lg-3 col-md-6">
	        <a href="<%=request.getContextPath() %>/module/blank.jsp">
	        <div class="panel panel-green">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-cny fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">价格管理</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	    
	     <div class="col-lg-3 col-md-6">
	        <a href="<%=request.getContextPath() %>/module/blank.jsp">
	        <div class="panel panel-primary">
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col-xs-3">
	                        <i class="fa fa-smile-o fa-5x"></i>
	                    </div>
	                    <div class="col-xs-9 text-right">
	                        <div class="huge">信用管理</div>
	                    </div>
	                </div>
	            </div>
	                <div class="panel-footer">
	                    <span class="pull-left">查看详情</span>
	                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                    <div class="clearfix"></div>
	                </div>
	        </div>
	        </a>
	    </div>
	    
	    
	    
	    
	   
	</div>
	<%@ include file="navTail.jsp" %>

</body>
</html>