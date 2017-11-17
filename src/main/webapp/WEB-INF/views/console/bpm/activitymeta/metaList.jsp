<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="desktopInfoDiv"
					style="margin-top: 35px; width: 25%; float: left;">
					<p id="listinout" style="cursor: pointer;">
						<span>人工环节列表</span>
						<c:if test="${gatewayActyCount>0 }">
						<a id="gatewayLink" target="_blank" 
							href="${pageContext.request.contextPath}/console/bpm/activitymeta/gatewayCfg/
									${snapshotUid}.xsp?bpdId=${bpmProcessSnapshot.bpdId}
									&procAppId=${bpmProcessSnapshot.processAppId}">
								网关环节列表</a>
						</c:if>
					</p>
					<div id="tablelist" style="overflow: auto; height: 707px;">
						<br /> <br />
						<table class="group">
							<thead>
							</thead>
							<tbody id="taskInfo">
								<c:forEach var="item" items="${bpmActivityMetas}"
									varStatus="status">
									<c:choose>
						                  <c:when  test="${status.index==0}">
									<tr align="center" onclick="selectedNode(this,datas);" class="select1">
										<td><b>${item.activityName}</b></td>
										<td style="display: none">metaList${status.index}</td>
									</tr>
									</c:when>
									<c:otherwise>
									<tr align="center" onclick="selectedNode(this,datas);">
										<td><b>${item.activityName}</b></td>
										<td style="display: none">metaList${status.index}</td>
									</tr>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>