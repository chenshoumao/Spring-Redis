<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/console/help/taglib.css" />
	<title>BPM应用库开发介绍</title>
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
<li class="active"><a href="#1F" >BPM全局配置</a></li>
<li><a href="#2F" >创建流程图</a></li>
<li><a href="#3F">配置流程元数据</a></li>
<li><a href="#4F">流程表单隐含属性</a></li>
<li><a href="#5F">会签环节的开发</a></li>
<li><a href="#6F">配置路由条件</a></li>
<li><a href="#7F">技术限制</a></li>
</ul>
</div>
<!-- </div>  -->
</div>
<div class="col-md-9" role="main">
<div class="panel docs-content">

<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">BPM全局配置<span class="anchor-target" id="getting-started"></span>
<a name="1F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
在开发BPM流程应用之前，需要先配置BPM服务器地址，BPM管理员账号、密码等信息。<br>
位置: /smartforms/console/index.action<br>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_gcfg.png" /><br/>
</code></pre>
</div>

<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">创建流程图<span class="anchor-target" id="getting-started"></span>
<a name="2F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
开发步骤<br>
1、新建一个流程应用库。<br/>
2、在Toolkit库中引用“流程业务平台基础服务接口”Toolkit。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_toolkit.png" /><br/>
3、建立流程图，按照业务需求设计流程图，添加相应的环节、路由网关、路由路径等。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_bpd.png" /><br/>
4、为每个环节的环节名称添加自定义编号，使用方括号括起来，要求编号不重复，如“填写申请[01]”。<br/>
5、在流程图变量中添加名称为pubBo的输入/输出变量，类型为CommonBusObject。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_setservice.png" /><br/>
6、然后给每个环节分配处理人，在这里设置为用户列表，绑定BO变量tw.local.pubBo.nextOwners。
第一个环节是不需要设置分配的，除非要限制启动人员范围。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_setassign.png" /><br/>
7、给每个环节设置输入/输出映射，映射参数必须要有pubBo变量。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_setdatamap.png" /><br/>
8、在每个环节的前置参数中添加自定义编号，绑定BO变量tw.local.pubBo.stepId，编号和环节名称的自定义编号保持一致。
如：“填写申请[01]”，stepId="01"，编号不能有重复，结束节点stepId="-1"。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_setpredata.png" /><br/>
9、进入变量的设置面板，为pubBo变量中的每个成员变量设置Portal可视属性，这样能够保证在运行查询时可以输出。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_setvar.png" /><br/>
10、需要注意toolkit的升级更新，当“流程业务平台基础服务接口”Toolkit旁边出现黄色叹号三角形小图标的时候，需要及时升级依赖关系。<br/>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_toolkit_update.jpg" /><br/>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">配置流程元数据<span class="anchor-target" id="getting-started"></span>
<a name="3F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
流程元数据是在后台进行管理的，管理员需要打开流程元数据管理模块，添加一条元数据记录，输入流程应用ID，流程图ID。
另外，需要为每个流程定义一个唯一编号。<br>
位置: /smartforms/console/index.action<br>
<img src="${pageContext.request.contextPath }/images/help/bpm/bpmapp_procmeta.png" /><br/>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">流程表单隐含属性<span class="anchor-target" id="getting-started"></span>
<a name="4F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
在打开流程审批的时候，系统会自动加载流程实例运行时的信息到Request对象中，开发人员可以通过JSP代码获取Request对象中的属性。
要获取隐含属性，需要引入BPM实例运行信息控件，而且控件要放在表单body页面的第一行中。<br/>
<p>获取属性值：&lt;%=request.getAttribute(TemplateFieldName.BPM_STEP_ID) %&gt;</p>
隐含属性的名称基本都使用常量命名，以下列出大部分常量名称和用途说明：<br/>
<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>常量名称</td>
    <td>用途</td>
  </tr>
  <tr>
    <td>HttpSessionKey.CURRENT_USER_NICKNAME</td>
    <td>当前登录用户中文名称。</td>
  </tr>
  <tr>
    <td>HttpSessionKey.CURRENT_USER_NAME</td>
    <td>当前登录用户登录名称。</td>
  </tr>
  <tr>
    <td>HttpSessionKey.CURRENT_USER_DEPT_NUM</td>
    <td>当前登录用户部门ID。</td>
  </tr>
  <tr>
    <td>HttpSessionKey.CURRENT_USER_DEPT_NAME</td>
    <td>当前登录用户部门名称。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_TASK_ID_FIELD</td>
    <td>任务ID。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_TASK_NAME_FIELD</td>
    <td>任务名称，若任务ID为空，则该值为空。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_TASK_STATUS_FIELD</td>
    <td>任务状态，若任务ID为空，则该值为空。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_INSTANCE_ID_FIELD</td>
    <td>实例ID，若任务ID为空，则该值为空。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_INSTANCE_NAME_FIELD</td>
    <td>实例名称，若任务ID为空，则该值为空。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_INSTANCE_STATUS_FIELD</td>
    <td>实例状态，若任务ID为空，则该值为空。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.WORKFLOW_CATA_NAME_FIELD</td>
    <td>流程分类名称。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.WORKFLOW_CATA_ID_FIELD</td>
    <td><p>流程分类ID。</p>
    </td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_STEP_ID</td>
    <td>流程环节自定义编号。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.CURRENT_TASK_NODE_FIELD</td>
    <td><p>流程环节ID。</p>
    </td>
  </tr>
  <tr>
    <td>TemplateFieldName.PROCESS_APP_ID_FIELD</td>
    <td>流程应用库ID。</td>
  </tr>
  <tr>
    <td height="14">TemplateFieldName.BPD_ID_FIELD</td>
    <td>流程图ID。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.SNAPSHOT_ID_FIELD</td>
    <td>快照ID。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.WORKFLOW_CODE_FIELD</td>
    <td>流程自定义编号。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.BPM_BPD_NAME_FIELD</td>
    <td>流程图名称。</td>
  </tr>
  <tr>
    <td>TemplateFieldName.ROLLBACK_STATUS_FIELD</td>
    <td>退回状态</td>
  </tr>
  <tr>
    <td>TemplateFieldName.TRANSFER_STATUS_FIELD</td>
    <td>转签状态</td>
  </tr>
  <tr>
    <td>TemplateFieldName.OVER_SIGN_STATUS_FIELD</td>
    <td>加签状态</td>
  </tr>
  <tr>
    <td>TemplateFieldName.RETAKE_STATUS_FIELD</td>
    <td>取回状态</td>
  </tr>
