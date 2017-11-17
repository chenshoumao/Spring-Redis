<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">
	function datagrid(name) {
		$('#dg')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/orgCompany/shows.action',
							method : 'POST',
							queryParams : {
								"name" : name
							},
							striped : true,
							nowrap : true,
							pageSize : 17,
							pageNumber : 1,
							pageList : [ 17 ],
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							pagination : true,
							toolbar : "#toolbar",
							singleSelect : false,
							checkOnSelect : false,
							selectOnCheck : false,
							columns : [ [ {
								field : 'ck',
								checkbox : true
							}, {
								field : 'companyNum',
								title : '公司id',
								width : 100,
								align : 'center',
								hidden : true
							}, {
								field : 'companyCode',
								title : '编码',
								width : 100,
								align : 'center'
							}, {
								field : 'companyName',
								title : '名称',
								width : 400,
								align : 'center'
							}, {
								field : 'companyNick',
								title : '昵称',
								width : 400,
								align : 'center'
							}, {
								field : 'companyEnname',
								title : '英文名称',
								width : 400,
								align : 'center'
							}, {
								field : 'companyEnnick',
								title : '英文昵称',
								width : 400,
								align : 'center'
							} ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
							onDblClickRow : function(rowIndex, rowData) {
								editRole(rowData);
							}
						});
	}
	function searchByName() {
		datagrid($("#name").val());
	}
	
	 document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];       
             if(e && e.keyCode==13){ // enter 键
                searchByName();
            }
        }; 
        
	$(function() {
		datagrid("");

	});
</script>
</head>
<body>
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">

		名称:<input type="text" id="name" style="width: 140px;"> <a
			href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="searchByName()"> 查询 </a>
	</div>
</body>
</html>