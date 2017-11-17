<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>船舶海图资料智能服务系统</title>
<meta name="decorator" content="none" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/images/LOGO.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/console/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/console/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/console/global.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/plugins/layui/layui.js"></script>
	</head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script type="text/javascript">
    var path1 = '<%=path %>';
	var basePath1 = '<%=basePath %>';
</script>
	<body>
		<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1483c9;">
			<div class="layui-header header header-demo">
				<div class="layui-main">
					<div class="admin-login-box">
						<img src="${pageContext.request.contextPath}/images/jixu.png" style="width:110px;" />
						<a class="logo" style="left: 130px;" href="index.xsp">
							<span style="font-size: 22px;">船舶海图智能系统</span>
						</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
						<div class="admin-side-full">
							<i class="fa fa-life-bouy" aria-hidden="true"></i>
						</div>
					</div>
					<ul class="layui-nav admin-header-item">
						<!-- <li class="layui-nav-item">
							<a href="javascript:;">清除缓存</a>
						</li>
                        <li class="layui-nav-item" id="pay">
                            <a href="javascript:;">捐赠我</a>
                        </li>
						<li class="layui-nav-item">
							<a href="javascript:;">浏览网站</a>
						</li>
						<li class="layui-nav-item" id="video1">
							<a href="javascript:;">视频</a>
						</li> -->
						<li class="layui-nav-item">
							<a href="javascript:;" class="admin-header-user">
								<img src="${pageContext.request.contextPath}/images/0.jpg" />
								<span>${_currUserName}</span>	
							</a>
							<dl class="layui-nav-child">
								<dd>
									<!-- <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
								</dd>
								<dd>
									<a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
								</dd> -->
								<!-- <dd id="lock">
									<a href="javascript:;">
										<i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
									</a>
								</dd> -->
								<dd>
									<a href="${pageContext.request.contextPath}/console/user/logout.action"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
								</dd>
							</dl>
						</li>
					</ul>
					<ul class="layui-nav admin-header-item-mobile">
						<li class="layui-nav-item">
							<a href="${pageContext.request.contextPath}/console/user/logout.action"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-side layui-bg-black" id="admin-side">
				<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
			</div>
			<div class="layui-body" style="bottom: 0;border-left: solid 2px #1483C9;" id="admin-body">
				<div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
					<ul class="layui-tab-title">
						<li class="layui-this">
							<i class="fa fa-dashboard" aria-hidden="true"></i>
							<cite>首页</cite>
						</li>
					</ul>
					<div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
						<div class="layui-tab-item layui-show">
						<jsp:include page="./newFile.jsp" />
							<!-- <iframe src="./main.jsp"></iframe> -->
						</div>
					</div>
				</div>
			</div>
			<div class="layui-footer footer footer-demo" id="admin-footer">
				<div class="layui-main">
					<p>2017 &copy;
						 <a  href="javascript:;">船舶海图资料智能服务系统</a>
					</p>
				</div>
			</div>
			<div class="site-tree-mobile layui-hide">
				<i class="layui-icon">&#xe602;</i>
			</div>
			<div class="site-mobile-shade"></div>
			
		
			
			<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/datas/nav.js"></script>
			<script src="${pageContext.request.contextPath}/scripts/js/index.js"></script>
			<script type="text/javascript">
			
			
				/* layui.use('layer', function() {
					var $ = layui.jquery,
						layer = layui.layer;

					$('#video1').on('click', function() {
						layer.open({
							title: 'YouTube',
							maxmin: true,
							type: 2,
							content: 'video.html',
							area: ['800px', '500px']
						});
                    });
                    $('#pay').on('click', function () {
                        layer.open({
                            title: false,
                            type: 1,
                            content: '<img src="${pageContext.request.contextPath}/images/xx.png" />',
                            area: ['500px', '250px'],
                            shadeClose: true
                        });
                    });


				}); */
			</script>
		</div>
	</body>

</html>