</table>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">会签环节的开发<span class="anchor-target" id="getting-started"></span>
<a name="5F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
若流程中有会签环节的话，对于会签环节的开发步骤会和普通环节有点差别。首先，会签环节分为顺序会签和并行会签。
顺序会签是按环节处理人的顺序逐个审批，审批完成后才路由到下一个环节；
并行会签是本环节的所有处理人一起参与审批，BPM会同时开启多个任务，所有任务都完成后才路由到下一个环节。

在了解顺序会签和并行会签的区别后，再来看一下两种类型的会签配置方式：
<b>顺序会签：</b>
在BPM Designer中选中顺序会签环节，在循环类型中选择“简单循环”，最大循环次数设置为会签次数，会签次数变量的序号和处理人变量的序号保持一致。
<div><img src="${pageContext.request.contextPath }/images/help/bpm/signCountWF_seq.jpg" width="90%" height="90%" /></div>
<b>并行会签：</b>
在BPM Designer中选中顺序会签环节，在循环类型中选择“多实例循环”，启动数量设置为会签次数，会签次数变量的序号和处理人变量的序号保持一致，顺序选择并行运行。
<div><img src="${pageContext.request.contextPath }/images/help/bpm/bpm_select_looptype.jpg" /></div>
<div><img src="${pageContext.request.contextPath }/images/help/bpm/signCountWF_pal.jpg" width="90%" height="90%" /></div>
在“分配”选项卡中，用户分发选择“循环法”。
<div><img src="${pageContext.request.contextPath }/images/help/bpm/bpm_user_distribute.jpg" width="90%" height="90%" /></div>
<b><font color="red">注意：</font></b>若连续两个环节都是会签环节，会签次数变量signCount要隔开，例如[审批1]环节是顺序会签，[审批2]环节是并行会签，那么[审批1]环节选择signCount_0作为会签次数变量，[审批2]环节选择signCount_1作为会签次数变量。

