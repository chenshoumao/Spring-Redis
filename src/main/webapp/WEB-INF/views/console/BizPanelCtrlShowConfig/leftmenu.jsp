
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

function setField(type,parmas){
	if ($('#tabs').tabs('exists', 'Home')){
		$('#tabs').tabs('select', 'Home');//选中并刷新
		var currTab = $('#tabs').tabs('getSelected');
// 		var url = $(currTab.panel('options').content).attr('src');
		var url = "${pageContext.request.contextPath}/console/panelBizctrl/getFieldBy"+type+".action?"+parmas;
		if(url != undefined) {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:datagrid(url)
				}
			})
		}
	}
}
</script>
<div class="easyui-accordion" data-options="fit:true,border:false">
	<div id="leftmenuTree"></div>
			<script type="text/javascript">
		   $('#leftmenuTree').tree({   //${menu.menuId}
            url: '${pageContext.request.contextPath}/console/panelBizctrl/getMenuById.action?parentId=0',   //&menuId=${menu.menuId}
            onBeforeExpand:function(node,param){  //${menu.menuId}
            	var parentNode = $('#leftmenuTree').tree('getParent',node.target);
            	var isEndLeaf = $('#leftmenuTree').tree('getChildren', node.target);
                //如果是根节点就赋值查找根据fromId找区块
            	if(parentNode==null||(parentNode!=null&&isEndLeaf.length!=0)){
                	$('#leftmenuTree').tree('options').url = "${pageContext.request.contextPath}/console/panelBizctrl/getMenuById.action?parentId="
                		+ node.id;//+ "&menuId=${menu.menuId}"
                }else{
                	//非根节点则为表单节点，则赋值根据区块Id查找授权记录的URL
                	$('#leftmenuTree').tree('options').url = "${pageContext.request.contextPath}/console/panelBizctrl/getAuthRecordById.action?bizPanelId="
                		+ node.id;
                }
            	
			},
			onClick : function(node) {
				var id = node.id;
				var title = node.text
				var parentNode = $('#leftmenuTree').tree('getParent', node.target);  //${menu.menuId}
				var isEndLeaf = $('#leftmenuTree').tree('getChildren', node.target);
				//如果是选择区块则展示区块的授权列表，若非则显示对应的应用库或表单下的区块信息
				if(parentNode != null&&(isEndLeaf==null||isEndLeaf.length==0)){
					if ($('#tabs').tabs('exists', 'Home')){
						$('#tabs').tabs('select', 'Home');//选中并刷新
						var currTab = $('#tabs').tabs('getSelected');
						var url = "${pageContext.request.contextPath}/console/panelBizctrl/getAuthRecordById.action?bizPanelId="
	                		+ node.id;
						if(url != undefined) {
							$('#tabs').tabs('update',{
								tab:currTab,
								options:{
									content:panelDatagrid(url)
								}
							})
						}
					}
				} else if (parentNode == null) {
					setField("AppId","appId="+id);
				} else {
					setField("FormId","formId="+id);
				}
			}

		});
			</script>
</div>