<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/help/taglib.css" />
<title>表单属性</title>
</head>
<a href="#gotop" target="_self" style="position: fixed; right: 15px;">返回顶部</a>
<body class="index">
	<div class="container docs-container">
		<div class="row">
			<div class="col-md-3">
				<a name="gotop" href="#"></a>
				<!-- <div class="sidebar hidden-print affix" role="complementary"> -->
				<div id="navigation">
					<ul class="nav sidenav" style="display: block;">
						<li class="active"><a href="#1F">打开表单事件类</a></li>
						<li class=""><a href="#2F">保存前表单事件类</a></li>
						<li class=""><a href="#3F">表单保存前js事件</a></li>
						<li class=""><a href="#4F">保存后跳转到指定页面</a></li>
						<li class=""><a href="#5F">是否保存空字段的值</a></li>
						<li class=""><a href="#6F">保存后表单事件类</a></li>
						<li class=""><a href="#7F">表单隐藏属性</a></li>
					</ul>
				</div>
				<!-- </div>  -->
			</div>
			<div class="col-md-9" role="main">
				<div class="panel docs-content">
					<div class="docs-section">
						<div class="page-header">
							<h1 class="docs-heading">
								打开表单事件类<span class="anchor-target" id="getting-started"></span>
								<a name="1F">&nbsp;</a>
							</h1>
						</div>
						<p>介绍:</p>
						<pre>
<code class="lang-less">
								<span class="hljs-at_rule">
位置:新建和更新表单时-->属性选项卡下<br>
功能:打开表单前可自定执行的事件<br>
填写类的全路径:例如 com.gzsolartech.smartforms.extproperty.ContractOpenExtProperty<br>
实现过程:<br>
在com.gzsolartech.smartforms.extproperty包创建一个自己的类实现ISmartCtrlExtProperty<br>
demo:<br>
public class ContractOpenExtProperty implements ISmartCtrlExtProperty{
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request) {
	//wac 可以获取spring 定义的bean
	//documentId 文档的id
	//获取bean的用法如下
	OrgEmployeeService orgEmployeeService = (OrgEmployeeService) wac.getBean("orgEmployeeService", OrgEmployeeService.class);
		在这里实现自己的业务逻辑
		return true;
	}
}

							</code>
						</pre>
					</div>



					<div class="docs-section">
						<div class="page-header">
							<h1 class="docs-heading">
								表单保存后事件类<span class="anchor-target" id="getting-started"></span>
								<a name="2F">&nbsp;</a>
							</h1>
						</div>
						<p>介绍:</p>
						<pre>
<code class="lang-less">
								<span class="hljs-at_rule">
位置:新建和更新表单时-->属性选项卡下<br>
功能:表单保存后可自定执行的事件<br>
填写类的全路径:例如 com.gzsolartech.smartforms.extproperty.ContractOpenExtProperty<br>
实现过程:<br>
在com.gzsolartech.smartforms.extproperty包创建一个自己的类实现ISmartCtrlExtProperty<br>
demo:<br>
public class ContractOpenExtProperty implements ISmartCtrlExtProperty{
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request) {
	//wac 可以获取spring 定义的bean
	//documentId 文档的id
	//获取bean的用法如下
	OrgEmployeeService orgEmployeeService = (OrgEmployeeService) wac.getBean("orgEmployeeService", OrgEmployeeService.class);
		在这里实现自己的业务逻辑
		return true;
	}
}

<br><br><br>
自定义设置文档的读写权限
实现过程:<br>
在com.gzsolartech.smartforms.extproperty包创建一个自己的类实现ISmartCtrlExtProperty<br>
   /**
	 * 读权限
	 */
	String read=EntityIdPrefix.DATDOCUMENTRIGHT_TYPE_READ;
	//添加用户权限
	request.setAttribute(read+EntityIdPrefix.DATDOCUMENT_RIGHT_EMPLOYEE,用户id list集合);
	//添加角色权限
	request.setAttribute(read+EntityIdPrefix.DATDOCUMENTRIGHT_ROLE,角色id list 集合);
   //添加部门权限
	request.setAttribute(read+EntityIdPrefix.DATDOCUMENTRIGHT_DEPT,部门id list 集合);

    /**
	 * 写入权限
	 */
	String write=EntityIdPrefix.DATDOCUMENTRIGHT_TYPE_WRITE;
	//添加用户权限
	request.setAttribute(write+EntityIdPrefix.DATDOCUMENT_RIGHT_EMPLOYEE,用户id list 集合);
	//添加角色权限
	request.setAttribute(write+EntityIdPrefix.DATDOCUMENTRIGHT_ROLE,角色id list 集合);
   //添加部门权限
	request.setAttribute(write+EntityIdPrefix.DATDOCUMENTRIGHT_DEPT,部门id list 集合);

反射类实现文档读写权限控制使用demo
/**
 * 反射调用默认返回true方法
 * @author wwd
 *
 */
