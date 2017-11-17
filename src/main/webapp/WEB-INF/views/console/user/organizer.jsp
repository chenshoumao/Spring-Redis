<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/seach.css" />
<link
	href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/node.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<style type="text/css">
.desktopListTabDiv  table {
    width: 100%;
    height: 50px;
    margin-top: 2%;
}
.desktopTabDiv table {
    width: 100%;
    height: 50px;
}
 fieldset {
padding:10px;
margin:10px;
width:95%;
color:#333; 
border:#06c dashed 1px;
} 
legend {
color:#06c;
   font-weight:800; 
    display: block;
    width: 33%;
    padding: 0;
    margin-bottom: 0px;
    font-size: 21px;
    line-height: 40px;
    color: #333;
    border: 0;
    border-bottom: none;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
    //打开选择人员对话框
	function _openUserDlg(id) {
		var url = $("#basePath").val() + "/console/tag/user/index.xsp?id=" + id
				+ "&documentId=&singleSelect=false&showcurrent=true";
		window.open(encodeURI(url),"newWindows", 'height=600,width=1000');
	}
	//打开选择部门对话框
	function opneDeptDlg(deptName,deptValue) {
		var iframe_DeptDlg = parent.layer.open({
        id: 'iframe_DeptDlg',
	      type: 2,
	      title: '',
	      skin: 'layui-layer-rim', //加上边框
	      shadeClose: true,
	      //shade: true,
	      maxmin: false, //开启最大化最小化按钮
	      area: ['543px', '400px'],
	      content:  $("#basePath").val()
			+ "/console/department/deptDlg.xsp",
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				// 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
				var iframeWin = top.window[layero.find('iframe')[0]['name']]; 
				// iframeWin.validate();
		     var  data=iframeWin.getCheckedData();
		     console.log(data.length);
	           var value = "";
	          var name = "";
	          for (var i = 0; i < data.length; i++) {
		            value += data[i].id + ";";
		            name += data[i].name + ";";
	         }
	        $("#"+deptName).val(name);
	       $("#"+deptValue).val(value); 
	        parent.layer.close(iframe_DeptDlg);  
			},
			btn2 : function(index, layero) {
			}
	    });
	}
	
//打开选择角色对话框
function openRoleDlg(){
    var iframe_roleDlg = parent.layer.open({
        id: 'iframe_roleDlg',
	      type: 2,
	      title: '',
	      skin: 'layui-layer-rim', //加上边框
	      shadeClose: true,
	      //shade: true,
	      maxmin: false, //开启最大化最小化按钮
	      area: ['543px', '400px'],
	      content:  $("#basePath").val()
			+ "/console/role/selectRoleView.xsp",
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				// 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
				var iframeWin = top.window[layero.find('iframe')[0]['name']]; 
				// iframeWin.validate();
		      var  alreadSelectBackLink=iframeWin.saveAlreadSelectRoleData();
	          var value = "";
	          var name = "";
	          for (var i = 0; i < alreadSelectBackLink.length; i++) {
		            value += alreadSelectBackLink[i].value + ";";
		            name += alreadSelectBackLink[i].text + ";";
	         }
	        $("#roleName").val(name);
	       $("#roleNum").val(value);
	        parent.layer.close(iframe_roleDlg);  
			},
			btn2 : function(index, layero) {
			}
	    });
}
           
 

</script>
</head>
<body>
<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
<br>
  <table border="0px" style="height: 200px;width: 100%;">
							<tbody>
								<tr>
									<td width="60px" align="right">人员：</td>
									<td width="300px">
									    <input type="text" name="peopleRead"  id="peopleRead"style="width: 320px;" value="${rights.empRead}"/>
										     <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="_openUserDlg('peopleRead');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" name="peopleRead_num" id="peopleRead_num" value="${rights.empReadId}"/>
	                                </span>	
									
									</td>
									
								</tr>
								<tr>
									<td width="60px" align="right">部门：</td>
									<td >
									 <input type="text" id="deptRead"  name="deptRead" style="width: 320px;" value="${rights.deptRead}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneDeptDlg('deptRead','deptRead_num');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="deptRead_num"  name="deptRead_num"  value="${rights.deptReadId}"/>
	                                </span>
									</td>
								</tr>
								<tr>
									<td width="60px" align="right">角色：</td>
									<td >
									 <input type="text" id="roleName"  name="roleName" style="width: 320px;"value="${rights.roleRead}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="openRoleDlg();"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="roleNum"  name="roleNum" value="${rights.roleReadId}"/>
	                                </span>
									</td>
								</tr>
							</tbody>
						</table>
						
						
	<!-- 	<div id="roleDlg" class="easyui-dialog" style="width: 560px; height: 400px"
		     closed="true" buttons="#roleDlgButtons"  modal="true">
				 <iframe id="iframe_roleDlg" name="iframe_roleDlg" src=""
		                allowTransparency="true" scrolling="auto" width="100%" 
		                height="100%"frameBorder="0" name=""></iframe> 
	   </div> -->
</body>
</html>