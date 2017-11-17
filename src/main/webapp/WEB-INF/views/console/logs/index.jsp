<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>日志详情</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/console/logsMonitor/index.xsp">
<div>
<div>
 日志级别：${name}   &nbsp;&nbsp;&nbsp;总行数:${total}&nbsp;&nbsp; <input type="submit" value="刷新"><br>
</div>
<div>
 检索行 (eg. 250-600) <br>
 <input type="hidden" name="file" value="${file}">
<br><br>
</div>
<div>
${content}
</div>
</div>
</form>
</body>
</html>