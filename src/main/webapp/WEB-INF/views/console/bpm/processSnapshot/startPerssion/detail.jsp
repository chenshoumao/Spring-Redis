<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<div class="desktopInfoDiv"
	style="width:100%; float: right; height: 300px;">
	<p id="" style=""> 起草权限配置</p>
	<div class="desktopListTabDiv">
		<table border="0px">
							<tbody>
								<tr>
									<td width="100px" align="right">人员：</td>
									<td width="350px">
									
									    <input type="text" name="owners_people_value"  id="owners_people_value"style="width: 675px;" value="${datas.employeeName}"/>
										     <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="_openUserDlg();"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" name="owners_people_value_num" id="owners_people_value_num" value="${datas.employeeId}"/>
	                                </span>	
									
									</td>
									
								</tr>
								<tr>
									<td width="100px" align="right">部门：</td>
									<td width="350px">
									 <input type="text" id="owners_deptId_value"  name="owners_deptId_value" style="width: 675px;" value="${datas.deptName}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneDeptDlg();"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="owners_deptId_value_num"  name="owners_deptId_value_num"  value="${datas.deptId}"/>
	                                </span>
									</td>
								</tr>
								<tr>
									<td width="100px" align="right">角色：</td>
									<td width="350px">
									 <input type="text" id="owners_roleName_value"  name="owners_roleName_value" style="width: 675px;"value="${datas.roleName}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneRoleDlg();"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="owners_roleName_value_num"  name="owners_roleName_value_num" value="${datas.roleId}"/>
	                                </span>
									</td>
									
								</tr>

							</tbody>
						</table>
							</div>

							</div>