<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<title>智能表单</title>
<script type="text/javascript">
	var _checkedCompanyDataId = [];
	/*  打开选择公司的对话框 */
	function openCompany() {
		$('#companyList')
				.tree(
						{
							//checkbox : false,
							url : '${pageContext.request.contextPath}/console/orgCompany/getCompanyTree.action',
							onLoadSuccess : function(node) {
								$(this).find('span.tree-checkbox').unbind().click(
										function() {
											$('#companyList').tree('select',$(this).parent());
											  return false;
										});
								/* for (var i = 0; i < _checkedCompanyDataId.length; i++) {
									var node = $('#companyList').tree('find',
											_checkedCompanyDataId[i]);
									if (node) {
										$('#companyList').tree('check',
												node.target);
									}
								} */// alert node text property when clicked
							},
							onSelect : function(node) {
								var cknodes = $('#companyList').tree("getChecked");
								for (var i = 0; i < cknodes.length; i++) {
									if (cknodes[i].id != node.id) {
										$('#companyList').tree("uncheck",cknodes[i].target);
									}
								}
								if (node.checked) {
									$('#companyList').tree('uncheck',node.target);
								} else {
									$('#companyList').tree('check', node.target);
								}
							},
							onDblClick : function(node) {
								_saveCheckedCompany();
							}
						});
		//保存选中用于回显
		var top = 50;
		var left = 100;
		$('#companyDlg').window('open');
		//.window('resize',{top: top,left:left});
	}

	/**
	保存选中的公司信息
	 */
	function _saveCheckedCompany() {
		var nodes = [];
		var names = '';
		var ids = '';
		var _checkedCompanyDataId = [];
		nodes = $('#companyList').tree('getChecked', 'checked');
		for (var i = 0; i < nodes.length; i++) {
			if (names != '') {
				names += ',';
				ids += ',';
			}
			_checkedCompanyDataId.push(nodes[i].id);
			names += nodes[i].text;
			ids += nodes[i].id;
		}
		iframe_config.window.$("#companyNum").textbox('setValue',
				_checkedCompanyDataId);
		iframe_config.window.$("#companyName").val(names);
		$('#companyDlg').dialog('close');
	}

	//关闭选择公司对话框
	function closedCompanyDlg() {
		$('#companyDlg').dialog('close');
	}
</script>

<div id="companyDlg" class="easyui-dialog" title="选择公司"
	style="width: 350px; height: 400px; padding: 0px 0px" closed="true"
	buttons="#companyButton">
	<ul id="companyList" class="easyui-tree"
		data-options="method:'get',animate:true,checkbox:true"></ul>
</div>
<div id="companyButton" style="display: none">
	<a id="dlg_companybtnsave" href="javascript:void(0)"
		class="easyui-linkbutton c6" iconCls="icon-ok"
		onclick="_saveCheckedCompany()" style="width: 90px">确定</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:closedCompanyDlg()"
		style="width: 90px">取消</a>
</div>
