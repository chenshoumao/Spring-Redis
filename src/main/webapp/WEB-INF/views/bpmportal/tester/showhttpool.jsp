<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看HTTP连接池</title>
</head>
<body>
	<p>需要特别关注pending和leased的值，如果leased的值特别大，接近max，则需要修改max，
	如果pending的值也比较大，也需要调整max，并考虑设置timeout，可以设置两个timeout，
	一个是获取连接的timeout，另外一个是获取socket数据的timeout。</p>
	<table border="1">
		<tr>
			<th>连接超时时间</th>
			<td>${timeout } 毫秒</td>
		</tr>
		<tr>
			<th>连接池总状态</th>
			<td>
				<p>max: ${ttlStats.max }</p>
				<p>available: ${ttlStats.available}</p>
				<p>leased: ${ttlStats.leased}</p>
				<p>pending: ${ttlStats.pending}</p>
			</td>
		</tr>
		<c:forEach items="${routeStats}" var="item">
		<tr>
			<th>${item.key}<br/>状态</th>
			<td>
				<p>max: ${item.value.max }</p>
				<p>available: ${item.value.available}</p>
				<p>leased: ${item.value.leased}</p>
				<p>pending: ${item.value.pending}</p>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>