public class SaveDocumentRightExtProperty implements ISmartCtrlExtProperty{
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request) {
	System.out.println("documentIddocumentId:"+documentId);
	DatDocumentRightService datDocumentRightService = (DatDocumentRightService) wac.getBean(
			"datDocumentRightService", DatDocumentRightService.class);
	
	List&lt;String> deptIdsRead=new ArrayList&lt;String>();//部门id
	List&lt;String> deptIdsWrite=new ArrayList&lt;String>();//部门id
	
	List&lt;String> userIds=new ArrayList&lt;String>();//用户id
	List&lt;String> roles=new ArrayList&lt;String>();//角色id
	
	deptIdsRead.add("10045510000000000002");
	deptIdsRead.add("100483100000000049MN");
	deptIdsWrite.add("10045510000000000002");

	/**
	 * 读权限
	 */
	String read=EntityIdPrefix.DATDOCUMENTRIGHT_TYPE_READ;
	//添加用户权限
	request.setAttribute(read+EntityIdPrefix.DATDOCUMENT_RIGHT_EMPLOYEE,userIds);
	//添加角色权限
	request.setAttribute(read+EntityIdPrefix.DATDOCUMENTRIGHT_ROLE,roles);
   //添加部门权限
	request.setAttribute(read+EntityIdPrefix.DATDOCUMENTRIGHT_DEPT,deptIdsRead);

	/**
	 * 写入权限
	 */
	String write=EntityIdPrefix.DATDOCUMENTRIGHT_TYPE_WRITE;
	//添加用户权限
	request.setAttribute(write+EntityIdPrefix.DATDOCUMENT_RIGHT_EMPLOYEE,userIds);
	//添加角色权限
	request.setAttribute(write+EntityIdPrefix.DATDOCUMENTRIGHT_ROLE,roles);
   //添加部门权限
	request.setAttribute(write+EntityIdPrefix.DATDOCUMENTRIGHT_DEPT,deptIdsWrite);

	return true;
	}

}




							</code>
						</pre>
					</div>



					<div class="docs-section">
						<div class="page-header">
							<h1 class="docs-heading">
								表单保存前js事件<span class="anchor-target" id="getting-started"></span> <a
									name="3F">&nbsp;</a>
							</h1>
						</div>
						<p>介绍:</p>
						<pre>
<code class="lang-less">
								<span class="hljs-at_rule">
表单保存前 可以在js页面执行的一些校验

表单点击保存前会执行这个js 函数
function onSubmitCheck(form){
   form.submit();//执行表单提交
 }

表单点击保存前可以自定一些校验工作

做法：重写onSubmitCheck 方法 实现自己的业务
function onSubmitCheck(form){
   在这里实现自己的业务逻辑
   form.submit();//执行表单提交
 }

							</code>
						</pre>
					</div>



					<div class="docs-section">
						<div class="page-header">
							<h1 class="docs-heading">
								保存后跳转到指定页面<span class="anchor-target" id="getting-started"></span>
								<a name="4F">&nbsp;</a>
							</h1>
						</div>
						<p>介绍:</p>
						<pre>
<code class="lang-less">
								<span class="hljs-at_rule">
表单保存后跳转到指定的页面
在页面添加一个隐藏域
&lt;input type="hidden" 
name="<%=com.gzsolartech.smartforms.constant.TemplateFieldName.RETURN_PATH_FIELD%>"
value="要跳转的url"
/>

							</code>
						</pre>
					</div>

					<div class="docs-section">
						<div class="page-header">
							<h1 class="docs-heading">
								是否保存空字段的值<span class="anchor-target" id="getting-started"></span>
								<a name="5F">&nbsp;</a>
							</h1>
						</div>
						<p>介绍:</p>
						<pre>
<code class="lang-less">
								<span class="hljs-at_rule">
文档在保存的时候，可以通过该域控制是否要清空文档中的字段值。添加了这个隐藏域后，当提交的参数中没有已定义的字段名称的话，该字段值会被清空。
在页面添加一个隐藏域：
&lt;input type="hidden" name="<%=com.gzsolartech.smartforms.constant.TemplateFieldName.CLEAR_EMPTY_FIELD%>" />

							</code>
						</pre>
					</div>

<div class="docs-section">
						<div class="page-header">
							<h1 class="docs-heading">
								保存后表单事件类<span class="anchor-target" id="getting-started"></span>
								<a name="6F">&nbsp;</a>
							</h1>
						</div>
						<p>介绍:</p>
						<pre>
<code class="lang-less">
		<span class="hljs-at_rule">
位置:新建和更新表单时-->属性选项卡下<br>
功能:表单保存后可自定执行的事件<br>
填写类的全路径:例如 com.gzsolartech.smartforms.extproperty.DocumentDataProperty<br>
实现过程:<br>
在com.gzsolartech.smartforms.extproperty包创建一个自己的类实现ISmartCtrlExtParmProperty<br>
demo:<br>
public class DocumentDataProperty  implements ISmartCtrlExtParmProperty{
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request, JSONObject param) {
		// TODO Auto-generated method stub
		System.out.println(param);
		//在这里做数据修改
		param.put("textfield1", "123123123123");
		return true;
	}

}
		</code>
		</pre>
		</div>
		
		
<div class="docs-section">
	<div class="page-header">
		<h1 class="docs-heading">
			表单隐藏属性<span class="anchor-target" id="getting-started"></span>
			<a name="7F">&nbsp;</a>
		</h1>
	</div>
	<p>介绍：在打开表单或者打开文档的时候，有时需要通过EL表达式获取文档中的字段值，或者文档ID、应用库ID等。其实在加载页面的时候，平台会自动加载数据到Request对象中，开发人员只需要通过EL表达式就能够获取到数据。</p>
	<pre>
		<code class="lang-less">
		<span class="hljs-at_rule">
获取应用库ID：\${appId }<br/>
获取表单名称：\${formName }<br/>
获取文档ID：\${docUid }<br/>
获取文档字段值：\${item1 }，item1是sot控件的name属性值。<br/>
获取文档XML数据：\${docData }，它会以JSON格式的形式返回文档中的XML数据。<br/>
获取URL参数：\${mode[0] }，获取URL参数mode。
		</code>
	</pre>
</div>
		
</div>
				
				
</body>
</html>