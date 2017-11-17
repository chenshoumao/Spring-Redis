<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/console/help/taglib.css" />
<title>
自定义扩展控件
</title>
  </head>
  <a href="#gotop" target="_self" style="position: fixed;right: 15px;">返回顶部</a>
<body class="index">
<div class="container docs-container">
<div class="row">
<div class="col-md-3">
<a name="gotop" href="#"></a>
<!-- <div class="sidebar hidden-print affix" role="complementary"> -->
<div id="navigation"> 
<ul class="nav sidenav" style="display:block;">
<li class="active"><a href="#1F" >自定义扩展控件</a></li>
</ul>
</div>
<!-- </div>  -->
</div>
<div class="col-md-9" role="main">
<div class="panel docs-content">
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">自定义扩展控件<span class="anchor-target" id="getting-started"></span>
<a name="1F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
表单平台已经提供一些的基础的表单控件，当业务情景比较复杂、
表单已有控件满足不了时，可以通过扩展控件实现符合自己业务
需求的表单控件。
实现步骤:
(1) 在 com.gzsolartech.portal.extTag 包下传建一个类集成AbstractComponentExt

例如创建一个DemoExtTag类

/** 
* @ClassName: DemoExtTag 
* @Description: 自定义使用控件的使用示例
* 自定义扩展控件请按照以下规范进行开发
* 
* @author wwd 
* @date 2016年10月21日 上午10:15:41 
*  
*/
public class DemoExtTag extends AbstractComponentExt {
    
	/**
	 * 无参构造函数这个必须要有的
	 * 不然会报空指针异常
	 * 在构造函数里面调用init()方法 进行初始化工作
	 */


	
	/* (non-Javadoc)
	 * @see com.gzsolartech.portal.extTag.AbstractComponentExt#doTag()
	 * 在这个方法实现自己的业务逻辑
	 */
	@Override
	public void doTag() throws JspException, IOException {
		init();//初始化  这个方法必需要有
		//在这里实现自己的业务逻辑
		//=========================================================
		 // wac;// 可用于获取spring的定义的bean 对象
		/*例如:
		 datDocumentService = (DatDocumentService) wac.getBean(
				"datDocumentService", DatDocumentService.class);
		*/
		  //request;
		  //response;
		 // datDocumentService;// 文档操作的类
		//  documentId;//文档id
		//;documentData  //根据文档id 取得文档数据
		// attributes   保存控件的属性
		/*扩展自己的input 控件*/
		//获取自己定义控件的id
		String id=(String) attributes.get("id");
		//获取自己定义控件的name
		String name=(String) attributes.get("name");
		//获取自己定义控件的value
		String value=(String) attributes.get("value");
		//编辑模式看到的数据信息
		String renderHtml="&lt;input type=\"text\" name=\""+name+"\" id=\""+id+"\" value=\""+value+"\"/>";
		//只读模式看到的数据信息
		String readerHtml=value;
		//=========================================================
		//调用这个方法进行渲染
		renderHTML(renderHtml,readerHtml);
	}

}

(2) 配置tld 文件
打开:/WEB-INF/tlds/formCtrlsExtTag.tld
添加如下内容
    <!--   自定义自己的input控件 -->
    &lt;tag>
        &lt;description>自定义自己的input控件&lt;/description>
        &lt;name>demo</name>
        &lt;tag-class>com.gzsolartech.portal.extTag.DemoExtTag&lt;/tag-class>
        &lt;body-content>scriptless&lt;/body-content>
         &lt;dynamic-attributes>true&lt;/dynamic-attributes>  
    &lt;/tag>
     配置文件说明

   &lt;tag>
        &lt;description>自定义控件的描述信息&lt;/description>
        &lt;!-- 例如文本控件 sot:textfield  name的值就是: textfield -->
        &lt;name>控件标签的名称&lt;/name>
        &lt;tag-class>创建类的路径&lt;/tag-class>
        &lt;!-- 固定不变直接拷贝 -->
        &lt;body-content>scriptless&lt;/body-content>
          &lt;!-- 固定不变直接拷贝 -->
         &lt;dynamic-attributes>true&lt;/dynamic-attributes>  
    &lt;/tag>
(3) 使用自己定义的控件
&lt;sotExt:demo id="w" name="wwd" value="${docUid}"/>
使用自己的定义的控件前缀名是:sotExt
表单控件的前缀sot 2者不要混淆
创建的类必需是ExtTag结尾 并且放在com.gzsolartech.portal.extTag 包下
例如:DemoExtTag
请遵循这个开发规范
</code></pre>
</div>




</div>
</body></html>