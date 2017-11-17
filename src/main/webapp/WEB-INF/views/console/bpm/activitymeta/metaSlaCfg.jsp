<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.gzsolartech.smartforms.constant.bpm.BpmActivityType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<script type="text/javascript">
//校验只能输入float类型值
function  checkInputFloat(oInput)
{
    if('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/,''))
    {
        oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' :oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
    }
}
</script>
<br>
<c:forEach var="item" items="${bpmActivityMetas}" varStatus="status">
			       <c:choose>
				<c:when test="${status.index==0}">
					<table border="0px" id="metaList${status.index}_sla">
						</c:when>
						<c:otherwise>
							<table border="0px" id="metaList${status.index}_sla"
								style="display: none;">
								</c:otherwise>
								</c:choose>
								<tbody>
								<tr>
									<td width="170px" align="right">运行时长：</td>
									<td>
									    <input type="text" class="form-control" name="activityRuntime${status.index}"  value="${item.activityRuntime}"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
									 </td>
										<td width="170px" align="right">运行时间单位：</td>
										<td width="300px">
										<select class="form-control" name="activityRuntimeUnit${status.index}">
										<option value="minute" <c:if test="${item.activityRuntimeUnit=='minute'}">
		                                   	selected="selected"</c:if>>分钟</option>
										<option value="hour" <c:if test="${item.activityRuntimeUnit=='hour'}">
		                                   	selected="selected"</c:if>>小时</option>
										<option value="day" <c:if test="${item.activityRuntimeUnit=='day'}">
		                                   		selected="selected"</c:if>>天</option>
										</select>
										</td>
									</tr>
									<tr>
									<td width="170px" align="right">每小时成本：</td>
									<td>
									    <input type="text" class="form-control" name="activityCostPrehour${status.index}"  value="${item.activityCostPrehour}" onkeyup="checkInputFloat(this);" onafterpaste="checkInputFloat(this);">
									 </td>
										<td width="170px" align="right">是否重复通知：</td>
										<td width="300px">
										  <select name="overtimeNotifyIsLoop${status.index}" class="form-control" >
										  <option value="no" <c:if test="${item.overtimeNotifyIsLoop=='no'}">
		                                   		selected="selected"</c:if>>否</option>
										  <option value="yes" <c:if test="${item.overtimeNotifyIsLoop=='yes'}">
		                                   		selected="selected"</c:if>>是</option>
										  </select>
										</td>
									</tr>
									<tr>
									<td width="170px" align="right">超时通知内容模板：</td>
									<td>
									   <select name="overtimeTemplateId${status.index}" style="height: 24px;padding-top: 0%;">
		                                  <c:forEach var="contentTemplate" items="${dDatContentTemplate}">
		                                 <option value="${contentTemplate.ctplId}" <c:if test="${item.overtimeTemplateId==contentTemplate.ctplId}">
		                                   		selected="selected"</c:if>>${contentTemplate.ctplName}</option>
		                                  </c:forEach>
		                                  </select>
									 </td>
										<td width="170px" align="right">超时通知人员：</td>
										<td width="300px">
											   <input type="text" style="height: 15px;width:176px" name="overtimeNotifyPeople${status.index}" id="overtimeNotifyPeople${status.index}" readonly="readonly" value="${item.overtimeNotifyPeopleMap.name}"> 
										       <input type="hidden" name="overtimeNotifyPeople${status.index}P" id="overtimeNotifyPeople${status.index}P" value="${item.overtimeNotifyPeopleMap.empName}"> 
									            <input type="hidden" name="overtimeNotifyPeople${status.index}PId" id="overtimeNotifyPeople${status.index}PId" value="${item.overtimeNotifyPeopleMap.empId}"> 
									            <input type="hidden" name="overtimeNotifyPeople${status.index}D" id="overtimeNotifyPeople${status.index}D" value="${item.overtimeNotifyPeopleMap.deptName}"> 
									            <input type="hidden" name="overtimeNotifyPeople${status.index}DId" id="overtimeNotifyPeople${status.index}DId" value="${item.overtimeNotifyPeopleMap.deptId}"> 
									            <input type="hidden" name="overtimeNotifyPeople${status.index}R" id="overtimeNotifyPeople${status.index}R" value="${item.overtimeNotifyPeopleMap.roleName}"> 
									            <input type="hidden" name="overtimeNotifyPeople${status.index}RId" id="overtimeNotifyPeople${status.index}RId" value="${item.overtimeNotifyPeopleMap.roleId}"> 
                                                <a href="#" class="selectUserBtn" onclick="openOrganizerDlg('overtimeNotifyPeople${status.index}')"></a>
										</td>
									</tr>
									<tr>
									<td width="170px" align="right">超时重复通知模板：</td>
									<td>
									 <select name="overtimeLoopTplId${status.index}" style="height: 24px;padding-top: 0%;">
		                                   <c:forEach var="contentTemplate" items="${dDatContentTemplate}">
		                                 <option value="${contentTemplate.ctplId}" <c:if test="${item.overtimeLoopTplId==contentTemplate.ctplId}">
		                                   		selected="selected"</c:if>>${contentTemplate.ctplName}</option>
		                                  </c:forEach>
		                                  </select>
									 </td>
										<td width="170px" align="right">重复超时通知人员：</td>
										<td width="300px">
												   <input type="text" style="height: 15px;width:176px" name="overtimeLoopNotifyPeople${status.index}" id="overtimeLoopNotifyPeople${status.index}" readonly="readonly" value="${item.overtimeLoopNotifyPeopleMap.name}"> 
											       <input type="hidden" name="overtimeLoopNotifyPeople${status.index}P" id="overtimeLoopNotifyPeople${status.index}P" value="${item.overtimeLoopNotifyPeopleMap.empName}"> 
										            <input type="hidden" name="overtimeLoopNotifyPeople${status.index}PId" id="overtimeLoopNotifyPeople${status.index}PId" value="${item.overtimeLoopNotifyPeopleMap.empId}"> 
										            <input type="hidden" name="overtimeLoopNotifyPeople${status.index}D" id="overtimeLoopNotifyPeople${status.index}D" value="${item.overtimeLoopNotifyPeopleMap.deptName}"> 
										            <input type="hidden" name="overtimeLoopNotifyPeople${status.index}DId" id="overtimeLoopNotifyPeople${status.index}DId" value="${item.overtimeLoopNotifyPeopleMap.deptId}"> 
										            <input type="hidden" name="overtimeLoopNotifyPeople${status.index}R" id="overtimeLoopNotifyPeople${status.index}R" value="${item.overtimeLoopNotifyPeopleMap.roleName}"> 
										            <input type="hidden" name="overtimeLoopNotifyPeople${status.index}RId" id="overtimeLoopNotifyPeople${status.index}RId" value="${item.overtimeLoopNotifyPeopleMap.roleId}"> 
	                                                <a href="#" class="selectUserBtn" onclick="openOrganizerDlg('overtimeLoopNotifyPeople${status.index}')"></a>
										</td>
									</tr>
									<tr>
									<td width="170px" align="right">重复初始时间：</td>
									<td>
									    <input type="text" class="form-control" name="loopStartTimeSpan${status.index}"  value="${item.loopStartTimeSpan}"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
									 </td>
										<td width="170px" align="right">重复初始时间单位：</td>
										<td width="300px">
											<select class="form-control" name="loopStartTimeUnit${status.index}">
											<option value="minute" <c:if test="${item.loopStartTimeUnit=='minute'}">
		                                   	selected="selected"</c:if>>分钟</option>
												<option value="hour" <c:if test="${item.loopStartTimeUnit=='hour'}">
		                                   	selected="selected"</c:if>>小时</option>
										     <option value="day" <c:if test="${item.loopStartTimeUnit=='day'}">
		                                   		selected="selected"</c:if>>天</option>
											</select>
										</td>
									</tr>
									<tr>
									<td width="170px" align="right">重复时间间隔：</td>
									<td>
									    <input type="text" class="form-control" name="loopTimeSpan${status.index}"  value="${item.loopTimeSpan}"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
									 </td>
										<td width="170px" align="right">重复时间间隔单位：</td>
										<td width="300px">
										<select class="form-control" name="loopTimeUnit${status.index}">
										<option value="minute" <c:if test="${item.loopTimeUnit=='minute'}">
		                                   	selected="selected"</c:if>>分钟</option>
										<option value="hour" <c:if test="${item.loopTimeUnit=='hour'}">
		                                   	selected="selected"</c:if>>小时</option>
										<option value="day" <c:if test="${item.loopTimeUnit=='day'}">
		                                   		selected="selected"</c:if>>天</option>
										</select>
										</td>
									</tr>
									<tr>
									<td width="170px" align="right">超时通知触发事件类：</td>
									<td>
									    <input type="text" class="form-control" name="overtimeNotifyEvent${status.index}" 
									    	value="${item.overtimeNotifyEvent}">
									 </td>
										<td width="170px" align="right">重复通知触发事件类：</td>
										<td width="300px">
										<input type="text" class="form-control" name="loopNotifyEvent${status.index}" 
											value="${item.loopNotifyEvent}">
									</tr>
										<tr>
									<td width="170px" align="right">重复超时最后时间：</td>
									<td>
									    <input type="text" class="form-control" name="overTimeDeadline${status.index}"  
									    	value="${item.overTimeDeadline}"  
									    	onkeyup="this.value=this.value.replace(/\D/g,'')" 
									    	onafterpaste="this.value=this.value.replace(/\D/g,'')">
									 </td>
										<td width="170px" align="right">超时最后时间单位：</td>
										<td width="300px">
											<select class="form-control" name="overTimeDeadlineUnit${status.index}">
											<option value="minute" <c:if test="${item.overTimeDeadlineUnit=='minute'}">
		                                   		selected="selected"</c:if>>分钟</option>
											<option value="hour" <c:if test="${item.overTimeDeadlineUnit=='hour'}">
		                                   		selected="selected"</c:if>>小时</option>
										     <option value="day" <c:if test="${item.overTimeDeadlineUnit=='day'}">
		                                   		selected="selected"</c:if>>天</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="170px" align="right">超时最后时间事件：</td>
										<td>
										   	<select class="form-control" name="overTimeDeadlineEvent${status.index}">
													<option value="transfer" >转签</option>
												</select>
										 </td>
										<td width="170px" align="right"></td>
										<td width="300px"></td>
									</tr>
									</tbody>
								</table>
							</c:forEach>