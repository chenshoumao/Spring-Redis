<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="decorator" content="none" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登  录</title>
<style>
body {background-color:#C9ECFB;margin:0;scroll:no}
form {background: url("${pageContext.request.contextPath}/images/login/loginbg.png") no-repeat scroll left top #ffffff;height:600px;left:190px;position:relative;width:900px;}
#msg{height:23px;left:500px;position:absolute;top:292px;width:189px;color:red;}
#username {height:23px;left:500px;position:absolute;top:345px;width:189px;}
#password {height:23px;left:500px;position:absolute;top:395px;width:189px;}
#submit {left:615px;position:absolute;top:440px;}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/console/user/login.action" method="post">
	<span id="msg">${msg}</span>
	<input type="text" id="username" name="username"/>
	<input type="password" id="password" name="password"/>
	<input type="image" src="${pageContext.request.contextPath}/images/login/login_btn.gif" id="submit"/>
</form>
</body>

</html>