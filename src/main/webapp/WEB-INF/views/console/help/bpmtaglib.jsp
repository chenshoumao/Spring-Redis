<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/console/help/taglib.css" />
	<title>BPM自定义控件介绍</title>
</head>
<body class="index">
<a href="#gotop" target="_self" style="position: fixed;right: 15px;">返回顶部</a>
<div class="container docs-container">
<div class="row">
<div class="col-md-3">
<a name="gotop" href="#"></a>
<!-- <div class="sidebar hidden-print affix" role="complementary"> -->
<div id="navigation"> 
<ul class="nav sidenav" style="display:block;">
<li class="active"><a href="#1F" >BPM实例运行信息控件</a></li>
<li class=""><a href="#2F">BPM环节选择控件</a></li>
<li class=""><a href="#3F">BPM路由工具栏控件</a></li>
<li class=""><a href="#3AF">BPM路由工具栏自定义面板控件</a></li>
<li class=""><a href="#4F">BPM审批意见控件</a></li>
<li class=""><a href="#5F">BPM审批意见列表控件</a></li>
<li class=""><a href="#6F">业务控制块控件</a></li>
<li class=""><a href="#7F">业务区块显示权限配置</a></li>
</ul>
</div>
<!-- </div>  -->
</div>
<div class="col-md-9" role="main">
<div class="panel docs-content">
<div class="docs-section">
<div class="page-header">
<p style="color:red">
	注意：使用BPM控件之前，必须要引用BPM控件的样式文件。<br/>
	样式文件路径：\${pageContext.request.contextPath }/styles/bpmportal/bpmtaglib.css<br/>
	如果要修改样式，建议不要修改缺省样式文件，而是新建一个样式文件，样式名称保持一致即可。
</p>
<h1 class="docs-heading">BPM实例运行信息控件<span class="anchor-target" id="getting-started"></span>
<a name="1F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
标签名称: &lt;sot:bpmexecinfo /&gt; <br>
功能: 获取BPM中流程实例、任务、当前用户等多种运行时信息，若开发BPM流程表单，必须引入该控件。<br>
使用示例: &lt;sot:bpmexecinfo taskId="" workflowCode=&quot;&quot;  /&gt; <br>
属性说明：<br/>
taskId: 任务ID。<br/>
workflowCode: 流程编号，必需。<br/>
包含信息：	当前登录用户名称(_currUserNickName)、
		当前登录用户账号(_currUserName)、
		当前登录用户ID(_currUserNum)、
		当前用户部门ID(_currUserDeptNum)、
		当前用户部门名称(_currUserDeptName)、
		当前任务ID(__taskId)、
		当前任务名称(__taskName)、
		当前实例ID(__instanceId)、
		当前实例名称(__instanceName)、
		当前任务状态(__taskStatus)、
		当前实例状态(__instanceStatus)、
		流程分类名称(__wfcataName)、
		流程分类ID(__wfcataId)、
		环节自定义ID(__stepId)、
		流程图环节ID(__taskNodeId)、
		流程应用库ID(__procAppId)、
		流程图ID(__bpdId)、
		流程快照ID(__snapshotId)、
		流程自定义编号(__wfcode)、
		流程名称(__bpdName)、
		流程元数据ID(__workflowId)。
</code></pre>
</div>



