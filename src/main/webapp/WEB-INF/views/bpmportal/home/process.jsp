<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${formName}</title>
<link href="${pageContext.request.contextPath}/images/LOGO.ico" rel="shortcut icon" type="image/x-icon" />
<script src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js" type="text/javascript" charset="utf-8"></script>		
<script src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>		
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css"> 
	<script>
		var appId = '${appId}';
		var formId = '${formId}';
		var formName = '${formName}';
		$(function(){
			// 左导航特效
			$(".bpm_navdelits li").click(function(event) {
				var id = $(this).attr('id');
				$(this).addClass('active').siblings('li').removeClass('active');
				if(id=="dealtWithList"){
					$("#course_content").attr("src","${pageContext.request.contextPath}/bpmportal/home/process/bpmTaskInfo/index.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10");
				}else if(id=="haveTodoList"){
 					$("#course_content").attr("src","${pageContext.request.contextPath}/bpmportal/home/process/openHaveTodoList.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10");
				}else if(id=="myCreateList"){
					$("#course_content").attr("src","${pageContext.request.contextPath}/bpmportal/home/process/openMyCreateList.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10");
				}else if(id=="openNewForm"){
					window.open("${pageContext.request.contextPath}/console/template/engine/openform/${appId}/${formId}.xsp");
				}else if(id=="openRequisitionList"){
					$("#course_content").attr("src","${pageContext.request.contextPath}/bpmportal/home/process/openRequisitionList.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10");
				}else if(id=="toReadList"){
					$("#course_content").attr("src","${pageContext.request.contextPath}/bpmportal/home/process/openToIsReadList.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10&isRead=1");
				}else if(id=="unReadList"){
					$("#course_content").attr("src","${pageContext.request.contextPath}/bpmportal/home/process/openToIsReadList.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10&isRead=0");
				}
			});
		})
	</script>
	<style type="text/css">
		.bpm_header{
			height: 120px;
			background-color: #f4f4f4;
		    width: 100%;
		    border-bottom: 2px solid #0065b1;
		    margin-bottom: 36px;
		}
		.bpm_logo{
		    font-size: 35px;
		    font-weight: bold;
		    color: #000;
		    float: left;
		    margin-top: 40px;
		    font-family: serif;
	    }
	    .acc_h{
		    float: left;
		    height: 60px;
		    border: 1px solid #999;
		    margin-top: 29px;
		    margin-left: 20px;
	    }
	    .acc_com{
	        margin-left: 20px;
	        line-height: 16px;
		    float: left;
		    color: #999;
		    margin-top: 51px;
		    font-size: 39px;
	    }
		.message p{
		    line-height: 16px;
		    float: right;
		    color: #333;
		    margin-top: 30px;
		    font-size: 12px;
		}
		.message span {
		    font-size: 12px;
		}
		.BLogo img {
		    margin-top: -30px;
		    float: left;
		}
		.bpm_left{
			height: 300px;
			float: left;
		}
		.bpm_right{
			float: right;
		}
		.bpm_navHead{
			font-size: 16px;
			font-weight: bold;
			text-align: center;
			padding: 10px 15px;
			background-color: #1f8cdc;
			color: #fff;
		}
		.bpm_navdelits{
			text-align: center;
		}
		.nav-tabs>li>a {
		    border-radius: 0;
		}
		[class*="span"] {
		    float: left;
		    min-height: 1px;
		    margin-left: 0px;
		}
	</style>
</head>
	<body>
		<div class="bpm_header">
			<div class="container">
				<div class="BLogo">		
	 				<div class="bpm_logo"><!-- 续日智能表单平台 -->
	 				
	 			 	<img src="${pageContext.request.contextPath}/images/bpm/portal/aaclogo.png">   
	 				AAC Technologies
	 				</div>
	 				<div class="message">

						<p>
							您好，${_currUserName}，欢迎登录BPM管理平台&nbsp;&nbsp;|&nbsp;&nbsp; <span><a href="${pageContext.request.contextPath}/console/user/logout.action">退出</a></span>
						</p>
						<div style="clear: both;"></div>
						<p style="margin-top: -20px;">登录时间：<fmt:formatDate value="${now}" type="date" dateStyle="full"/></p>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="bpm_left span3">
				<div class="bpm_navHead">${formTitle}</div>
				<ul class="bpm_navdelits nav nav-tabs nav-stacked" role="tablist">
				  <li role="presentation" id="openNewForm" class=""><a href="javascript:void(0)">起草申请1</a></li>
				  <li role="presentation" id="dealtWithList" class="active"><a href="javascript:void(0)">待办中心</a></li>
				  <li role="presentation" id="haveTodoList" class=""><a href="javascript:void(0)">已办中心</a></li>
				  <li role="presentation" id="myCreateList" class=""><a href="javascript:void(0)">创建中心</a></li>
				  <li role="presentation" id="unReadList" class=""><a href="javascript:void(0)">待阅中心</a></li>
				  <li role="presentation" id="toReadList" class=""><a href="javascript:void(0)">已阅中心</a></li>
				  <li role="presentation" id="openRequisitionList" class=""><a href="javascript:void(0)">申请单</a></li>
				</ul>
			</div>
			<div class="bpm_right span9" style="margin-left: 20px">
				<iframe id="course_content" style="height: 508px" class="span9" src="${pageContext.request.contextPath}/bpmportal/home/process/bpmTaskInfo/index.xsp?appId=${appId}&formName=${formName}&nowPage=1&pageSize=10" height="104%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe> 
				<script>
					/* $("#course_content").load(function() {
					    var iframeHeight = $(this).contents().find("body").height();
					    console.log(iframeHeight);
					    $(this).height(iframeHeight);
					}); */
				</script>
			</div>
			<div style="clear: both;"></div>
		</div>
	</body>
</html>