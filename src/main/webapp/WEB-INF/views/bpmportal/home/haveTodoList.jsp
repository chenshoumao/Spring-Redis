<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/images/LOGO.ico" rel="shortcut icon" type="image/x-icon" />
<script src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js" type="text/javascript" charset="utf-8"></script>		
<script src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>		
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css"> 
<script src="${pageContext.request.contextPath}/scripts/jqPaginator.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>
<title>待办流程实例</title>
<style type="text/css">
	.acc_table_thead{
		line-height: 30px;
	    background-color: #1f8cdc;
	    color: #fff;
	}
	//请勿删除以下两个css任意一个
	.table th, .table td {
	    padding: 8px;
	    line-height: 20px;
	    text-align: center;
	    vertical-align: top;
	    border-top: 1px solid #ddd;
	}
	.table th, .table td {
	    padding: 8px;
	    line-height: 20px;
	    text-align: center;
	    vertical-align: top;
	    border-top: 1px solid #ddd;
	}
	//请勿删除以上两个css任意一个
	li {
	    display: inline;
	}
</style>
<script>
	var data = '${haveTodoList}';
	var appId = parent.appId;
	var formName = parent.formName;
	$(function(){
		$('#page').jqPaginator({
		    totalPages: ${haveTodoList.pageData.totalPageCount},
		    visiblePages: 10,
		    currentPage: ${haveTodoList.pageData.currentPage},
		    first: '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
		    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
		    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
		    last: '<li class="last"><a href="javascript:void(0);">最后一页</a></li>',
		    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
		    useOnPageChangeInit: false,	//使用让onPageChange方法在初始化时调用 默认为true
		    onPageChange: function (num) {
		    	var loadTip = layer.open({
					type : 3
				});
			   	window.location.href="${pageContext.request.contextPath}/bpmportal/home/process/openHaveTodoList.xsp?appId="+appId+"&formName="+formName+"&nowPage="+num+"&pageSize=10";
		    }
		});
	});
	
	function openDetails(docId){
	   	window.open("${pageContext.request.contextPath}/console/template/engine/opendocument/"+appId+"/"+docId+".xsp");
	}
	
	
</script>
</head>
	<body style="height: 100%;">
		<div class="container span9">
			<table class="table" style="text-align: center;">
		      <caption><span></span></caption>
		      <thead class="acc_table_thead">
		        <tr>
		          <th class="span1">序号</th>
		          <th class="sapn2">标题</th>
		          <th class="sapn2">当前环节</th>
		          <th class="sapn2">当前处理人</th>
		          <th class="sapn2">办理时间</th>
		        </tr>
		      </thead>
		      <tbody>
		        <c:forEach var="item" items="${haveTodoList.result}" varStatus="status">
		      	    <tr>
			          <td>${status.index + 1}</td>
			          <td><a title="${item.DOCUMENT_TITLE }" target="_blank" onclick="openDetails('${item.DOCUMENT_ID}')" href="javascript:void(0)">
			        	  
			        	  <c:choose>
						  <c:when test="${fn:length(item.DOCUMENT_TITLE)>20}">
						  ${fn:substring(item.DOCUMENT_TITLE, 0, 19)}...
						  </c:when>
						  <c:when test="${fn:length(item.DOCUMENT_TITLE)==''}">
						  	无标题
						  </c:when>
						  <c:otherwise>${item.DOCUMENT_TITLE}</c:otherwise>
						  </c:choose>
			          </a></td>
			          <td>${item.TASK_NAME}</td>
			          <td>${item.TO_USER_NAME}</td>
			          <td>${item.CREATE_TIME}</td>
			        </tr>
		      	</c:forEach>
		      </tbody>
			  <tfoot>
			  	<tr>
			  		<td colspan="5"></td>
			  	</tr>
			  </tfoot>
		    </table>
		    <div class="pagination" style="text-align: right;padding: 0;">
	  			<ul id="page" >
				
				</ul>
			</div>
		</div>
	</body>
</html>