<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">BPM环节选择控件<span class="anchor-target" id="getting-started"></span>
<a name="2F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
标签名称: &lt;sot:bpmrouting /&gt;<br>
功能: 让用户选择下一个环节和下一环节的处理人。<br>
使用示例: &lt;sot:bpmrouting taskId="" workflowCode=&quot;&quot; direction=&quot;&quot;   /&gt; <br>
属性说明：<br/>
taskId: 任务ID。<br/>
workflowCode: 流程编号，必需。<br/>
direction: 控件布局，vertical|vertical2|horizontal，默认horizontal。vertical是单列垂直，vertical2是双列垂直。<br/>
nextStepLabel: 下一步骤标签文本。<br/>
nextOwnerLabel: 下一处理人标签文本。<br/>
outerPanelStyle: 外部Panel CSS样式。<br/>
outerPanelClass: 外部Panel CSS类名，默认类名为"bpmToolPanel"。<br/>
innerPanelStyle: 内部Panel CSS样式。<br/>
innerPanelClass: 内部Panel CSS类名，默认类名为"bpmInfoPanel"。<br/>
infoTableStyle: 表格CSS样式。<br/>
infoTableClass: 表格CSS类名，默认类名为"bpmInfoTable"。<br/>
textboxStyle: 文本框样式。<br/>
textboxClass: 文本框类名，默认类名为"graybox"。 <br/>
expand:  专用网关 是否展开下拉   默认不展开(disabled)   disabled/enabled<br/>
userBtn:是否显示选人按钮   默认不显示(disabled)   disabled/enabled<br/>
expandOnchange:下拉展开事件onchange事件js函数  默认 expandOnchange="_expandChange()" <br/>
userBtnClick: 下一步骤选人点击事件 如何获取下标: userBtnClick="person(#index#)" 默认 userBtnClick="_selectPerson()" <br/>
注意: 如果下一环节是专用网关的话，默认值显示其中一个，
需要根据自己的实际业务选择要显示的下一个环节.
同时界面上会弹出一个对话框重写：_selectNextActivityTo()方法
出现专用网关，当前环节有多个流向可走，默认显示第一个流向，
请根据实际的业务选择合适的流向！
请重写：_selectNextActivityTo()方法
在下一个步骤的上面有一个js的数组放置着专用网关的所有环节信息(__nextNodeName_data_0)
按f2 可查看这个数组的信息
例如自定义显示下一步骤:
function _selectNextActivityTo(){
//下一步骤显示名称
$("#__nextNodeName_0").val(__nextNodeName_data_0[1].activityName);
//下一步骤隐藏域的id
$("#__nextNodeId_0").val(__nextNodeName_data_0[1].activityBpdId);
//下一个出来人 显示名称
$("#__nextOwner_0").val(__nextNodeName_data_0[1].nextNameField);
//下一处理人隐藏域用户id
$("#__nextOwner_0_num").val(__nextNodeName_data_0[1].nextIdField);
}

$(function(){
_selectNextActivityTo();

});

注意重写函数要放在表单体的最下面才能生效

如果后继节点既有专用网关和并行网关
会出现三个下一步骤 这时需要根据自己的实际业务逻辑来控制环节的显示
例如不显示出现的第一个步骤信息:
$(function(){
//不显示出现的第一个步骤信息
$("_bpmActivityMeta0").html("");
});
</code></pre>
</div>



