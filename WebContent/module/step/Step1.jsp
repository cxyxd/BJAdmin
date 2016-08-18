<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>  
<s:action name="showstep1" namespace="/module/step" executeResult="false" var="rd"/>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <base href="<%=basePath%>">   
    <title>标题</title>       
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">   
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
 </head>
 <body>
 <h1>This is step1</h1>
   <form action="module/step/step1" method="post">
   		 <input type="text" name="step1_name" value="${rd.step1_name}" style="width:370px"> <br>
   		 
   		 <input type="submit" value="下一步">
   		 
   </form>
   
 </body>
</html>