<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>  
            上传成功：<br/>   
     username:<s:property value="username"/><br/>  
              <!-- 遍历值 -->  
              <s:iterator value="file1FileName" id="f"> <!-- id是一个对象，目前是一个字符串集合  可任意命名 -->  
                                                 文件:<s:property value="#f"/> <br/>    
               <!-- 这里也可以调用方法  <s:property value="#f.toUpperCase()"/> -->  
              </s:iterator>  
      
  </body>  
</html>