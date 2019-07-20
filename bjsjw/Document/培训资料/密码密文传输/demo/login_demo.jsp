<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="/ui/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/ui/widgets/cookie/jquery.cookie.js"></script>
<script type="text/javascript" src="/ui/lib/security/jsencrypt.min.js"></script>
<script type="text/javascript" src="/ui/lib/security/rsa_util.js"></script>
<script>
	function beforeSubmit(){
		var u_user = $('#name').val();
		var u_password = $('#password').val();
		$('#enc_name').val(RSAencode(u_user));
		$('#enc_password').val(RSAencode(u_password));
	}
</script>
</head>

<body>
	<form action="dologin.jsp" onsubmit="beforeSubmit">
		<input id="enc_name" type="hidden" name="username"/>
		<input id="enc_password" type="hidden" name="password"/>
		<input id="name" type="text"/>
		<input id="password" type="password"/>
	</form>
</body>
</html>