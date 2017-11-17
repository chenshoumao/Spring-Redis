<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/styles/bootstrap/pager/bootstrap-paginator.min.js"></script>
    <script type='text/javascript'>
    	$(function() {
    		var options = {
            currentPage: 3,
            totalPages: 10,
            itemTexts: function (type, page, current) {
	              switch (type) {
	                case "first":
	                  return "首页";
	                case "prev":
	                  return "上一页";
	                case "next":
	                  return "下一页";
	                case "last":
	                  return "末页";
	                case "page":
	                  return page;
	              }
	            },
           		//点击事件，用于通过Ajax来刷新整个list列表
	            onPageClicked: function (event, originalEvent, type, page) {
	            }
        	}

        	$('#example').bootstrapPaginator(options);
    	});
    </script>
    
</head>
<body>
	<div id="example"></div>
	
</body>
</html>