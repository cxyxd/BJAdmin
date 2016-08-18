
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>  
     <!-- enctype 默认是 application/x-www-form-urlencoded -->  
     <form action="visionUpdate" enctype="multipart/form-data" method="post" >  
             
 			版本介绍: <input type="text" name="versionMsg"><br>
     		file: <input type="file" name="file"><br>
        
        <input type="submit" value="submit">
       
     </form>  
              
  </body>  
</html> 