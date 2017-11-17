<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.gzsolartech.smartforms.constant.bpm.BpmActivityType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<script type="text/javascript">
function openBizPanelDlg(id){
    window.open("${pageContext.request.contextPath }/console/bpm/activityBizPanel/index.xsp?activityId="+id);    
}
</script>
<div style="margin:5px;" >
		<c:forEach var="item" items="${bpmActivityMetas}" varStatus="status">
			       <c:choose>
				<c:when test="${status.index==0}">
					<table border="0px" id="metaList${status.index}_bizPanel">
						</c:when>
						<c:otherwise>
							<table border="0px" id="metaList${status.index}_bizPanel"
								style="display: none;">
								</c:otherwise>
								</c:choose>
							<tbody>
								<tr>
									<td width="120px" align="right">数据区域控制：</td>
									<td width="350px"><input type="button" value="配置"  onclick="openBizPanelDlg('${item.activityId}');"></td>
									<td width="120px" align="right"></td>
									<td width="350px" colspan=""></td>
								</tr>
							</tbody>
						</table>
						</c:forEach>
					</div>

