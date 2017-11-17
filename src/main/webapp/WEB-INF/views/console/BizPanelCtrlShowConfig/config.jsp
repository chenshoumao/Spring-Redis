<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<style>
.fitem {
	margin-bottom: 15px;
}

</style>
<script>
	//保存授权规则
	function saveRule() {
		//选中的条件个数
		var length = $("#conditionType [type=checkbox]:checked").length;
		var empNum = $("#agentEmployee_num").val();
		if ("" == empNum) {
			$.messager.show({
				title : '温馨提示',
				msg : '请选择被授权人'
			});
		} else if (length == 0) {
			$.messager.show({
				title : '温馨提示',
				msg : '请至少选中一个条件'
			});
		} else {
			var isNull = 0;
			$('input:checkbox[name=conditionType]:checked').each(function (i) {
				var conditionTyep = $(this).val();
				var rightValue = $("#" + conditionTyep + "Num").textbox('getValue');
				if ("" == rightValue) {
					isNull++;
				}
			})
			if (isNull != 0) {
				$.messager.show({
					title : '温馨提示',
					msg : '请选择相应的授权条件'
				});
			} else {
				//处理人的格式
				var empNum = $("#agentEmployee_num").val();
				var empArry = new Array();
				if (empNum.indexOf("(") > 0) {
					var empList = empNum.split(";");
					for (i in empList) {
						if ("" != empList[i]) {
							empArry.push(empList[i].substring(empList[i].indexOf("(") + 1, empList[i].indexOf(")")));
						}
					}
				}
	
				if (empArry.length != 0) {
					$("#empNum").textbox("setValue", empArry);
				} else {
					var empNums = $("#empNum").textbox("getValue");
					empArry = empNums.split(",");
				}
	
				//保存条件规则
				saveRuleCondition(empArry);
				//将选中的人添加进form
	
				$("#empName").textbox("setValue", $("#agentEmployee").val());
				$("#panelDescr").textbox({
					disabled : false
				});
				var values = $("#fm").serialize();
				if ($("#fm").form('validate')) {
					$("#dlg_btnsave").linkbutton("disable");
					$.ajax({
						url : "${pageContext.request.contextPath}/console/panelBizctrl/saveOrUpdate.action",
						type : "post",
						data : values,
						dataType : "json",
						async : false,
						success : function (result) {
							$("#dlg_btnsave").linkbutton("enable");
							if (result.state == false) {
								$.messager.show({
									title : '温馨提示',
									msg : result.msg
								});
							} else {
								$('#field_dlg').dialog('close'); // close the dialog
								$('#datagrid').datagrid('reload'); // reload the user data
							}
						}
					});
				}
			}
		}
	}
	
	$(function () {
	
		//监听复选框选中事件，将选中的内容带出
		$("#conditionType [type=checkbox]").change(function () {
			var i = 0;
			$("#conditionType [type=checkbox]").each(function () {
				if ($(this).is(':checked')) {
					var displayArea = $(this).val() + "Div";
					$("[id^='" + displayArea + "']").css("display", "");
					$("[id^='" + displayArea + "']").find("input").attr('disabled', false);
				} else {
					var displayArea = $(this).val() + "Div";
					$("[id^='" + displayArea + "']").css('display', 'none');
					$("[id^='" + displayArea + "']").find("input").attr('disabled', 'disabled');
					$("[id^='" + displayArea + "']").children().find("input").attr('disabled', 'disabled');
				}
			});
		});
	
	})
	//打开选人对话框
	function openEmployee() {
		var url = "${pageContext.request.contextPath}/console/tag/user/index.xsp?id=agentEmployee"
			 + "&documentId=&singleSelect=false&showcurrent=true";
		window.open(encodeURI(url));
	}
	
	//将选择的条件保存为规则
	function saveRuleCondition(empArry) {
		//获取所有的之前保存的RuleConditionId
		var conditionDisplay = $('#conditionDisplay').textbox('getValue');
		if ("" == conditionDisplay) {
			conditionDisplay = '[{}]';
		}
		var conditionsIds = JSON.parse(conditionDisplay);
	
		//设置规则失效日期为此后一年
		var endDate = new Date();
		endDate.setFullYear(endDate.getFullYear() + 1);
		//fromId授权字段匹配规则
		var arr = [];
	
		//将选中的人员存入成规则
		if (empArry.length != 0 && empArry[0].length != 0) {
	
			for (i in empArry) {
				var emp = {
					ruleId : $("#datRuleId").textbox('getValue'),
					conditionId : '',
					leftValue : "empNum",
					leftName : "代理人" + i + "Id",
					rightValue : empArry[i],
					valueOperator : "==",
					rightValueType : "String",
					//当有多个人时，则最后一个用“与”和公司，部门等条件组合
					conditionOperator : (i == empArry.length - 1) ? "&&" : "||",
					conditionOperatorName : (i == empArry.length - 1) ? "与" : "或",
					ruleStatus : "on",
					sortNum : arr.length + 1,
					endDate : endDate
				}
				arr.push(emp);
			}
		}
	
		//将选中的条件存入规则
		$('input:checkbox[name=conditionType]:checked').each(function (i) {
			var leftName = "";
			if ("company" == $(this).val()) {
				leftName = "公司编码";
			}
			if ("dept" == $(this).val()) {
				leftName = "部门编码";
			}
			//除选中的人之外的组成规则
			if ("emp" != $(this).val()) {
				//当前选中的数量
				var selected = $('input:checkbox[name=conditionType]:checked').length;
				var conditionTyep = $(this).val();
				var endDate = new Date();
				endDate.setFullYear(endDate.getFullYear() + 1);
				var condition = {
					ruleId : $("#datRuleId").textbox('getValue'),
					conditionId : conditionsIds[conditionTyep + "Num"],
					leftValue : conditionTyep + "Num",
					leftName : leftName,
					rightValue : $("#" + conditionTyep + "Num").textbox('getValue'),
					valueOperator : "==",
					rightValueType : "String",
					//与最后的区块Id拼接，用&&
					conditionOperator : "&&",
					conditionOperatorName : "与",
					ruleStatus : "on",
					sortNum : arr.length + 1,
					endDate : endDate
				}
				arr.push(condition);
			}
		});
	
		//添加panelId规则
		arr.push({
			ruleId : $("#datRuleId").textbox('getValue'),
			conditionId : conditionsIds.bizpanelId,
			leftValue : "bizpanelId",
			leftName : "业务区块Id",
			rightValue : $("#bizpanelId").textbox('getValue'),
			valueOperator : "==",
			rightValueType : "String",
			conditionOperator : "&&",
			conditionOperatorName : "与",
			ruleStatus : "on",
			sortNum : arr.length + 1,
			endDate : endDate
		});
	
		//将倒数第二个规则与最后一个规则的关系(业务区块ID)改为与
		arr[arr.length - 2].conditionOperator = "&&";
		arr[arr.length - 2].conditionOperatorName = "与";
	
		$.ajax({
			url : "${pageContext.request.contextPath}/console/panelBizctrl/saveRuleCondition.xsp",
			type : "post",
			contentType : 'application/json',
			data : JSON.stringify(arr),
			dataType : "json",
			async : false,
			success : function (result) {
				$("#dlg_btnsave").linkbutton("enable");
				if (result.state == false) {
					$.messager.show({
						title : '温馨提示',
						msg : result.msg
					});
				} else {
					return true;
				}
			}
		});
	}
	
