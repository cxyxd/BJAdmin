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
     <form action="fileUpload2" enctype="multipart/form-data" method="post" >  
          
                客户名称：<input type="text" name="visit.customerId"> <br/>  
                备忘录：   <input type="text" name="visit.msg"> <br/>  
               上传照片1：<input type="file" name="file1"><br/>  
               上传照片2：<input type="file" name="file1"><br/>  
               上传照片3：<input type="file" name="file1"><br/>   
                 
              <input type="submit" value="提交"/>  
       
     </form>  
              
  </body>  
</html> 