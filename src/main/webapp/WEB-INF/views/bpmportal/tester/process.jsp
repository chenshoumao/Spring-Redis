<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>流程性能测试</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#btnExecute1").click(function() {
			var url=$.trim($("#pageUrl").val());
			if (url=="") alert("请填写页面URL！");
			loopCount=$.trim($("#loopCount").val());
			if (loopCount=="") {
				alert("请填写循环次数！");
				return;
			} else {
				loopCount=parseInt(loopCount);
				if (loopCount<=0) {
					alert("循环次数必须大于零！");
					return;
				}
			}
			var loopSpan=$.trim($("#loopSpan").val());
			if (loopSpan=="") {
				alert("请填写循环间隔！");
				return;
			} else {
				loopSpan=parseInt(loopSpan);
				if (loopSpan<=100) {
					alert("循环间隔必须大于100毫秒！");
					return;
				}
			}
			setTimeout("newPageOpen(\""+url+"\", "+loopCount+", "+loopSpan+")", loopSpan);
		});
	});
	
	function newPageOpen(url, loopCount, loopSpan) {
		window.open(url,"testwnd_"+Math.random());
		if (loopCount>1) {
			loopCount--;
			setTimeout("newPageOpen(\""+url+"\", "+loopCount+", "+loopSpan+")", loopSpan);
		}
	}
	</script>
</head>
<body>
	<fieldset title="打开新窗口页面">
		<table width="100%" border="0" cellspacing="5" cellpadding="5">
			<tr>
				<td>页面URL：</td>
				<td colspan="3"><input type="text" style="width:95%" id="pageUrl" name="pageUrl" /></td>
			</tr>
			<tr>
				<td width="100">循环次数：</td>
				<td><input type="text" style="width:100px" id="loopCount" name="loopCount" value="10" /></td>
				<td width="100">循环间隔：</td>
				<td><input type="text" style="width:100px" id="loopSpan" name="loopSpan" value="1000" /> 毫秒</td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="执行" id="btnExecute1" /></td>
			</tr>
		</table>
	</fieldset>
</body>
</html>