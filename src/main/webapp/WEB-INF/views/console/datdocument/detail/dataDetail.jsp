<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
  <script type="text/javascript">
function alertdatDocumentData(){
$("#dataDetail textarea").removeAttr("readOnly");
$('#saveDatDocumentData').removeAttr("disabled"); 
  $("#saveDatDocumentData").css("background-color","#DF5206");
}

function saveDatDocumentData(){
var loadTip = layer.open({
		type : 3
	});
var values = $("#baseInfoForm").serialize();
      $.ajax({
			url :  '${pageContext.request.contextPath }/console/datdoc/adminUpdateDocument.action',
			type : "post",
			data : values,
			dataType : "json",
			success : function(result) {
		    	layer.close(loadTip);
				if (result.state == false) {
							layer.alert("保存出错:" + result.msg, {
								closeBtn : 0,
								shift : 4
							// 动画类型
							});
						} else {
						$('#saveDatDocumentData').attr('disabled',"true");//添加disabled属性 
                            $("#saveDatDocumentData").css("background-color","#EEEEEE");
							layer.alert("保存成功", {
								closeBtn : 0,
								shift : 4
							// 动画类型
							});
							window.location.reload();
						}
			},
			error : function() {
			layer.close(loadTip);
	 	  }
		});
   $("#dataDetail textarea").attr("readOnly",true);
}

   function historyDlg() {
		var roleDlg = layer.open({
			title : '历史版本',
			type : 1,
			skin : 'layui-layer-rim', // 加上边框
			area : [ '500px', '600px' ], // 宽高
			content : $("#historyDlg"),
			btn : [  '关闭' ],
			btn1 : function(index, layero) {
			}
		});
	}
	
	function updateRecover(histId){
	var loadTip = layer.open({
		type : 3
	});
      $.ajax({
			url :  '${pageContext.request.contextPath }/console/datdoc/updateRecover.action',
			type : "post",
			data : {histId:histId},
			dataType : "json",
			success : function(result) {
		    	layer.close(loadTip);
				if (result.state == false) {
							layer.alert("版本恢复异常:" + result.msg, {
								closeBtn : 0,
								shift : 4
							// 动画类型
							});
						} else {
							window.location.reload();
						}
			},
			error : function() {
			layer.close(loadTip);
	 	  }
		});
	}
$(function(){
  $('#saveDatDocumentData').attr('disabled',"true");//添加disabled属性 
  $("#saveDatDocumentData").css("background-color","#EEEEEE");
});
</script>
<div class="desktopInfoDiv" style="margin-top: 35px; width: 100%">
	<p>基本字段值</p>
	<div class="desktopTabDiv" style="margin-top: 10px">
	   <form id="baseInfoForm">
		<c:forEach items="${data}" var="item">
		<div style="float:left;width:50%;height:80px">
		<table border="0px"  id="dataDetail" style="width:100%;height:100%">
							<tbody>
								<tr style="width:100%;height:100%">
									<td  style="width:40%;" align="right">${item.key}：</td>
									<td  style="width:60%;">
									<textarea 
									style="width: 320px;height:50px"  
									name="${item.key}" 
									readonly="readonly"
									>${item.value}</textarea>
									<%-- <input type="text" id="${item.key}"
										name="${item.key}" 
										class="form-control"
										value="${item.value}"> --%></td>
									
								</tr>
								

							</tbody>
						</table>
             
				</div>
		</c:forEach>
		</form>
			<div style="text-align: right;margin-right: 16%;clear: both;">
			<button  id="alertdatDocumentData" onclick="alertdatDocumentData();" style="width: 100px;margin-left: 10px;line-height: 36px;border: none;background-color: #DF5206;border-radius: 3px;color: #fff;">修改</button>
			<button  id="saveDatDocumentData" onclick="saveDatDocumentData();" style="width: 100px;margin-left: 10px;line-height: 36px;border: none;background-color: #DF5206;border-radius: 3px;color: #fff;">保存</button>
			<button  id="" onclick="historyDlg();" style="width: 100px;margin-left: 10px;line-height: 36px;border: none;background-color: #DF5206;border-radius: 3px;color: #fff;">历史版本</button>
				</div>
      <div style="clear:both"></div>
      
	</div>
</div>

	<div id="historyDlg" style="display: none">
		<div class="desktopListTabDiv" style="padding-left:2%">
		<table border="0px">
		<thead style="font-size:21px;"> 
            <tr style="height:50px"> 
                   <td style="width:150px">
                   更新时间
					</td>
					<td style="width:100px">
					更新者
					</td>
					<td style="width:100px">
					操作
					</td>
              </tr> 
          </thead> 
							<tbody>
								<c:forEach var="item" items="${history}" >
								  <tr>
									<td>
									${item.createTime}
									</td>
									
									<td >
									${item.creator}
									</td>
									<td>
									<button onclick="updateRecover('${item.histId}')">恢复到这个版本</button>
									</td>
									
								  </tr>
								</c:forEach>

							</tbody>
						</table>
      <div style="clear:both"></div>
      <br>
	</div>
	</div>