在流程图设计完成后，也要去环节配置中进行变量绑定。

<b>环节配置：</b>
在环节配置中，主要是设置处理人变量和会签次数变量，绑定的变量要和流程图保持一致。另外，要留意办理类型是“独签”还是“会签”。办理类型不能选择，是根据BPM流程图的设计进行自动选择。
<div><img src="${pageContext.request.contextPath }/images/help/bpm/bpm_activity_signcount_cfg.jpg" width="90%" height="90%" /></div>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">配置路由条件<span class="anchor-target" id="getting-started"></span>
<a name="6F">&nbsp;</a> 
</h1>
</div>
<p>
说明:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
现在流程图中流转路径的条件可以使用配置的方式进行开发，而不再需要将条件参数写入流程图中，使到业务控制更加方便。采用路由条件配置方式的需要遵循以下的开发步骤：
1、在流程图的变量中增加routeBo，变量类型为RouteConditionResult，如图：
<img src="${pageContext.request.contextPath }/images/help/bpm/gatewaycfg_routebo.jpg" />

2、路由流转条件必须配置在网关环节，而不能配置在两个人工环节中。路由条件设置为固定公式：
tw.local.routeBo.result0=="true"
以上公式，result0是routeBo对象的一个条件结果变量，可以在网关环节配置中定义多个条件结果变量，然后在流程图中进行路由条件设置。另外，公式的右边值固定为"true"，即条件计算成立。
<img src="${pageContext.request.contextPath }/images/help/bpm/gatewaycfg_setRouteCondition.jpg" width="90%" />

3、在表单定义页面设置表单字段，只有设置为表单字段才能使用这些字段进行路由条件配置，如图：
<img src="${pageContext.request.contextPath }/images/help/bpm/gatewaycfg_fieldcfg.jpg" />

4、打开环节配置页面，点击”网关环节列表“打开新窗口，进入网关环节配置页面。如图：
<img src="${pageContext.request.contextPath }/images/help/bpm/gatewaycfg_1.jpg" width="90%" />

5、在网关环节配置页面中，可以给每个网关设置若干个路由条件，如图：
<img src="${pageContext.request.contextPath }/images/help/bpm/gatewaycfg_2.jpg" width="90%" />
网关环节序号：网关环节的排序序号。
路由变量名称：这个网关可以使用的条件变量名称。
路由条件列表：路由条件的维护列表，每个网关都可以设置多个路由条件。

6、路由条件的参数含义：
<img src="${pageContext.request.contextPath }/images/help/bpm/gatewaycfg_3.jpg" />
路由变量：条件计算结果保存的变量，这个变量与流程图的routeBo的成员变量进行绑定。
字段名称：审批文档的字段名称，即条件的左边值。
值比较运算符：左边值和右边值之间的比较运算符。
字段值：审批文档的字段值，即条件的右边值。
字段值类型：字段值的类型。
条件组合运算符：多个条件之间的组合运算符。
优先级序号：条件优先级序号。
条件分组名称：对条件进行分组命名。
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">技术限制<span class="anchor-target" id="getting-started"></span>
<a name="7F">&nbsp;</a> 
</h1>
</div>
<p>
说明:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
智能表单平台的流程开发是基于IBM BPM产品构建的，平台的流程功能会受限于IBM BPM产品功能。目前已知的技术限制有：
1、链接流程内的环节无法退回到流程外部，流程外部也无法退回到链接流程内部，取回功能亦如是。这是由IBM BPM引起的，BPM不允许实例路由到流程图外的环节，但子流程并不受影响。
2、链接流程内部无法实现退回、取回、会签环节转签、会签环节加签等操作。这些操作都需要调用MoveToken API完成，但在使用过程中发现在链接流程中的环节调用MoveToken后并不会产生作用，问题也反馈到IBM总部，他们的答复是这个属于产品特征，不属于功能缺陷，所以引起了以上的功能限制。

</code></pre>
</div>


</div>	
</body>
</html>