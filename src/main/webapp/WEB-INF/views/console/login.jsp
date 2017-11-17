<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>船舶数据智能服务系统</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/fonts/iconfont.css">
</head>
<body>
    <div class="container">
        <div class="loginBar_l fl">
        </div>
        <div class="loginBar_r fl">
            <form id="form1" action="${pageContext.request.contextPath}/console/user/login.action" method="post">
                <div class="form_bar">
                    <div class="img_box"><img src="${pageContext.request.contextPath}/images/loginBar_r2.png" alt=""></div> 
                    <div class="usr"><i class="iconfont icon-yonghu"></i><input type="text" id="username" name="username" placeholder="请输入用户名"/></div>
                    <div class="pwd"><i class="iconfont icon-a501"></i><input type="password" id="password" name="password" placeholder="请输入密码"/></div>
                    <input class="btn_login" type="submit" id="submitbtn" value="登 录"/><!-- <a class="btn_login" href="javascript:void(0)">登 录</a> -->
                </div>
                <p class="tip">建议使用Google Chrome、FireFox或IE9及以上版本&nbsp;&nbsp;&nbsp;&nbsp;@Copyrights</p>
            </form>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
$(function(){
	
	$(".container").height($(window).height());
});

</script>
