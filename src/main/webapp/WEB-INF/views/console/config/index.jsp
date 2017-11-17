<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=urf-8">
<title>系统配置</title>
<jsp:include page="../resources.jsp"></jsp:include>
<style>
.fitem {
	margin-bottom: 15px;
}

fieldset {
	padding: 10px;
	margin: 10px;
	width: 86%;
	color: #333;
	border: #06c dashed 1px;
}

legend {
	color: #06c;
	font-weight: 800;
}
</style>

<script type="text/javascript">
	function submit() {
		document.getElementById('form').submit();
	}

	function resetValue() {
		window.location.reload();//刷新当前页面.
	}
	
	function sendEmail(email){
		$("#sentResult").text("正在发送邮件，请稍等....");
		$.ajax({
			url :  "${pageContext.request.contextPath}/console/sysConfiguration/sendEmail.action",
			type : "post",
			data : {
				"email" : email
			},
			dataType : "json",
			success : function(result) {
				$("#sentResult").text(result.msg);
			},
			error : function() {
				alert("网络连接失败，无法发送邮件！");
				$("#sentResult").text("网络连接失败，无法发送邮件！");
			}
		});
	}
	
	 $(function() {  
         $("#sendEmail").click(function(event) {   
          event.preventDefault();     //阻止提交按钮的默认行为（提交表单）
          var email=$("#targetEmail").val();  
             //当未输入用户名时，提示并阻止提交  
             if ( email== "") {     
               alert("收件人不能为空");
             }else{
             sendEmail(email);
             }  
         });  
     });  
</script>
</head>
<body>

	<form id="form" method="post"
		action="${pageContext.request.contextPath}/console/sysConfiguration/save.action">
		<div style="margin-top: 5%; margin-left: 5%">
			<div style="float: left; width: 50%">
			
				<fieldset>
					<legend>系统参数配置</legend>
					<div class="fitem">
						<label>附件上传地址:</label> 
                          <input class="easyui-textbox"
							style="width: 280px;" name="uploadFileDir"
							value="${config.uploadFileDir}">
					</div>
					<div class="fitem">
						<label>邮件SMTP地址:</label> <input type="hidden" name="cfgId"
							value="${config.cfgId}"> <input class="easyui-textbox"
							style="width: 280px;" name="SMTPAddress"
							value="${config.SMTPAddress}">
					</div>

					<div class="fitem">
						<label>账号:</label> <input class="easyui-textbox"
							style="width: 280px;" name="account" value="${config.account}">
					</div>

					<div class="fitem">
						<label>密码:</label> <input class="easyui-textbox"
							style="width: 280px;" type="password" name="password"
							value="${config.password}">
					</div>

					<div class="fitem">
						<label>邮箱地址:</label> <input class="easyui-textbox"
							style="width: 280px;" name="email" value="${config.email}">
					</div>

					<div class="fitem">
						<label>SMTP端口:</label> <input class="easyui-textbox"
							style="width: 280px;" name="port" value="${config.port}">
					</div>
					<div class="fitem">
						<label>收件人:</label> <input class="easyui-validatebox" 
						missingMessage="邮件必须填写" validType="email" 
						invalidMessage="请填写正确的邮件格式" 
						class="easyui-textbox"
							style="width: 280px;height:18px" id="targetEmail" >
						<button id="sendEmail">测试发送</button>	
						<div id="sentResult"></div>
					</div>
				</fieldset>
			</div>
			<div style="float: left; width: 50%">
				<fieldset>
					<legend>ldap配置</legend>
					<div class="fitem">
						<label>LdapUrl:</label> <input class="easyui-textbox"
							style="width: 280px;" name="LdapUrl" value="${config.LdapUrl}">
					</div>
					<div class="fitem">
						<label>basedn:</label> <input class="easyui-textbox"
							style="width: 280px;" name="basedn" value="${config.basedn}">
					</div>
					<div class="fitem">
						<label>ldap账号:</label> <input class="easyui-textbox"
							style="width: 280px;" name="binduser" value="${config.binduser}">
					</div>
					<div class="fitem">
						<label>ldap密码:</label> <input class="easyui-textbox"
							style="width: 280px;" type="password"  name="bindpwd" value="${config.bindpwd}">
					</div>

					<div class="fitem">
						<label>ldap uid:</label> <input class="easyui-textbox"
							style="width: 280px;" name="uid" value="${config.uid}">
					</div>

					<div class="fitem">
						<label>登录账号:</label> <input class="easyui-textbox"
							style="width: 280px;" name="cn" value="${config.cn}">
					</div>
					<div class="fitem">
						<label>ldap 邮件:</label> <input class="easyui-textbox"
							style="width: 280px;" name="ldapmail" value="${config.ldapmail}">
					</div>
					<div class="fitem">
						<label>用户姓名:</label> <input class="easyui-textbox"
							style="width: 280px;" name="sn" value="${config.sn}">
					</div>
						<div class="fitem">
						<label>BPM用户主键:</label>
						<select id="bpmEmployeeId" class="easyui-combobox" name="bpmEmployeeId"
						 editable="false" style="width:100px;">
						    <option value="ldapUid" 
						    	<c:if test='${config.bpmEmployeeId=="ldapUid"}'>selected="true"</c:if>>ldapUid</option>
						    <option value="empName" 
						    	<c:if test='${config.bpmEmployeeId=="empName"}'>selected="true"</c:if>>empName</option>
						</select> 
					</div>
				</fieldset>
			</div>
     <div class="fitem" style="color:red;margin-left:27%">${msg}</div>
			<div class="fitem" style="margin-left: 27%">
				<input type="submit" value="保存" onclick="submit()"> <input
					type="button" value="重置" onclick="resetValue()">
			</div>


		</div>
	</form>
</body>
</html>