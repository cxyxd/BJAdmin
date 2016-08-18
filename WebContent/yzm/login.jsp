<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">    
function changeValidateCode(obj) {    
/***
  *   获取当前的时间作为参数，无具体意义   
  *   每次请求需要一个不同的参数，否则可能会返回同样的验证码    
  *   这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。  
  */
	var timenow = new Date().getTime();    
   
	obj.src="randPic?d="+timenow;    
}    
</script>
</head>

<body> 
	<form name="" action="loginWithYZMAction" method="post">
		用户名<input type="text" name="name" > <br>
		验证码<input type="text" name="code" > 
		
		<img src="randPic" onclick="changeValidateCode(this)" title="点击图片刷新验证码" /> <br />
		<input type="submit" value="登陆" /><input type="reset" value="重置" />
	</form>
</body>
</html>
