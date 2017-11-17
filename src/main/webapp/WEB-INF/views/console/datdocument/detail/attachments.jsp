<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
   <div style="clear:both"></div>
    <div class="desktopInfoDiv"
	style="width:100%; float: right; ">
	<p id="" style="">附件信息</p>
	<div class="desktopListTabDiv" style="padding-left:2%">
		<table border="0px">
		<thead style="font-size:21px;"> 
            <tr style="height:50px"> 
                   <td style="width:300px">
                   文件名称
					</td>
					<td style="width:200px">
						创建时间			
					</td>
					<td style="width:200px">
						创建者		
					</td>
					 <td style="width:200px">
						更新时间			
					</td>
					<td style="width:200px">
						更新者		
					</td>
              </tr> 
          </thead> 
							<tbody>
								<c:forEach var="item" items="${attachments}" >
								  <tr>
									<td>
									${item.attachmentName}
									</td>
									
									<td >
									${item.createTime}
									</td>
									<td>
									${item.creator}
									</td>
									<td >
									${item.updateTime}
									</td>
									<td>
									${item.updateBy}
									</td>
								  </tr>
								</c:forEach>

							</tbody>
						</table>
      <div style="clear:both"></div>
      <br>
	</div>
	</div>