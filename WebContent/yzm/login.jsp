<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">    
function changeValidateCode(obj) {    
/***
  *   ��ȡ��ǰ��ʱ����Ϊ�������޾�������   
  *   ÿ��������Ҫһ����ͬ�Ĳ�����������ܻ᷵��ͬ������֤��    
  *   ���������Ļ�������й�ϵ��Ҳ���԰�ҳ������Ϊ�����棬�����Ͳ�����������ˡ�  
  */
	var timenow = new Date().getTime();    
   
	obj.src="randPic?d="+timenow;    
}    
</script>
</head>

<body> 
	<form name="" action="loginWithYZMAction" method="post">
		�û���<input type="text" name="name" > <br>
		��֤��<input type="text" name="code" > 
		
		<img src="randPic" onclick="changeValidateCode(this)" title="���ͼƬˢ����֤��" /> <br />
		<input type="submit" value="��½" /><input type="reset" value="����" />
	</form>
</body>
</html>
