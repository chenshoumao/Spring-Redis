<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/console/help/taglib.css" />
	<title>数据权限开发介绍</title>
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
<li class="active"><a href="#1F" >应用库权限配置</a></li>
<li class="active"><a href="#2F" >文档阅读权限</a></li>
<li class=""><a href="#3F">文档写入权限</a></li>
<li class=""><a href="#4F">高级授权</a></li>
<li class=""><a href="#5F">流程图编辑权限</a></li>
</ul>
</div>
<!-- </div>  -->
</div>
<div class="col-md-9" role="main">
<div class="panel docs-content">

<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">应用库权限配置<span class="anchor-target" id="getting-started"></span>
<a name="1F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
应用库权限配置界面:
<br>
<img style="width: 100%;height: 400px;"
src="${pageContext.request.contextPath }/images/help/dataPerssion/dappAcl.png" /><br/>
<br>
应用库的授权对象类型有4种分别是:员工、部门、角色、默认<br>
权限级别分别为:无访问权、读者、作者、编辑者、管理员<br>
创建应用会创建一个默认无权限的授权，创建者授权为系统管理员<br>
只有权限级别为管理员的才能打开表单设计界面<br>
</code></pre>
</div>

<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">文档阅读权限<span class="anchor-target" id="getting-started"></span>
<a name="2F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
双击创建的表单-->>进入表单编辑界面-->>选择权限预置<br>
默认情况下创建的文档所有人都可以访问，一旦配置了阅读权限<br>
只有配置的成员才有权限访问该文档。
接口调用：<br>
(1)获取所有的文档
    /**
	 * @Title: getAllDocumentByRight
	 * @Description: 按照权限获取所有的文档数据
	 * @param viewName 表单视图名称
	 * @param condition  查询条 
	 * @param employeeId  用户id
	 * @param deptId 用户所属部门id
	 * @return
	 * @return List&lt;Map&lt;String,Object>> 返回类型
	 * @throws
	 */
  List&lt;Mapoperate<String, Object>> com.gzsolartech.smartforms.service.DatDocumentService
   .getAllDocumentByRight(String viewName,
			List&lt;Map&lt;String, Object>> conditions, String orderBy,
			String employeeId, String deptId)<br> 
viewName: 表单视图<br> 
conditions: 查询条件, Map&lt;String, Object> 有三个值：<br> 
第一个值的key为：key   其值为表单视图的列名称<br> 
第二个值的key为：value   其值为 查询条件的值<br> 
第三个值的key为：operate   其值为 like(模糊查询)、>=(大于等于)、<=(小于等)、=(等于)<br> 

例如:获取测试人员表单的数据 其表单视图为:VIEW_poctest1_person<br> 
1、获取所有的数据:<br>
getAllDocumentByRight("VIEW_poctest1_person",null, null,null, null)<br>

2、获取所有的数据 按照时间排序<br>
getAllDocumentByRight("VIEW_poctest1_person",null, "create_time desc",null, null)<br>

3、按照查询条件获取数据 文档id为：123  文档标题包含:测试<br>
List&lt;Map<String,Object>> conditions=new ArrayList&lt;Map&lt;String,Object>>();
Map&lt;String,Object> tmp=new HashMap&lt;String,Object>();
tmp.put("key", "DOCUMENT_ID");
tmp.put("value", "123");
tmp.put("operate", "=");
conditions.add(tmp);

Map&lt;String,Object> tmp=new HashMap&lt;String,Object>();
tmp.put("key", "title");
tmp.put("value", "测试");
tmp.put("operate", "like");
conditions.add(tmp);
getAllDocumentByRight("VIEW_poctest1_person",conditions, "create_time desc",null, null)<br>

