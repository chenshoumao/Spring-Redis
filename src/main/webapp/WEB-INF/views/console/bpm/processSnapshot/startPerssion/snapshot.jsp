<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="desktopInfoDiv" style="margin-top: 35px; width: 100%">
					<p>流程环节配置</p>
					<div class="desktopTabDiv" style="margin-top: 10px">
						<table border="0px">
							<tbody>
								<tr>
									<td width="120px" align="right">快照名称：</td>
									<td width="350px"><input type="text" id="snapshotName"
										style="width: 320px;" name="snapshotName" readonly="readonly"
										class="form-control"
										value="${bpmProcessSnapshot.snapshotName}"></td>
									<td width="120px" align="right">流程图名称：</td>
									<td width="350px" colspan="2"><input type="text"
										id="bpdName" name="bpdName" readonly="readonly"
										style="width: 320px;" class="form-control"
										value="${bpmProcessSnapshot.bpdName}"></td>
								</tr>
								<tr>
									<td width="120px" align="right">流程图ID：</td>
									<td width="350px"><input type="text" id="bpdId"
										name="bpdId" style="width: 320px;" readonly="readonly"
										class="form-control" value="${bpmProcessSnapshot.bpdId}">
									</td>
									<td width="120px" align="right">流程图快照ID：</td>
									<td width="350px"><input type="text" id="snapshotBpdId"
										style="width: 320px;" name="snapshotBpdId" readonly="readonly"
										class="form-control"
										value="${bpmProcessSnapshot.snapshotBpdId}"></td>
								</tr>
								<tr>
									<td width="120px" align="right">流程图应用库ID：</td>
									<td width="350px"><input type="text" id="processAppId"
										name="processAppId" readonly="readonly" class="form-control"
										style="width: 320px;"
										value="${bpmProcessSnapshot.processAppId}"></td>
									<td width="120px" align="right">表单页面路径：</td>
									<td width="350px" colspan="2"><input type="text"
										name="formPath" class="form-control" readonly="readonly"
										style="width: 320px;" value="${bpmProcessSnapshot.formPath}">
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>