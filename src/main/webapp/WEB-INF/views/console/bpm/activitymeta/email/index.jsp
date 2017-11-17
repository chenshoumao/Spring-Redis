<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>


<style>
.item {
	padding: 15px;
}

.itemlable {
	width: 141px;
	display: inline-block;
	text-align: right;
}
</style>
<script type="text/javascript">
	function submit() {
		var loadTip = layer.open({
			type : 3
		});
		var interval = $("#interval").val();
		var startTime = $("#startTime").val();
		if(startTime==""){
		$("#startTime").val("0");
		}
		if(interval==""){
		$("#interval").val("0");
		}
		$.ajax({
					url : "${pageContext.request.contextPath}/console/bpm/email/notification/saveOrUpdate.action",
					type : "post",
					data : $("#fm").serialize(),
					dataType : "json",
					success : function(result) {
						layer.close(loadTip);
						if (result.state == false) {
							layer.alert("保存出错:" + result.msg, {
								closeBtn : 0,
								shift : 4
							// 动画类型
							});
						} else {
							layer.alert("保存成功", {
								closeBtn : 0,
								shift : 4
							// 动画类型
							});
						}
					},
					error : function() {
						layer.close(loadTip);
					}
				});
	}
</script>
</head>
<body>
	<form id="fm">
		<div class="item">
			<input name="enId" type="hidden" value="${bpmEmailNotification.enId}" />
			<input name="activityId" type="hidden" value="${activityId}" /> <label
				class="itemlable">收件人：</label> <input
				name="recipients" value="${bpmEmailNotification.recipients}"
				style="width: 50%; height: 30px;" />
		</div>
		<div class="item">
			<label class="itemlable">标题：</label> <input name="title"
				value="${bpmEmailNotification.title}"
				style="width: 50%; height: 30px;" />
		</div>
		<div class="item">
			<label class="itemlable">时间间隔(分钟)：</label> <input id="interval"
				name="interval" value="${bpmEmailNotification.interval}"
				style="width: 50%; height: 30px;"
				onkeyup="this.value=this.value.replace(/\D/g,'')"
				onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		</div>
		<div class="item">
			<label class="itemlable">是否重复发送：</label> <select name="repeat"
				style="width: 50%; height: 30px;">
				<option value="enabled"
					<c:if test="${bpmEmailNotification.repeat=='enabled'}">
		                                   					selected="selected"</c:if>>启用</option>
				<option value="disable"
					<c:if test="${bpmEmailNotification.repeat=='disable'}">
		                                   					selected="selected"</c:if>>禁用</option>
			</select>
		</div>
		<div class="item">
			<label class="itemlable">开始时间(分钟)：</label> <input id="startTime"
				name="startTime" value="${bpmEmailNotification.startTime}"
				style="width: 50%; height: 30px;"
				onkeyup="this.value=this.value.replace(/\D/g,'')"
				onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		</div>
		<div class="item">
			<label class="itemlable">邮件发送程序：</label> <input name="reflection"
				value="${bpmEmailNotification.reflection}"
				style="width: 50%; height: 30px;" />
		</div>

		<div class="item">
			<label class="itemlable">邮件内容：</label>
			<textarea name="content" style="width: 50%; height: 150px;">${bpmEmailNotification.content}</textarea>
		</div>
	</form>
</body>
</html>