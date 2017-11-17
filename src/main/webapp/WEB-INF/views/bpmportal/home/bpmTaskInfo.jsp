<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/images/LOGO.ico"
	rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/layer/skin/layer.css">
<script
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jsrender.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ajaxRebuild.js"></script>
<script src="${pageContext.request.contextPath}/scripts/jqPaginator.js"
	type="text/javascript" charset="utf-8"></script>

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
	function getData(page, rows) {
		var loadTip = layer.open({
			type : 3
		});
		$
				.ajax({
					url : "${pageContext.request.contextPath}/console/bpm/taskInfo/findByPage.action",
					type : "post",
					data : {
						page : page,
						rows : rows,
						appId : "${appId}",
						formName : "${formName}"
					},
					dataType : "json",
					success : function(result) {
						layer.close(loadTip);
						if (result.state == true) {
							var data = result.data;
							$("#bmpTaskInfoId").html("");
							var content = "";
							for (var i = 0; i < data.length; i++) {
								var title = data[i].DOCTITLE;
								if (title == ""||title==null) {
									title = "无标题";
								} 
								if (title.length > 30) {
									title = title.substring(0, 30) + "...";
								}
								content += "<tr>";
								content += "<td>" + (i + 1) + "</td>";
								content += "<td><a target=\"_blank\" title=\""+data[i].DOCTITLE+"\""+  
								"href=\"${pageContext.request.contextPath}/console/template/engine/opendocument/"+
								data[i].APPID+"/"+data[i].DOCUMENT_ID+".xsp?mode=edit&taskId="
								+data[i].TASKID+"\">"+ title + "</a></td>";
								content += "<td>" + data[i].TASK_NAME + "</td>";
								content += "<td>${_currUserNickName}</td>";
								content += "<td>" + data[i].CREATE_TIME
										+ "</td>";
								content += "</tr>";
							}

							$("#bmpTaskInfoId").html(content);
							$('#page').jqPaginator({
								totalPages : result.pagecout,
								visiblePages : 10,
								currentPage : result.pagenumber,
								onPageChange : function(num, type) {
									getData(num,rows);
								}
							});

						}

					},
					error : function() {
						layer.close(loadTip);
					}
				});
	}

	$(function() {
		getData(1, 10);

	});
</script>

<title>待办流程实例</title>
</head>
<body style="height: 100%;">
	<div class="container span9">
		<table class="table" style="text-align: center;">
			<caption>
				<span></span>
			</caption>
			<thead class="acc_table_thead">
				<tr>
					<th class="span1">序号</th>
					<th class="sapn2">标题</th>
					<th class="sapn2">当前环节</th>
					<th class="sapn2">当前处理人</th>
					<th class="sapn2">创建时间</th>
				</tr>
			</thead>
			<tbody id="bmpTaskInfoId">
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5"></td>
				</tr>
			</tfoot>
		</table>
		<div class="pagination" style="text-align: right; padding: 0;">
			<ul id="page">

			</ul>
		</div>
	</div>
</html>