</script>

<div id="field_dlg" class="easyui-dialog"
	style="width: 500px; height: 400px;" closed="true"
	buttons="#field_dlg_buttons" modal="true">

	<div id="tabs" class="easyui-tabs" fit="true" border="false">
		<div title="字段显示权限信息">
			<form id="fm" method="post">
				<br>
				<div class="fitem" style="display: none;">
					<!-- 字段授权ID -->
					<input class="easyui-textbox"
						style="width: 280px;" id="conditionId" name="conditionId"/>
					<label>字段ID</label> 
					<input class="easyui-textbox"
						style="width: 280px;" id="bizfldId" name="bizfldId"/>
					<!-- 业务区块ID  -->
					<input class="easyui-textbox"
						style="width: 280px;" id="bizpanelId" name="bizpanelId"/>
					<!-- 表单ID -->
					<input class="easyui-textbox"
						style="width: 280px;" id="formId" name="formId"/>
					<!-- 规则ID -->
					<input class="easyui-textbox"
						style="width: 280px;" id="datRuleId" name="datRuleId"/>
					<!-- 表单规则ID -->
					<input type="hidden" style="width: 280px;" id="formIdConditionId" name="formIdConditionId"/>
					<!-- 表单名 -->
					<input type="hidden" style="width: 280px;" id="formName" name="formName"/>
					<!-- 授权规则详细Id(RuleCondition)  -->
					<input class="easyui-textbox" style="width: 280px;" id="conditionDisplay" name="conditionDisplay"/>
					
					
				</div>
				
				<div class="fitem">
					<label>区块名称</label> 
					<input class="easyui-textbox"
						style="width: 280px;" disabled="disabled" id="panelName" name="panelName" />
				</div>
				
				<div class="fitem">
					<label>区块描述</label> 
					<input class="easyui-textbox" style="width: 280px;" id="panelDescr" name="panelDescr" disabled="disabled"/>
				</div>
				
				<div class="fitem" id="empDiv1" >
    				<label>被授权人：</label>
    				<input  class="textbox textbox-readonly"  id="agentEmployee"   name="agentEmployee"   type="text" style="margin-left: 0px; margin-right: 0px; padding-top: 3px; padding-bottom: 3px; width: 278px;" readonly>
    				<input  type="text" style="width:20px;height:20px" class="easyui-searchbox" searcher="openEmployee" />
					<input type="hidden" id="agentEmployee_num" name="agentEmployee_num" /> 
					<div style="display: none;">
					<!-- 用于回显 -->
						<input class="easyui-textbox"  style="width: 280px;"  id="empNum" name="empNum"/>
						<input class="easyui-textbox"  style="width: 280px;"  id="empName" name="empName"/>
					</div>
    			</div>
    			
    			<div class="fitem">
					<label>区块显示条件</label>
					<span id="conditionType">
						<input type="checkbox" name="conditionType"   id="conditionType" value="company">按公司 &nbsp;
						<input type="checkbox" name="conditionType"   id="conditionType" value="dept">按部门 &nbsp;
					</span> 
				</div>
				
				<div class="fitem" id="companyDiv1" style="display: none;">
    				<label>公司编码：</label>
    				<input class="easyui-textbox"  id="companyNum"   name="companyNum"size="45px"  type="text" style="width:280px" readonly>
    			    <input  type="text" style="width:20px;height:20px" class="easyui-searchbox" searcher="openCompany" />
    			</div>
    			<div class="fitem" id="companyDiv2" style="display: none;">
    				<label>公司名称：</label>
    			    <input class="easyui-textbox"  id="companyName"   name="companyName" size="45px"  type="text" style="width:280px" readonly>
				</div>
				
				<div class="fitem" id="deptDiv1" style="display: none;">
					<label>部门编码：</label>
					<input class="easyui-textbox"  id="deptNum"   name="deptNum"  type="text" style="width:280px" readonly>
    			    <input  type="text" style="width:20px;height:20px" class="easyui-searchbox" searcher="openDepartment" />
    			</div>
    			<div class="fitem" id="deptDiv2" style="display: none;">
    				<label>部门名称：</label>
    			    <input class="easyui-textbox"  id="deptName"   name="deptName" size="45px"  type="text" style="width:280px" readonly>
				</div>
				
				<div class="fitem" id="appName">
				</div>
			</form>
		</div>

	</div>
</div>
<div id="field_dlg_buttons">
	<a id="dlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveRule()" style="width: 90px">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#field_dlg').dialog('close')"
		style="width: 90px">取消</a>
</div>




