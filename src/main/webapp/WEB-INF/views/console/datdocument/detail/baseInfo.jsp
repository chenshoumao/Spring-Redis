<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
   <div style="clear:both"></div>
    <div class="desktopInfoDiv"
	style="width:100%; float: right; ">
	<p id="" style="">基本信息</p>
	<div class="desktopListTabDiv">
	<div class="desktopListTabDiv">
	
		<div style="float:left;width:50%;height:50px">
		<table border="0px">
							<tbody>
								<tr>
									<td width="120px" align="right">创建者：</td>
									<td width="350px">
									<input type="text" id="snapshotName" style="width: 320px;" name="snapshotName" 
									readonly="readonly" class="form-control" value="${base.creator}">
									</td>
								</tr>					
							</tbody>
						</table>
				</div>
		
		<div style="float:left;width:50%;height:50px">
		     <table border="0px">
					<tbody>
						<tr>
							 <td width="120px" align="right">创建时间：</td>
							  <td width="350px">
							 <input type="text" id="snapshotName" 
									style="width: 320px;" name="snapshotName" 
									readonly="readonly" class="form-control" 
									value="${base.createTime}"></td>
								</tr>
							</tbody>
						</table>
				</div>
		
		<div style="float:left;width:50%;height:50px">
		<table border="0px">
				<tbody>
					<tr>
					   <td width="120px" align="right">更新者：</td>
							<td width="350px">
							<input type="text" id="snapshotName" 
							style="width: 320px;" name="snapshotName" 
							readonly="readonly" class="form-control" 
							value="${base.updateBy}"></td>	
							</tr>
				    </tbody>
			</table>
        </div>
		
		<div style="float:left;width:50%;height:50px">
		<table border="0px">
			<tbody>
				<tr>
					<td width="120px" align="right">更新时间：</td>
					<td width="350px">
					<input type="text" id="snapshotName" 
					style="width: 320px;" name="snapshotName" 
					readonly="readonly" class="form-control" 
					value="${base.updateTime}"></td>
                 </tr>
      	</tbody>
		</table>
	</div>
		
		<div style="float:left;width:50%;height:50px">
		<table border="0px">
			<tbody>
				<tr>
					<td width="120px" align="right">所属应用库：</td>
					<td width="350px">
					<input type="text" id="snapshotName" 
					style="width: 320px;" 
					name="snapshotName" 
					readonly="readonly" 
					class="form-control" value="${base.AppTitle}">
					</td>
                 </tr>
	         </tbody>
			</table>
        </div>
		
		<div style="float:left;width:50%;height:50px">
		      <table border="0px">
					<tbody>
						<tr>
							 <td width="120px" align="right">文档id：</td>
							 <td width="350px">
							 <input type="text" id="snapshotName" 
							 style="width: 320px;" name="snapshotName" 
							 readonly="readonly" class="form-control" value="${base.documentId}">
							 </td>
								</tr>
							</tbody>
						</table>
				</div>
		
      <div style="clear:both"></div>
	</div>
      <div style="clear:both"></div>
      <br>
	</div>
	</div>