<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">BPM路由工具栏控件<span class="anchor-target" id="getting-started"></span>
<a name="3F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
标签名称: &lt;sot:bpmtoolbar /&gt;<br>
功能: 提供提交、退回、转签、加签、传阅、取回、取消、流程状态等一系列的操作按钮，让用户对审批文档进行操作。<br>
使用示例: &lt;sot:bpmtoolbar taskId="" workflowCode=&quot;&quot; querySaveFn=&quot;&quot;   /&gt; <br>
属性说明：<br/>
taskId: 任务ID。<br/>
workflowCode: 流程编号，必需。<br/>
snapshotId: 流程快照ID，默认为空。<br/>
params: 提交参数，参数格式要求JSON数据格式。<br/>
querySaveFn: 保存按钮执行前JS函数名称，函数需要返回boolean类型。<br />
querySubmitFn: 提交按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryRollbackFn: 退回按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryRollbackWndFn: 打开退回对话框前JS函数名称，函数需要返回boolean类型。<br />
queryRetakeFn: 取回按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryRetakeWndFn: 打开取回对话框前JS函数名称，函数需要返回boolean类型。<br />
queryTransferFn: 转签执行前JS函数名称，函数需要返回boolean类型。<br />
queryTransferWndFn: 打开转签对话框前JS函数名称，函数需要返回boolean类型。<br />
queryOverSignFn: 加签按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryOverSignWndFn: 打开加签对话框前JS函数名称，函数需要返回boolean类型。<br />
queryPassbyFn: 传阅按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryPassbyWndFn: 打开传阅对话框前JS函数名称，函数需要返回boolean类型。<br />
queryWfStatusFn: 流程状态按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryCancelFn: 取消按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryCancelWndFn: 打开取消对话框前JS函数名称，函数需要返回boolean类型。<br />
queryUserRemindFn: 用户催办按钮执行前JS函数名称，函数需要返回boolean类型。<br />
queryUserRemindWndFn: 打开用户催办对话框前JS函数名称，函数需要返回boolean类型。<br />
outerPanelStyle: 外部面板样式。<br />
outerPanelClass: 外部面板CSS类名，默认为bpmToolPanel。<br />
innerPanelStyle: 捏不面板样式，默认为text-align:right。<br />
buttonClass: 按钮CSS类名，默认为bpmBlueBtn。<br />
btnSaveStyle: 保存按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_save.png)。<br />
btnSubmitStyle: 提交按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_submit.png)。<br />
btnRollbackStyle: 退回按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_rollback.png)。<br />
btnRetakeStyle: 取回按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_retake.png)。<br />
btnTransferStyle: 转签按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_transfer.png)。<br />
btnOverSignStyle: 加签按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_oversign.png)。<br />
btnPassbyStyle: 传阅按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_passby.png)。<br />
btnWfstatusStyle: 流程状态图按钮按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_inststatus.png)。<br />
btnCancelStyle: 取消按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_cancel.png)。<br />
btnUserRemindStyle: 用户催办按钮样式，默认为background-image:url(${contextPath }/images/bpm/btnico_user_remind.png)。<br />
btnSaveLabel: 保存按钮文本，默认为保存。<br />
btnSubmitLabel: 提交按钮文本，默认为提交。<br />
btnRollbackLabel: 退回按钮文本，默认为退回。<br />
btnRetakeLabel: 取回按钮文本，默认为取回。<br />
btnTransferLabel: 转签按钮文本，默认为转签。<br />
btnOverSignLabel: 加签按钮文本，默认为加签。<br />
btnPassbyLabel: 传阅按钮文本，默认为传阅。<br />
btnWfstatusLabel: 流程状态按钮文本，默认为流程状态。<br/>
btnCancelLabel: 取消按钮文本，默认为取消。<br/>
btnUserRemindLabel: 用户催办按钮文本，默认为催办。<br/>
btnSaveTitle: 保存提示文本。<br />
btnSubmitTitle: 提交提示文本。<br />
btnRollbackTitle: 退回提示文本。<br />
btnRetakeTitle: 取回提示文本。<br />
btnTransferTitle: 转签提示文本。<br />
btnOverSignTitle: 加签提示文本。<br />
btnPassbyTitle: 传阅提示文本。<br />
btnWfstatusTitle: 流程状态提示文本。<br/>
btnCancelTitle: 取消提示文本。<br/>
btnUserRemindTitle: 用户催办提示文本。<br/>
panelPlace: 工具栏自定义面板位置，位置值包括before和after，默认为after。<br/>
buttonSetDefStyle: 是否设置按钮默认样式（yes/no），默认为yes。<br/>
buttonSortList: 按钮排列顺序，默认顺序是“btnSave,btnSubmit,btnRollback,btnRetake,btnTransfer,btnOverSign,btnPassby,btnWfstatus,btnCancel,btnUserRemind”。
按钮名称：
    btnSave - 保存按钮；
    btnSubmit - 提交按钮；
    btnRollback - 退回按钮；
    btnRetake - 取回按钮；
    btnTransfer - 转签按钮；
    btnOverSign - 加签按钮；
    btnPassby - 传阅按钮；
    btnWfstatus - 流程状态按钮；
    btnCancel - 取消按钮；
    btnUserRemind - 用户催办按钮。<br/>

