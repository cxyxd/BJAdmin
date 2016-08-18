<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>  
<s:action name="showstep3" namespace="/module/step" executeResult="false" var="rd"/>  
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
 <h1> this is step3</h1>
   <form action="module/step/step3" method="post">
   		 <input type="text" name="step3_name" value="${rd.step3_name}" style="width:370px"><br>
   		 
   		 <input type="submit" value="提交" >
   		 
   </form>
 </body>

</html>