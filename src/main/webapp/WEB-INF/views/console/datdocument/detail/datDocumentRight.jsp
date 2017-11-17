<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<div style="clear:both"></div>
<div class="desktopInfoDiv"
	style="width:100%; float: right; height: 580px;">
	<p id="" style=""> 文档权限配置</p>
	<div class="desktopListTabDiv">
		<div style="height:260px;width:100%;">
				   <div style="margin-left: 4%;padding-top: 2%;font-size: 24px;">
                         读取权限
                         </div>
                         <hr style="width:90%;margin-left:3%">
				          <table border="0px" style="height: 155px;">
							<tbody>
								<tr>
									<td width="60px" align="right">人员：</td>
									<td width="300px">
									    <input type="text" name="peopleRead"  id="peopleRead"style="width: 800px;" value="${rights.empRead}"/>
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
									 <input type="text" id="deptRead"  name="deptRead" style="width: 800px;" value="${rights.deptRead}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneDeptDlg('deptRead');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="deptRead_num"  name="deptRead_num"  value="${rights.deptReadId}"/>
	                                </span>
									</td>
								</tr>
								<tr>
									<td width="60px" align="right">角色：</td>
									<td >
									 <input type="text" id="roleRead"  name="roleRead" style="width: 800px;"value="${rights.roleRead}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneRoleDlg('roleRead');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="roleRead_num"  name="roleRead_num" value="${rights.roleReadId}"/>
	                                </span>
									</td>
								</tr>
							</tbody>
						</table>
				<div>
				</div>
				</div>
				
				
				<div style="height:260px;width:100%;">
				   <div style="margin-left: 4%;padding-top: 2%;font-size: 24px;">
                         写入权限
                         </div>
                         <hr style="width:90%;margin-left:3%">
				          <table border="0px" style="height: 155px;">
							<tbody>
								<tr>
									<td width="60px" align="right">人员：</td>
									<td width="300px">
									    <input type="text" name="peopleWrite"  id="peopleWrite"style="width: 800px;" value="${rights.empWrite}"/>
										     <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="_openUserDlg('peopleWrite');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" name="peopleWrite_num" id="peopleWrite_num" value="${rights.empWriteId}"/>
	                                </span>	
									
									</td>
									
								</tr>
								<tr>
									<td width="60px" align="right">部门：</td>
									<td >
									 <input type="text" id="deptWrite"  name="deptWrite" style="width: 800px;" value="${rights.deptWrite}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneDeptDlg('deptWrite');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="deptWrite_num"  name="deptWrite_num"  value="${rights.deptWriteId}"/>
	                                </span>
									</td>
								</tr>
								<tr>
									<td width="60px" align="right">角色：</td>
									<td >
									 <input type="text" id="roleWrite"  name="roleWrite" style="width: 800px;"value="${rights.roleWrite}"/>
								               <span class="controls">
                                                <span class="input-prepend">
                                               <span class="add-on" onclick="opneRoleDlg('roleWrite');"><i class="icon-search"></i></span>
                                         </span>
	                                  <input type="hidden" id="roleWrite_num"  name="roleWrite_num" value="${rights.roleWriteId}"/>
	                                </span>
									</td>
								</tr>
							</tbody>
						</table>
				<div>
				</div>
				</div>
				
				<div style="text-align: right;margin-right: 16%;">
			<button id="saveProConfig" onclick="datDocumentRight();" style="width: 100px;margin-left: 10px;line-height: 36px;border: none;background-color: #DF5206;border-radius: 3px;color: #fff;">保存</button>
				</div>
	</div>
    </div>
    
    	<div id="deptDlg" style="display: none">
		<ul id="processCata" class="ztree"></ul>
	</div>
	
	
		<div id="roleDlg" style="display: none">
		<input type="hidden" id="roleCurrentLink">
		<div class="persoN">
			<div class="persoNLf">
				<select class="bgG"
					style="width: 300px; height: 450px; font-size: 15px;" multiple=""
					id="unSelectRole" size="8" ondblclick="getUnSelectRoleData();">
					${roles}
				</select>
			</div>
			<div class="persoNMd" style="padding-top: 186px; margin-left: 2%;">
				<button class="topR RT" onclick="getUnSelectRoleData();">&gt;</button>
				<button class="topR RT" onclick="delSelectRoleData();">&lt;</button>
			</div>
			<div class="persoNRg" style="width: 300px;">
				<div style="overflow: auto;">
					<select class="deptInfoDiv"
						style="float: right; height: 450px; width: 300px; font-size: 15px;"
						multiple="" id="alreadSelectRole" size="8"
						ondblclick="delSelectRoleData();">
					</select>
				</div>

			</div>
		</div>
	</div>