设置提交参数：
在执行BPM提交操作的时候，若需要添加参数数据到BO的params属性中，需要调用setBpmParams方法。一般做法是设置querySubmitFn函数，然后在函数中调用setBpmParams。<br/>
代码示例：
function testsubmit() {
    var msg="";
    var title=$("#docTitle").val();
    if ($.trim(title)=="") {
       msg+="请输入标题";
       $.messager.alert({title:"必填提示",msg:msg});
        return false;
    }
    var paramsObj={};
    paramsObj.seniorManager=$("#seniorManager").val();
    setBpmParams(paramsObj);
    return true;
}
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">BPM路由工具栏自定义面板控件<span class="anchor-target" id="getting-started"></span>
<a name="3AF">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
标签名称: &lt;sot:bpmtoolpanel /&gt;<br>
功能: 作为BPM流程工具栏控件的子控件使用，可以在面板中自定义HTML内容，例如添加打印按钮等。<br>
使用示例: 
&lt;sot:bpmtoolbar>
  &lt;sot:bpmtoolpanel&gt; 
    &lt;input type="button" id="btn1" value="打印" />
  &lt;/sot:bpmtoolpanel>
&lt;/sot:bpmtoolbar> <br>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">BPM审批意见控件<span class="anchor-target" id="getting-started"></span>
<a name="4F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
标签名称: &lt;sot:bpmnote /&gt;<br>
功能: 填写审批意见。<br>
使用示例: &lt;sot:bpmnote taskId="" workflowCode=&quot;&quot;  /&gt; <br>
属性说明：<br/>
taskId: 任务ID。<br/>
workflowCode: 流程编号，必需。<br/>
direction: 控件布局，vertical|horizontal，默认horizontal。<br/>
noteLabel: 意见文本框标签文本。<br/>
outerPanelStyle: 外部Panel CSS样式。<br/>
outerPanelClass: 外部Panel CSS类名，默认类名为"bpmToolPanel"。<br/>
innerPanelStyle: 内部Panel CSS样式。<br/>
innerPanelClass: 内部Panel CSS类名，默认类名为"bpmInfoPanel"。<br/>
infoTableStyle: 表格CSS样式。<br/>
infoTableClass: 表格CSS类名，默认类名为"bpmInfoTable"。<br/>
textareaStyle: 文本框样式，默认样式为"width:95%; height:5em"。<br/>
textareaClass: 文本框类名，默认类名为"graybox"。<br/>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">BPM审批意见列表控件<span class="anchor-target" id="getting-started"></span>
<a name="5F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
标签名称: &lt;sot:bpmauditlist /&gt;<br>
功能: 将这张流程文档中的审批意见已列表的形式展现出来。<br>
使用示例: &lt;sot:bpmauditlist documentId=&quot;&quot;  /&gt; <br>
属性说明：<br/>
documentId: 文档ID，必需。<br/>
tableStyle: 表格列表样式。<br/>
tableClass: 表格样式CSS类名，默认auditTable。<br/>
tableId: 表格ID。<br/>
templateCode: 内容模板编号，必须与auditDataSetClsName属性同时使用。<br/>
auditDataSetClsName: 审批意见数据集类名，必须与templateCode属性同时使用。<br/>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">业务控制块控件<span class="anchor-target" id="getting-started"></span>
<a name="6F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less">
1、先配置 流程与表单的映射关系
     流程编码指需要绑定到表单上的流程编码、选择应用库对应的表单，
     注意表单中流程控件所填的流程编码需这里绑定的流程编码一致。
 <img src="${pageContext.request.contextPath }/images/help/wflctr/formWorkflow.png"  style="width: 550px;"/><br/>

