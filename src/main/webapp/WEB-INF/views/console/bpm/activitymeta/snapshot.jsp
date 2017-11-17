<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot" %>
	<style>
.selectUserBtn {
       display: inline-block;
    width: 28px;
    height: 22px;
    background: url(../../../images/bpm/manhead.png) center center #bfbfbf no-repeat;
    position: relative;
    top: 2px;
    border-radius: 3px;
}
</style>

<div class="" style="margin-top: 35px; width: 100%">
	<div  class="easyui-tabs" style="width:100%; height:350px;">
		<div title="快照属性" style="">
			<div class="desktopTabDiv" style="margin-top: 30px">
						<table border="0px">
							<tbody>
								<tr style="height: 65px;">
									<td width="150px" align="right">快照名称：</td>
									<td width="350px"><input type="text" id="snapshotName"
										style="width: 320px;" name="snapshotName" readonly="readonly"
										class="form-control"
										value="${bpmProcessSnapshot.snapshotName}"></td>
									<td width="150px" align="right">流程图名称：</td>
									<td width="350px" colspan="2"><input type="text"
										id="bpdName" name="bpdName" readonly="readonly"
										style="width: 320px;" class="form-control"
										value="${bpmProcessSnapshot.bpdName}"></td>
								</tr>
								<tr style="height: 65px;">
									<td align="right">流程图ID：</td>
									<td><input type="text" id="bpdId"
										name="bpdId" style="width: 320px;" readonly="readonly"
										class="form-control" value="${bpmProcessSnapshot.bpdId}">
									</td>
									<td align="right">流程图快照ID：</td>
									<td><input type="text" id="snapshotBpdId"
										style="width: 320px;" name="snapshotBpdId" readonly="readonly"
										class="form-control"
										value="${bpmProcessSnapshot.snapshotBpdId}"></td>
								</tr>
								<tr style="height: 65px;">
									<td align="right">流程图应用库ID：</td>
									<td><input type="text" id="processAppId"
										name="processAppId" readonly="readonly" class="form-control"
										style="width: 320px;"
										value="${bpmProcessSnapshot.processAppId}"></td>
									<td align="right">表单页面路径：</td>
									<td colspan="2"><input type="text"
										name="formPath" class="form-control" readonly="readonly"
										style="width: 320px;" value="${bpmProcessSnapshot.formPath}">
									</td>
								</tr>
								<tr>
									<td align="right">重做任务缺省处理人：</td>
									<td>
										<input type="radio" name="redoWithTransfer" 
											value="no" <c:if test='${bpmProcessSnapshot.redoWithTransfer=="no"}'>checked="checked"</c:if> />使用环节配置
										&nbsp;<input type="radio" name="redoWithTransfer" 
											value="yes" <c:if test='${bpmProcessSnapshot.redoWithTransfer=="yes"}'>checked="checked"</c:if> />使用转签人员
									</td>
									<td align="right">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
		</div>
		<div title="快照SLA配置" style="margin-left:2%;margin-top:1%">
		    <form action="" id="formSnapshotSlaCfg">
		    <input type="hidden" name="processSnapshotId" id="processSnapshotId" 
		    	value="${bpmProcessSnapshot.snapshotId}" />
		   <div style="float:left;width:48%;">
		   <span style="width: 29%;display: inline-block;text-align: right;">流程管理员：</span>
		   <input type="text" style="height: 15px;width:165px" name="processOwner" id="processOwner" readonly="readonly" value=""> 
	     <input type="hidden" name="processOwner_num" id="processOwner_num" value="${bpmProcessSnapshot.processOwner}"> 
          <a href="#" class="selectUserBtn" onclick="_selectPerson('processOwner')">
	     </a>
		   <br>
			<span style="width: 29%;display: inline-block;text-align: right;">流程缺省读者：</span>
			  <input type="text" style="height: 15px;width:165px" name="processReader" id="processReader" readonly="readonly" value=""> 
	     <input type="hidden" name="processReader_num" id="processReader_num"  value="${bpmProcessSnapshot.processReader}"> 
          <a href="#" class="selectUserBtn" onclick="_selectPerson('processReader')"></a>
			<br>
			<span style="width: 29%;display: inline-block;text-align: right;">流程实例每小时成本：</span><input type="text" name="instanceCostPrehour"   value="${bpmProcessSnapshot.instanceCostPrehour}"  id="instanceCostPrehour" style="height: 15px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><br>
			<span style="width: 29%;display: inline-block;text-align: right;">实例运行时长：</span><input type="text" name="instanceRuntime"  value="${bpmProcessSnapshot.instanceRuntime}"  id="instanceRuntime" style="height: 15px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><br>
			<span style="width: 29%;display: inline-block;text-align: right;">实例运行时间单位：</span>
			<select name="instanceRuntimeUnit" id="instanceRuntimeUnit" style="height: 24px;padding-top: 0%;">
			<option value="minute"  <c:if test="${bpmProcessSnapshot.instanceRuntimeUnit=='minute'}">selected="selected"</c:if>>分钟</option>
			<option value="hour" <c:if test="${bpmProcessSnapshot.instanceRuntimeUnit=='hour'}">selected="selected"</c:if>>小时</option>
			<option value="day" <c:if test="${bpmProcessSnapshot.instanceRuntimeUnit=='day'}">selected="selected"</c:if>>天</option>
			</select><br>
			<span style="width: 29%;display: inline-block;text-align: right;">超时通知内容模板：</span>
			<select style="height: 24px;padding-top: 0%;" id="overtimeTemplateId" name="overtimeTemplateId">
		    <c:forEach var="item" items="${dDatContentTemplate}">
		   <option value="${item.ctplId}"  <c:if test="${bpmProcessSnapshot.overtimeTemplateId==item.ctplId}">selected="selected"</c:if> >${item.ctplName}</option>
		  </c:forEach>
		   </select><br>
			<span style="width: 29%;display: inline-block;text-align: right;">超时通知人员：</span>
			<input type="text" style="height: 15px;width:165px" name="overtimeNotifyPeople" id="overtimeNotifyPeople" readonly="readonly" value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.name}"> 
	       <input type="hidden" name="overtimeNotifyPeopleP" id="overtimeNotifyPeopleP" value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.empName}"> 
            <input type="hidden" name="overtimeNotifyPeoplePId" id="overtimeNotifyPeoplePId" value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.empId}"> 
            <input type="hidden" name="overtimeNotifyPeopleD" id="overtimeNotifyPeopleD" value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.deptName}"> 
            <input type="hidden" name="overtimeNotifyPeopleDId" id="overtimeNotifyPeopleDId" value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.deptId}"> 
            <input type="hidden" name="overtimeNotifyPeopleR" id="overtimeNotifyPeopleR" value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.roleName}"> 
            <input type="hidden" name="overtimeNotifyPeopleRId" id="overtimeNotifyPeopleRId"  value="${bpmProcessSnapshot.overtimeNotifyPeopleMap.roleId}"> 
            <a href="#" class="selectUserBtn" onclick="openOrganizerDlg('overtimeNotifyPeople')"></a>
			<br>
		   <span style="width: 29%;display: inline-block;text-align: right;">申请人催办内容模板：</span>
		   <select id="creatorRemindTplId" name="creatorRemindTplId" style="height: 24px;padding-top: 0%;">
		    <c:forEach var="item" items="${dDatContentTemplate}">
		   <option value="${item.ctplId}" <c:if test="${bpmProcessSnapshot.creatorRemindTplId==item.ctplId}">selected="selected"</c:if> >${item.ctplName}</option>
		  </c:forEach>
		   </select><br>
		   </div>
		    <div style="float:left;width:48%;">
		      <span style="width: 26%;display: inline-block;text-align: right;">是否重复通知：</span>
		      <select id="overtimeNotifyIsLoop" name="overtimeNotifyIsLoop" style="height: 24px;padding-top: 0%;">
		      <option value="no" <c:if test="${bpmProcessSnapshot.overtimeNotifyIsLoop=='no'}">selected="selected"</c:if>>否</option>
		      <option value="yes" <c:if test="${bpmProcessSnapshot.overtimeNotifyIsLoop=='yes'}">selected="selected"</c:if>>是</option>
		      </select><br>
		      <span style="width: 26%;display: inline-block;text-align: right;">重复超时通知人员：</span>
		   	<input type="text" style="height: 15px;width:165px" name="overtimeLoopNotifyPeople" id="overtimeLoopNotifyPeople" readonly="readonly" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.name}"> 
	       <input type="hidden" name="overtimeLoopNotifyPeopleP" id="overtimeLoopNotifyPeopleP" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.empName}"> 
            <input type="hidden" name="overtimeLoopNotifyPeoplePId" id="overtimeLoopNotifyPeoplePId" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.empId}"> 
            <input type="hidden" name="overtimeLoopNotifyPeopleD" id="overtimeLoopNotifyPeopleD" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.deptName}"> 
            <input type="hidden" name="overtimeLoopNotifyPeopleDId" id="overtimeLoopNotifyPeopleDId" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.deptId}"> 
            <input type="hidden" name="overtimeLoopNotifyPeopleR" id="overtimeLoopNotifyPeopleR" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.roleName}"> 
            <input type="hidden" name="overtimeLoopNotifyPeopleRId" id="overtimeLoopNotifyPeopleRId" value="${bpmProcessSnapshot.overtimeLoopNotifyPeopleMap.roleId}"> 
            <a href="#" class="selectUserBtn" onclick="openOrganizerDlg('overtimeLoopNotifyPeople')"></a>
		    <br>
			  <span style="width: 26%;display: inline-block;text-align: right;">重复初始时间：</span><input type="text" name="loopStartTimeSpan"  value="${bpmProcessSnapshot.loopStartTimeSpan}"  id="loopStartTimeSpan" style="height: 15px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><br>
			  <span style="width: 26%;display: inline-block;text-align: right;">重复初始时间单位：</span>
			  <select id="loopStartTimeUnit" name="loopStartTimeUnit" style="height: 24px;padding-top: 0%;">
			 	 <option value="minute"  <c:if test="${bpmProcessSnapshot.loopStartTimeUnit=='minute'}">selected="selected"</c:if>>分钟</option>
			     <option value="hour" <c:if test="${bpmProcessSnapshot.loopStartTimeUnit=='hour'}">selected="selected"</c:if>>小时</option>
			     <option value="day" <c:if test="${bpmProcessSnapshot.loopStartTimeUnit=='day'}">selected="selected"</c:if>>天</option>
			  </select><br>
			  <span style="width: 26%;display: inline-block;text-align: right;"> 重复时间间隔：</span><input type="text" name="loopTimeSpan"  value="${bpmProcessSnapshot.loopTimeSpan}"   id="loopTimeSpan" style="height: 15px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><br>
			  <span style="width: 26%;display: inline-block;text-align: right;">重复时间间隔单位：</span>
			  <select id="loopTimeUnit" name="loopTimeUnit" style="height: 24px;padding-top: 0%;">
			  	<option value="minute"  <c:if test="${bpmProcessSnapshot.loopTimeUnit=='minute'}">selected="selected"</c:if>>分钟</option>
			    <option value="hour" <c:if test="${bpmProcessSnapshot.loopTimeUnit=='hour'}">selected="selected"</c:if>>小时</option>
			    <option value="day" <c:if test="${bpmProcessSnapshot.loopTimeUnit=='day'}">selected="selected"</c:if>>天</option>
			  </select><br>
			  <span style="display: inline-block;text-align: right;">超时重复通知内容模板：</span>
			  <select id="overtimeLoopTplId" name="overtimeLoopTplId" style="height: 24px;padding-top: 0%;">
				    <c:forEach var="item" items="${dDatContentTemplate}">
				   <option value="${item.ctplId}" <c:if test="${bpmProcessSnapshot.overtimeLoopTplId==item.ctplId}">selected="selected"</c:if> >${item.ctplName}</option>
				  </c:forEach>
			  </select>
		    </div>
		  </form>
		</div>
		<div title="快照事件">
			<div style="margin-top: 30px; width:100%">
				<table border="0px">
					<tbody>
						<tr style="height:50px">
							<td width="150px" align="right">超时通知触发事件类：</td>
							<td width="350px">
								<input type="text" id="overtimeNotifyEvent"
									style="width: 320px;" name="overtimeNotifyEvent" 
									class="form-control"
									value="${bpmProcessSnapshot.overtimeNotifyEvent}" />
							</td>
							<td width="150px" align="right">重复通知触发事件类：</td>
							<td width="350px" colspan="2">
								<input type="text" id="loopNotifyEvent"
									style="width: 320px;" name="loopNotifyEvent" 
									class="form-control"
									value="${bpmProcessSnapshot.loopNotifyEvent}" />
							</td>
						</tr>
						<tr style="height:50px">
							<td width="150px" align="right">流程实例启动事件类：</td>
							<td width="350px">
								<input type="text" id="instanceStartEvent"
									style="width: 320px;" name="instanceStartEvent" 
									class="form-control"
									value="${bpmProcessSnapshot.instanceStartEvent}" />
							</td>
							<td width="150px" align="right">流程实例结束事件类：</td>
							<td width="350px">
								<input type="text" id="instanceEndEvent"
									style="width: 320px;" name="instanceEndEvent" 
									class="form-control"
									value="${bpmProcessSnapshot.instanceEndEvent}" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</div>