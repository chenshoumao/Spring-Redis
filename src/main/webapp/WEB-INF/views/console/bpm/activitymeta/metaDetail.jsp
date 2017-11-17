<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.gzsolartech.smartforms.constant.bpm.BpmActivityType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<div class=""
	style="margin-top: 35px; width: 74.5%; float: right; height: 720px;">
		<!-- 环节tab开始 -->
		<div  id="desktopListTabDiv" class="easyui-tabs" style="width:100%; height:710px;">
		<div title="环节属性" style="">
		<br/>
		<c:forEach var="item" items="${bpmActivityMetas}" varStatus="status">
			<c:choose>
				<c:when test="${status.index==0}">
					<table border="0px" id="metaList${status.index}">
						</c:when>
						<c:otherwise>
							<table border="0px" id="metaList${status.index}"
								style="display: none;">
								</c:otherwise>
								</c:choose>
								<tbody>
									<tr>
										<td width="170px" align="right">环节名称： <input
											type="hidden" name="activityId${status.index}"
											value="${item.activityId}"></td>
										<td colspan="3">
											<input type="text"
												value="${item.activityName}"
												name="activityName${status.index}" readonly="readonly"
												class="form-control" style="width: 90%">
										</td>
									</tr>
									<tr>
										<td width="170px" align="right">是否允许退回：</td>
										<td width="300px">
											<label class="radio-inline"> <c:choose>
													<c:when test="${item.allowReject== 'y'}">
														<input type="radio" checked
															name="allowReject${status.index}" value="y">
														允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowReject${status.index}"
															value="y">允许
												</c:otherwise>
												</c:choose>
											</label> 
											<label class="radio-inline"> <c:choose>
													<c:when test="${item.allowReject== 'n'}">
														<input type="radio" name="allowReject${status.index}"
															value="n" checked> 不允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowReject${status.index}"
															value="n"> 不允许
												</c:otherwise>
												</c:choose>
											</label>
										</td>
										<td width="170px" align="right">是否允许取消：</td>
										<td width="300px">
											<label class="radio-inline"> 
												<input type="radio" name="allowCancel_${status.index}" value="y"
													<c:if test="${item.allowCancel== 'y'}">checked="checked"</c:if> /> 
													允许
											</label> 
											<label class="radio-inline"> 
												<input type="radio" name="allowCancel_${status.index}" value="n"
													<c:if test="${item.allowCancel=='n'}">checked="checked"</c:if> /> 
													 不允许
											</label> 
										</td>
									</tr>
									<tr>
										<td width="170px" align="right">允许退回环节：</td>
										<td colspan="2">
										<input type="text"
											name="nextactivitiesName${status.index}" readonly="readonly"
											style="width: 96%" class="form-control">
										<input 
											name="nextactivities${status.index}"  type="hidden" value="${item.nextactivities}"></td>
										<td><input type="button"
											style="width: 50%; height: 33px; margin-top: -4%;*margin-top: 0.4%"
											onclick="selectBackLink('${item.activityId}','metaList${status.index}');" value="选择环节"> <input
											type="button"
											style="width: 30%; height: 33px; margin-top: -4%;*margin-top: 0.4%;"
											onclick="clearNextactivities('${status.index}','metaList${status.index}')"  value="清空"></td>
									</tr>

									<tr>
										<td width="170px" align="right">表单页面路径：</td>
										<td width="300px"  colspan="3"><input type="text"
											name="formPath${status.index}" style="width: 90%" value="${item.formPath}"
											class="form-control"></td>
										
									</tr>
									<tr>
										<td width="170px" align="right">审批意见类型：</td>
										<td width="300px"><input type="text"
											name="noteType${status.index}" class="form-control"
											value="${item.noteType}"></td>
										<td width="170px" align="right">办理人数上限：</td>
										<td width="300px"><input type="text"
											name="submitManCount${status.index}"
											value="${item.submitManCount}" class="form-control" 
											onkeyup="this.value=this.value.replace(/\D/g,'')"
											 onafterpaste="this.value=this.value.replace(/\D/g,'')">
										</td>
									</tr>
									<tr>
										<td width="170px" align="right">是否允许取回：</td>
										<td width="300px"><label class="radio-inline"> <c:choose>
													<c:when test="${item.allowRollback== 'y'}">
														<input type="radio" checked
															name="allowRollback${status.index}" value="y">允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowRollback${status.index}"
															value="y">允许
												</c:otherwise>
												</c:choose>

										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${item.allowRollback== 'n'}">
														<input type="radio" name="allowRollback${status.index}"
															value="n" checked> 不允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowRollback${status.index}"
															value="n"> 不允许
												</c:otherwise>
												</c:choose>
										</label></td>
										<td width="170px" align="right">是否允许转签：</td>
										<td width="300px"><label class="radio-inline"> <c:choose>
													<c:when test="${item.allowTransfer== 'y'}">
														<input type="radio" checked
															name="allowTransfer${status.index}" value="y">允许
												</c:when>
													<c:otherwise>
														<input type="radio" name="allowTransfer${status.index}"
															value="y">
												允许
												</c:otherwise>
												</c:choose>

										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${item.allowTransfer== 'n'}">
														<input type="radio" checked
															name="allowTransfer${status.index}" value="n">不允许
												</c:when>
													<c:otherwise>
														<input type="radio" name="allowTransfer${status.index}"
															value="n">不允许
												</c:otherwise>
												</c:choose>


										</label></td>
									</tr>

									<tr>
										<td width="170px" align="right">是否允许加签：</td>
										<td width="300px"><label class="radio-inline"> <c:choose>
													<c:when test="${item.allowOversign== 'y'}">
														<input type="radio" checked
															name="allowOversign${status.index}" value="y"> 允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowOversign${status.index}"
															value="y"> 允许
													</c:otherwise>
												</c:choose>
										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${item.allowOversign== 'n'}">
														<input type="radio" name="allowOversign${status.index}"
															checked value="n">不允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowOversign${status.index}"
															value="n">不允许
													</c:otherwise>
												</c:choose>

										</label></td>
										<td width="170px" align="right">是否允许传阅：</td>
										<td width="300px"><label class="radio-inline"> <c:choose>
													<c:when test="${item.allowPassby== 'y'}">
														<input type="radio" checked
															name="allowPassby${status.index}" value="y">允许
												</c:when>
													<c:otherwise>
														<input type="radio" name="allowPassby${status.index}"
															value="y">允许
												</c:otherwise>
												</c:choose>

										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${item.allowPassby== 'n'}">
														<input type="radio" checked
															name="allowPassby${status.index}" value="n">不允许
												</c:when>
													<c:otherwise>
														<input type="radio" name="allowPassby${status.index}"
															value="n">不允许
												</c:otherwise>
												</c:choose>
										</label></td>
									</tr>

									<tr>
										<td width="170px" align="right">允许删除附件：</td>
										<td width="300px"><label class="radio-inline"> <c:choose>
													<c:when test="${item.allowDelfile== 'y'}">
														<input type="radio" checked
															name="allowDelfile${status.index}" value="y">允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowDelfile${status.index}"
															value="y">允许
													</c:otherwise>
												</c:choose>
										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${item.allowDelfile== 'n'}">
														<input type="radio" name="allowDelfile${status.index}"
															checked value="n"> 不允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowDelfile${status.index}"
															value="n"> 不允许
													</c:otherwise>
												</c:choose>

										</label></td>
										<td width="170px" align="right">允许上传附件：</td>
										<td width="300px"><label class="radio-inline"> <c:choose>
													<c:when test="${item.allowUpload== 'y'}">
														<input type="radio" checked
															name="allowUpload${status.index}" value="y">允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowUpload${status.index}"
															value="y">允许
													</c:otherwise>
												</c:choose>
										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${item.allowUpload== 'n'}">
														<input type="radio" name="allowUpload${status.index}"
															value="n" checked> 不允许
													</c:when>
													<c:otherwise>
														<input type="radio" name="allowUpload${status.index}"
															value="n"> 不允许
													</c:otherwise>
												</c:choose>

										</label></td>
									</tr>

	<tr>
										<td align="right">流程环节序号： </td>
										<td >
										<input type="text" id="owners${status.index}_sortNum"  name="owners${status.index}_sortNum"  value="${item.sortNum}" style="width: 175px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
										</td>
										<td align="right">环节自定义ID：</td>
										<td >
										<input type="text" id="owners${status.index}_stepId"  name="owners${status.index}_stepId"  value="${item.stepId}" style="width: 175px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
										</td>
									</tr>

									<tr>
										<td width="170px" align="right">上传控件栏标签：</td>
										<td><input type="text"
											name="uploadFileLabel${status.index}" class="form-control"
											value="${item.uploadFileLabel}"></td>
										<td width="170px" align="right">下载控件栏标签：</td>
										<td width="300px"><input type="text"
											name="downloadFileLabel${status.index}"
											value="${item.downloadFileLabel}" class="form-control">
										</td>
									</tr>

									<tr>
	                                   	<td width="170px" align="right">分配变量名称：</td>
	                                   	<td>
	                                   		<select class="form-control" name="assignVarName_${status.index}">
	                                   			<c:forEach var="sno" begin="0" end="20">
	                                   				<c:set var="optValue" value="nextOwners_${sno}"></c:set>
													<option value="${optValue }" 
		                                   				<c:if test='${item.assignVarName==optValue}'>
		                                   					selected="selected"</c:if>>${optValue }</option>
												</c:forEach>
												<option value="creatorId" 
													<c:if test='${item.assignVarName=="creatorId"}'>
		                                   					selected="selected"</c:if>>creatorId</option>
	                                   		</select>
	                                   	</td>
	                                   	<td width="170px" align="right">办理类型：</td>
	                                   	<td>
	                                   		<label><input type="radio" name="handleSignType_${status.index}"  disabled="disabled" 
	                                   			value="<%=BpmActivityType.ALONE_SIGN %>" <c:if test='${item.handleSignType=="alone"}'>checked="checked"</c:if> /> 独签</label>
	                                   		&nbsp;&nbsp;&nbsp;&nbsp;
	                                   		<label><input type="radio" name="handleSignType_${status.index}"  disabled="disabled"
	                                   			value="<%=BpmActivityType.COUNTER_SIGN %>" <c:if test='${item.handleSignType=="count"}'>checked="checked"</c:if> /> 会签</label>
	                                   	</td>
                                   	</tr> 
                                   	<tr>
                                   		<td width="170px" align="right">会签变量名称：</td>
                                   		<td>
                                   			<select class="form-control" name="signCountVarName_${status.index}">
	                                   			<c:forEach var="sno" begin="0" end="20">
	                                   				<c:set var="optValue" value="signCount_${sno}"></c:set>
													<option value="${optValue }" 
		                                   				<c:if test='${item.signCountVarName==optValue}'>
		                                   					selected="selected"</c:if>>${optValue }</option>
												</c:forEach>
	                                   		</select>
                                   		</td>
                                   		<td width="170px" align="right">会签完成比率：</td>
                                   		<td><input type="text"
											name="completeRate${status.index}" class="form-control"
											value="${item.completeRate}"></td>
                                   	</tr>
									<tr>
	                                   	<td width="170px" align="right">邮件通知：</td>
	                                   	<td >
	                                   		<select class="form-control" name="emailNotification_${status.index}" style="width:115px">
													<option value="disable" 
		                                   				<c:if test="${item.emailNotification=='disable'}">
		                                   					selected="selected"</c:if>>禁用</option>
		                                   			<option value="enabled" 
		                                   				<c:if test="${item.emailNotification=='enabled'}">
		                                   					selected="selected"</c:if>>启用</option>
	                                   		</select>
	                                   		<input type="button"
											style="width: 100px; height: 27px; margin-top: -2%;"
											onclick="emailNotification('${item.activityId}');" value="设置">
	                                   	</td>
	                          	<td width="170px" align="right">
	                                   	限制选人范围：
	                                   	</td>
	                                   	<td>
	                                   	<select class="form-control" name="limitCandidate_${status.index}" >
													<option value="disable" 
		                                   				<c:if test="${item.limitCandidate=='disable'}">
		                                   					selected="selected"</c:if>>禁用</option>
		                                   			<option value="enabled" 
		                                   				<c:if test="${item.limitCandidate=='enabled'}">
		                                   					selected="selected"</c:if>>启用</option>
	                                   		</select>
	                                   	</td>
                                   	</tr> 
                                   		<tr>
	                                   	<td width="170px" align="right">知会：</td>
	                                   	<td>
	                                   	<select class="form-control" name="defaultPassBy_${status.index}" style="width:115px">
													<option value="disable" 
		                                   				<c:if test="${item.defaultPassBy=='disable'}">
		                                   					selected="selected"</c:if>>禁用</option>
		                                   			<option value="enabled" 
		                                   				<c:if test="${item.defaultPassBy=='enabled'}">
		                                   					selected="selected"</c:if>>启用</option>
	                                   		</select>
	                                   		<input type="button"
											style="width: 100px; height: 27px; margin-top: -2%;"
											onclick="notifyDlg('${item.activityId}');" value="设置">
	                                   	</td>
	                          			<td width="170px" align="right">环节分组名称：</td>
	                                   	<td>
	                                   		<input type="text" class="form-control" name="activityGroupName_${status.index}"  
												value="${item.activityGroupName}" />
	                                   	</td>
                                   	</tr> 
									<tr>
										<td width="170px" align="right">办理人范围类型：</td>
										<td ><select class="form-control"
											name="defaultOwnerType${status.index}" onchange="defaultOwners('metaList${status.index}','${status.index}')">
												<option value=""></option>

												<c:choose>
													<c:when test="${item.defaultOwnerType== 'A'}">
														<option value="A" selected="selected">固定人员名称</option>
													</c:when>
													<c:otherwise>
														<option value="A">固定人员名称</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${item.defaultOwnerType== 'B'}">
														<option value="B" selected="selected">按部门计算角色</option>
													</c:when>
													<c:otherwise>
														<option value="B">按部门计算角色</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${item.defaultOwnerType== 'C'}">
														<option value="C" selected="selected">按人员查找层级批链</option>
													</c:when>
													<c:otherwise>
														<option value="C">按人员查找层级批链</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${item.defaultOwnerType== 'D'}">
														<option value="D" selected="selected">角色</option>
													</c:when>
													<c:otherwise>
														<option value="D">角色</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${item.defaultOwnerType== 'E'}">
														<option value="E" selected="selected">全部</option>
													</c:when>
													<c:otherwise>
														<option value="E">全部</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${item.defaultOwnerType== 'F'}">
														<option value="F" selected="selected">启动者</option>
													</c:when>
													<c:otherwise>
														<option value="F">启动者</option>
													</c:otherwise>
												</c:choose>
	                                           <c:choose>
													<c:when test="${item.defaultOwnerType== 'G'}">
														<option value="G" selected="selected">自定义选择</option>
													</c:when>
													<c:otherwise>
														<option value="G">自定义选择</option>
													</c:otherwise>
												</c:choose>
										</select></td>
										<td width="170px" align="right">
								          <span id="owners${status.index}_people_lable" style="display:none">人员：</span>
								          <span id="owners${status.index}_deptId_lable" style="display:none">部门ID：</span>
								          <span id="owners${status.index}_peopleId_lable" style="display:none">用户ID：</span>
								           <span id="owners${status.index}_roleName_lable" style="display:none">角色名称：</span>
									      <span id="user_define${status.index}_lable" style="display:none">反射类：</span>
									</td>
										<td width="300px">
										    <span id="owners${status.index}_people_id" style="display:none">
										    <input type="text" name="owners${status.index}_people_value"  id="owners${status.index}_people_value"style="width: 175px;"/>
										     <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="_openUserDlg('${status.index}');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" name="owners${status.index}_people_value_num" id="owners${status.index}_people_value_num"/>
	                                </span>	
										    </span>
								          <span id="owners${status.index}_deptId_id" style="display:none">
								           <input type="text" name="owners${status.index}_deptId_value"/>
								          </span>
								            <span id="user_define${status.index}" style="display:none">
								           <input type="text" name="user_define${status.index}_value"/>
								          </span>
								          <span id="owners${status.index}_peopleId_id" style="display:none">
								         <input type="text" name="owners${status.index}_peopleId_value"/>
								          </span>
								           <span id="owners${status.index}_roleName_id" style="display:none">
								              <input type="text" id="owners${status.index}_roleName_value"  name="owners${status.index}_roleName_value" style="width: 175px;"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneRoleDlg('${status.index}','owners${status.index}_roleName_value');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="owners${status.index}_roleName_value_num"  name="owners${status.index}_roleName_value_num" />
	                                </span>
								           </span>
									
										</td>
									</tr>
										<tr>
										<td width="170px" align="right">
										 <span id="owners${status.index}_deptIdRole_lable" style="display:none">角色名称：</span>
									      </td>
										<td>
										<span id="owners${status.index}_deptIdRole_id" style="display:none">
										  <input type="text" id="owners${status.index}_deptIdRole_value"  name="owners${status.index}_deptIdRole_value" style="width: 175px;"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneRoleDlg('${status.index}','owners${status.index}_deptIdRole_value');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="owners${status.index}_deptIdRole_value_num"  name="owners${status.index}_deptIdRole_value_num" />
	                                </span>
										</span>
										</td>
										<td width="170px" align="right"></td>
										<td width="300px">
									    </td>
									</tr>
								</tbody>
							</table>
							</c:forEach>
							</div>
							 <div title="环节SLA配置" style="width:100%;height:700px">
							       <jsp:include page="./metaSlaCfg.jsp"></jsp:include>
							</div> 
							<div title="业务配置" style="width:100%;height:700px">
							       <jsp:include page="./bizPanelTab.jsp"></jsp:include>
							</div> 
							</div>
							<!-- 环节tab结束 -->
							</div>
				
<div style="clear:both; line-height:0px !important; height:0px !important; font-size:0px !important;"></div>