绑定表单的流程控件所使用编码
  <img src="${pageContext.request.contextPath }/images/help/wflctr/form.png"  style="width: 550px;"/><br/>
 


2、	业务区块使用,数据区块必需使用 &lt;sot:wfctrl>包括整块区域
 &lt;sot:wfctrl> 控件的name属性必填，name是数据区域的标志
 &lt;sot:wfctrl> 控件的desc属性，对数据区域进行描述，非必填
 &lt;sot:wfctrl>控件默认读取环节配置的数据区域状态进行控制，若环节配置无配置该信息则不进行任务控制照常显示区域数据
 &lt;sot:wfctrl> 控件的mode属性 mode 是数据区域状态（只读、编辑、隐藏），mode的控制优先级优先于大于环节配置控件，若mode的值不为空，以mode的状态控制为主，mode 支持el表单式赋值。
 &lt;sot:wfctrl> 控件的condition属性 反射类 通过反射类控制数据区域状态（只读（read）、编辑(edit)、隐藏(hidden)），condition控件优先级大于mode控制级别
Demo:
  <img src="${pageContext.request.contextPath }/images/help/wflctr/formDemo.png"  style="width: 550px;"/><br/>
 
在业务区块 注册表单中已经使用的字段控制块名称，字段管理者选择一个角色，这个角色下面的人员有权对这字段区块在已办中进行授权
  <img src="${pageContext.request.contextPath }/images/help/wflctr/wfctrl.png"  style="width: 550px;"/><br/>
 
在流程快照管理—》环节配置---》选中指定的环节—》配置字段控制块在指定的环节是否只读、隐藏、编辑
 <img src="${pageContext.request.contextPath }/images/help/wflctr/snapshot.png"  style="width: 550px;"/><br/>
双击行进行修改
  <img src="${pageContext.request.contextPath }/images/help/wflctr/wfctrlCfg.png"  style="width: 550px;"/><br/>
例如：起草流程所在的环节是员工个人，字段控制块会根据员工个人环节配置的控制块的状态 只读、隐藏、编辑 进行渲染表单
在待办中打开 根据待办所在的环节配置的控制块的状态 只读、隐藏、编辑 进行渲染表单
在已办中打开流程 字段控制块的状态是根据 业务区块权限配置进行渲染表单，
选择流程对应的表单进行配置
  <img src="${pageContext.request.contextPath }/images/help/wflctr/configure.png"  style="width: 550px;"/><br/>
 <img src="${pageContext.request.contextPath }/images/help/wflctr/configureItem.png"  style="width: 550px;"/><br/>
配置在已办中打开可见业务区块的人员




</code></pre>
</div>



<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">业务区块显示权限配置<span class="anchor-target" id="getting-started"></span>
<a name="7F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less">
1、  选择需要配置权限的应用库
 <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission1.png"  style="width: 550px;"/><br/>

2、	选择需要设置权限的表单
  <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission2.png"  style="width: 550px;"/><br/>
 
3、  双击选中的表单，选择业务区段，注册业务区块，并设置管理员
  <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission3.png"  style="width: 550px;"/><br/>
 
4、  在后台中选中业务区块显示权限配置项（/smartforms/console/index.action）
  <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission4.png"  style="width: 550px;"/><br/>
 
5、 选择相应的选项，带出其对应的目录下当前登录人有权限管理的表单
（/smartforms/console/panelBizctrl/index.xsp）
  <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission5.png"  style="width: 550px;"/><br/>

6、 双击所要授权控制显示的区块，配置权限信息（条件皆为与关系）
  <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission6.png"  style="width: 550px;"/><br/>

7、 选择对应的区块取消授权（无授权默认所有人可看）
  <img src="${pageContext.request.contextPath }/images/help/wflctr/displayPermission7.png"  style="width: 550px;"/><br/>


</code></pre>
</div>



</div>	
</body>
</html>