4、按照权限获取所有的数据  例如:admin用户的id为：123  所属部门的id为：456<br>
getAllDocumentByRight("VIEW_poctest1_person",null, null,"123", "456")<br>
<br><br>
(2)分页获取文档数据的文档
/** 
	* @Title: getAllDocumentByRight 
	* @Description: 按照权限分页获取所有的文档数据
	*@param viewName 表单视图名称
	*@param page 当前页数
	*@param pageSize 每页大小
	*@param conditions 查询条件
	*@param orderBy 排序
	*@param employeeId 用户id
	*@param deptId 用户所属部门id
	*@return
	@return List&lt;Map<String,Object>>    返回类型 
	* @throws 
	*/
	public List&lt;Map<String, Object>> com.gzsolartech.smartforms.service.DatDocumentService.
	getAllDocumentByRight(String viewName,
			int page, int pageSize, List&lt;Map&lt;String, Object>> conditions,
			String orderBy, String employeeId, String deptId) 
			用法同上
			
(3)获取单条文档数据
/** 
* @Title: getAllDocumentByRight 
* @Description: 获取单条的文档数据
*@param viewName 表单视图名称
*@param documentId  文档id
*@param employeeId 用户id
*@param deptId 用户所属部门id
*@return
@return Map<String,Object>    返回类型 
* @throws 
*/
Map&lt;String, Object>  com.gzsolartech.smartforms.service.DatDocumentService.
getAllDocumentByRight(String viewName,String documentId, String employeeId, String deptId)
<br/>
(4) 通过sql 来读取数据的权限
按照权限获取所有的数据  例如:admin用户的id为：123  所属部门的id为：456<br>
String sql="select * from viewName where  document_id in (select * from table(get_document_right('123','456'))) ";
List&lt;Map&lt;String,Object>> data =gdao.executeJDBCSqlQuery(sql);
数据权限的读取是通过一个存储函数实现的：get_document_right(employeeId,deptId)
</code></pre>
</div>



<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">文档写入权限<span class="anchor-target" id="getting-started"></span>
<a name="3F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
双击创建的表单-->>进入表单编辑界面-->>选择权限预置-->>写入权限
在这里配置文档的写入权限
如果用户在应用库的权限为编辑者或管理员 直接具有文档写入的权限
不受此写入权限配置的影响
</code></pre>
</div>

<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">高级授权<span class="anchor-target" id="getting-started"></span>
<a name="4F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
1、	先配置 流程与表单的映射关系
流程编码指需要绑定到表单上的流程编码、选择应用库对应的表单，注意表单中流程控件所填的流程编码需这里绑定的流程编码一致。
     <img src="${pageContext.request.contextPath }/images/help/wflctr/formWorkflow.png"  style="width: 550px;"/><br/>
    
绑定表单的流程控件所使用编码
  <img src="${pageContext.request.contextPath }/images/help/wflctr/form.png"  style="width: 550px;"/><br/>
 
配置表单字段
   <img src="${pageContext.request.contextPath }/images/help/wflctr/field.png"  style="width: 550px;"/><br/>
 
2、	创建代理授权规则
 
<img src="${pageContext.request.contextPath }/images/help/wflctr/rule.png"  style="width: 550px;"/><br/>
 
 授权模式：选择高级模式
 规则名称: 添写一个规则名
 授权给: 指流程待办授权给谁审批 
 选择授权流程: 添加一个需要授权的流程

选择高级授权的条件：要先选择需要授权的流程，所选流程需提前配置好流程与表单的映射关系 才能添加表单中的字段
 <img src="${pageContext.request.contextPath }/images/help/wflctr/ruleCfg.png"  style="width: 550px;"/><br/>
 


3、添加完授权规则 测试相应的流程 代理授权是生效。

</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">流程图编辑权限<span class="anchor-target" id="getting-started"></span>
<a name="5F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
1、	首先进入相应的页面选择对应的流程，同步快照流程图
<img src="${pageContext.request.contextPath }/images/help/dataPerssion/synchronousDiagram.png"  style="width: 550px;"/><br/>
    
2、   选择相应的流程图进行编辑
<img src="${pageContext.request.contextPath }/images/help/dataPerssion/configDiagramManager.png"  style="width: 550px;"/><br/>
 

</code></pre>
</div>

</div>	
</body>
</html>