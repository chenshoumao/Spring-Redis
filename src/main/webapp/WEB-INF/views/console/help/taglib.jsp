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
自定义标签介绍
</title>
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
<li class="active"><a href="#1F" >单行文本框</a></li>
<li class=""><a href="#2F">下拉框</a></li>
<li class=""><a href="#3F">多行文本框</a></li>
<li class=""><a href="#4F">复选框</a></li>
<li class=""><a href="#5F">单选框</a></li>
<li class=""><a href="#6F">密码框</a></li>
<li class=""><a href="#7F">日期</a></li>
<li class=""><a href="#8F">数字控件</a></li>
<li class=""><a href="#9F">上传控件</a></li>
<li class=""><a href="#10F">下载控件</a></li>
<li class=""><a href="#11F">动态表格</a></li>
<li class=""><a href="#12F">数据查询</a></li>
<li class=""><a href="#13F">数据列表视图</a></li>
<li class=""><a href="#14F">子表单</a></li>
<li class=""><a href="#15F">提交按钮</a></li>
<li class=""><a href="#16F">人员</a></li>
<li class=""><a href="#17F">部门</a></li>
<li class=""><a href="#18F">span 标签</a></li>
<li class=""><a href="#19F">面板</a></li>
<li class=""><a href="#20F">按钮</a></li>
<li class=""><a href="#21F">编辑器</a></li>
<li class=""><a href="#22F">获取打开表单url控件</a></li>
<li class=""><a href="#23F">资源文本标签</a></li>
<li class=""><a href="#24F">动态表格V2</a></li>
<li class=""><a href="#25F">全局子表单</a></li>
<li class=""><a href="#26F">列表框控件</a></li>
<li class=""><a href="#27F">千分位金额控件</a></li>
<li class=""><a href="#28F">动态表格视图V2控件</a></li>
<li class=""><a href="#29F">单行文本加密控件</a></li>
<li class=""><a href="#30F">多行文本加密控件</a></li>
</ul>
</div>
<!-- </div>  -->
</div>
<div class="col-md-9" role="main">
<div class="panel docs-content">
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">文本框<span class="anchor-target" id="getting-started"></span>
<a name="1F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:textfield id="textarea" name="textfield">&lt;/sot:textfield><br>
属性介绍:<br>
<span style="color:red;"> id 指文本框id <br></span>
使用:
&lt;sot:textfield id="textarea" >&lt;/sot:textfield><br>
生成html样式:
&lt;input id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:textfield cssclass="test" >&lt;/sot:textfield><br>
生成html样式:
&lt;input calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:textfield cssstyle="width:100%" >&lt;/sot:textfield><br>
生成html样式:
&lt;input style="width:100%"/><br><br>

<span style="color:red;">disabled 指文本框是否只读</span>
使用:
&lt;sot:textfield disabled="disabled" >&lt;/sot:textfield><br>
生成html样式:
&lt;input disabled="disabled"/><br><br>

<span style="color:red;">name 指文本框的name值</span>
使用:
&lt;sot:textfield name="text" >&lt;/sot:textfield><br>
生成html样式:
&lt;input name="text"/><br><br>

<span style="color:red;">value 指文本框默认值</span>
使用:
&lt;sot:textfield value="text" >&lt;/sot:textfield><br>
生成html样式:
&lt;input value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 文本框显示文本，false 显示文本框</span>
使用:
&lt;sot:textfield readonly="com.solartech.Test" >&lt;/sot:textfield><br>
生成html样式:
false:
&lt;input value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:textfield onclick="test();" >&lt;/sot:textfield><br>
生成html样式:
&lt;input onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:textfield onmouseout="test();" >&lt;/sot:textfield><br>
生成html样式:
&lt;input onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:textfield onchange="test();" >&lt;/sot:textfield><br>
生成html样式:
&lt;input onchange="test();"/><br><br>

<span style="color:red;"> hidden 指定是否隐藏域</span>
使用:
&lt;sot:textfield hidden="true" >&lt;/sot:textfield><br>
生成html样式:
&lt;input type="hidden"/><br><br>

<span style="color:red;"> require 指定是否必填</span>
使用:
&lt;sot:textfield require="true" >&lt;/sot:textfield><br><br>

<span style="color:red;"> minlength 指允许输入最小长度</span>
使用:
&lt;sot:textfield minlength="5" >&lt;/sot:textfield><br><br>


<span style="color:red;"> maxlength 指允许输入最大长度</span>
使用:
&lt;sot:textfield maxlength="16" >&lt;/sot:textfield><br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:textfield readstyle="color:red" >&lt;/sot:textfield><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:textfield readclass="t" >&lt;/sot:textfield><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">escape  指定只读模式下文本内容是否编码，默认为false（不编码）</span>
使用:
&lt;sot:textfield escape="true" >&lt;/sot:textfield><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:textfield htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:textfield><br>

</code></pre>
</div>

<!-- 下拉框=========================================================================-->

<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">下拉框<span class="anchor-target" id="getting-started"></span>
<a name="2F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:combobox id="textarea" name="textfield">&lt;/sot:combobox><br>
属性介绍:<br>
<span style="color:red;"> id 指下拉框id <br></span>
使用:
&lt;sot:combobox id="textarea" >&lt;/sot:combobox><br>
生成html样式:
&lt;select id="textarea">&lt;/select><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:combobox cssclass="test" >&lt;/sot:combobox><br>
生成html样式:
&lt;select calss="test">&lt;/select><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:combobox cssstyle="width:100%" >&lt;/sot:combobox><br>
生成html样式:
&lt;select style="width:100%">&lt;/select><br><br>



<span style="color:red;">name 指下拉框的name值</span>
使用:
&lt;sot:combobox name="text" >&lt;/sot:combobox><br>
生成html样式:
&lt;select name="text">&lt;/select><br><br>

<span style="color:red;">value 指下拉框默认值</span>
使用:
&lt;sot:combobox value="text" >&lt;/sot:combobox><br>
生成html样式:
&lt;select >
&lt;opt checked="ckecked" value='text'>选中值&lt;/option>
&lt;/select><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 下拉框显示文本，false 显示下拉框</span>
使用:
&lt;sot:combobox readonly="com.solartech.Test" >&lt;/sot:combobox><br>
生成html样式:
false:
&lt;select >&lt;/select><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:combobox onclick="test();" >&lt;/sot:combobox><br>
生成html样式:
&lt;select onclick="test();">&lt;/select><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:combobox onmouseout="test();" >&lt;/sot:combobox><br>
生成html样式:
&lt;select onmouseout="test();">&lt;/select><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:combobox onchange="test();" >&lt;/sot:combobox><br>
生成html样式:
&lt;select onchange="test();">&lt;/select><br><br>

<span style="color:red;"> data 指下拉框数据填充sql语句</span>
使用:
&lt;sot:combobox  data="select item_name text ,item_id value from FMW_MENU_ITEM " >&lt;/sot:combobox><br>
生成html样式:
&lt;select ><br>
&lt;option value='07df505b-0f19-4d4c-8f27-d652a20346cf'>系统配置&lt;/option><br>
&lt;option value='62bf8067-f996-47ff-9135-53f69770cb4b'>组织库管理&lt;/option><br>
&lt;/select><br><br>


<span style="color:red;"> staticvalue 指下拉框数据填充静态常量值</span>
使用:
&lt;sot:combobox  staticvalue="value|text,value|text" >&lt;/sot:combobox><br>
生成html样式:
&lt;select ><br>
&lt;option  selected="selected"  value='1'>2&lt;/option><br>
&lt;option value='3'>4&lt;/option><br>
&lt;/select><br><br>
<br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:combobox readstyle="color:red" >&lt;/sot:combobox><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:combobox readclass="t" >&lt;/sot:combobox><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:combobox htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:combobox><br>

<!-- param -->
<span style="color:red;">dynamicData  传入类名，自定义创建一个类实现 DynamicDataISmartCtrlExtProperty接口</span>
使用demo:
&lt;sot:combobox dynamicData="com.gzsolartech.smartforms.extproperty.DynamicDataExtProperty">&lt;/sot:combobox><br>
如果反射类需要传入外部参数使用demo:
&lt;sot:combobox param="需要传入的参数" dynamicData="com.gzsolartech.smartforms.extproperty.DynamicDataExtProperty">&lt;/sot:combobox><br>

反射类实现接口重写方法的demo:  map的可以 text和value 定位这2个
	@Override
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request,String param) {
		// TODO Auto-generated method stub
		List&lt;Map&lt;String,Object>> datas=new ArrayList&lt;Map&lt;String,Object>>();
		Map&lt;String,Object> tmp=new HashMap&lt;String,Object>();
		tmp.put("value", 2);
		tmp.put("text", "测试2");
		
		Map&lt;String,Object> tmp1=new HashMap&lt;String,Object>();
		tmp1.put("value", 3);
		tmp1.put("text", "测试3");
		datas.add(tmp1);
		datas.add(tmp);
		return datas;
	}

<span style="color:red;">bindingResource  绑定数据源的名称，数据源名称需要首先在元数据资源池中进行定义。</span>
使用:
&lt;sot:combobox bindingResource="test" >&lt;/sot:combobox><br>
</code></pre>
</div>

<!-- 多行文本框 ===========================================================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">多行文本框<span class="anchor-target" id="getting-started"></span>
<a name="3F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:textarea id="textarea" name="textfield">&lt;/sot:textarea><br>
属性介绍:<br>
<span style="color:red;"> id 指多行文本框id <br></span>
使用:
&lt;sot:textarea id="textarea" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea id="textarea">&lt;/textareaid><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:textarea cssclass="test" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea calss="test">&lt;/textareaid><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:textarea cssstyle="width:100%" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea style="width:100%">&lt;/textareaid><br><br>

<span style="color:red;">disabled 指多行文本框是否只读</span>
使用:
&lt;sot:textarea disabled="disabled" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea disabled="disabled">&lt;/textarea><br><br>

<span style="color:red;">name 指多行文本框的name值</span>
使用:
&lt;sot:textarea name="text" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea name="text">&lt;/textarea><br><br>

<span style="color:red;">value 指多行文本框默认值</span>
使用:
&lt;sot:textarea value="text" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea >text&lt;/textarea><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 多行文本框显示文本，false 显示多行文本框</span>
使用:
&lt;sot:textarea readonly="com.solartech.Test" >&lt;/sot:textarea><br>
生成html样式:
false:
&lt;textarea >&lt;/textarea><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:textarea onclick="test();" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea onclick="test();">&lt;/textarea><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:textarea onmouseout="test();" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea onmouseout="test();">&lt;/textarea><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:textarea onchange="test();" >&lt;/sot:textarea><br>
生成html样式:
&lt;textarea onchange="test();">&lt;/textarea><br><br>
<span style="color:red;"> require 指定是否必填</span>
使用:
&lt;sot:textarea require="true" >&lt;/sot:textarea><br><br>

<span style="color:red;"> minlength 指允许输入最小长度</span>
使用:
&lt;sot:textarea minlength="5" >&lt;/sot:textarea><br><br>

<span style="color:red;"> maxlength 指允许输入最大长度</span>
使用:
&lt;sot:textarea maxlength="16" >&lt;/sot:textarea><br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:textarea readstyle="color:red" >&lt;/sot:textarea><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:textarea readclass="t" >&lt;/sot:textarea><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">escape  指定只读模式下文本内容是否编码，默认为false（不编码）</span>
使用:
&lt;sot:textarea escape="true" >&lt;/sot:textarea><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:textarea htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:textarea><br>
</code></pre>
</div>

<!--复选框 ====================================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">复选框<span class="anchor-target" id="getting-started"></span>
<a name="4F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:checkbox id="textarea" name="textfield">&lt;/sot:checkbox><br>
属性介绍:<br>
<span style="color:red;"> id 指复选框id <br></span>
使用:
&lt;sot:checkbox id="textarea" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:checkbox cssclass="test" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:checkbox cssstyle="width:100%" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  style="width:100%"/><br><br>

<span style="color:red;">disabled 指复选框是否只读</span>
使用:
&lt;sot:checkbox disabled="disabled" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  disabled="disabled"/><br><br>

<span style="color:red;">name 指复选框的name值</span>
使用:
&lt;sot:checkbox name="text" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  name="text"/><br><br>

<span style="color:red;">value 指复选框默认值</span>
使用:
&lt;sot:checkbox value="text" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 复选框显示文本，false 显示复选框</span>
使用:
&lt;sot:checkbox readonly="com.solartech.Test" >&lt;/sot:checkbox><br>
生成html样式:
false:
 &lt;input type="checkbox"  value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:checkbox onclick="test();" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:checkbox onmouseout="test();" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:checkbox onchange="test();" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  onchange="test();"/><br><br>

<span style="color:red;"> hidden 指是否隐藏</span>
使用:
&lt;sot:checkbox hidden="true" >&lt;/sot:checkbox><br>
生成html样式:
 &lt;input type="checkbox"  hidden="true"/><br><br>
 
 <span style="color:red;"> staticvalue 指复选框数据填充静态常量值</span>
使用:
&lt;sot:checkbox  staticvalue="1|2,3|4" >&lt;/sot:checkbox><br>
生成html样式:
&lt;input  type="checkbox"   value='1'/>2
&lt;input  type="checkbox"   value='3'/>4

<span style="color:red;"> data 指复选框数据填充sql语句</span>
使用:
&lt;sot:checkbox  data="select item_name text ,item_id value from FMW_MENU_ITEM " >&lt;/sot:checkbox><br>
生成html样式:
&lt;input  type="checkbox"   value='07df505b-0f19-4d4c-8f27-d652a20346cf'>系统配置
&lt;input  type="checkbox"   value='62bf8067-f996-47ff-9135-53f69770cb4b'>组织库管理
<br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:textfield readstyle="color:red" >&lt;/sot:textfield><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:checkbox readclass="t" >&lt;/sot:checkbox><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:checkbox htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:checkbox><br>

<!-- param -->
<span style="color:red;">dynamicData  传入类名，自定义创建一个类实现 DynamicDataISmartCtrlExtProperty接口</span>
使用demo:
&lt;sot:combobox dynamicData="com.gzsolartech.smartforms.extproperty.DynamicDataExtProperty">&lt;/sot:combobox><br>
如果反射类需要传入外部参数使用demo:
&lt;sot:combobox param="需要传入的参数" dynamicData="com.gzsolartech.smartforms.extproperty.DynamicDataExtProperty">&lt;/sot:combobox><br>

反射类实现接口重写方法的demo:  map的可以 text和value 定位这2个
	@Override
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request,String param) {
		// TODO Auto-generated method stub
		List&lt;Map&lt;String,Object>> datas=new ArrayList&lt;Map&lt;String,Object>>();
		Map&lt;String,Object> tmp=new HashMap&lt;String,Object>();
		tmp.put("value", 2);
		tmp.put("text", "测试2");
		
		Map&lt;String,Object> tmp1=new HashMap&lt;String,Object>();
		tmp1.put("value", 3);
		tmp1.put("text", "测试3");
		datas.add(tmp1);
		datas.add(tmp);
		return datas;
	}
	
<span style="color:red;">bindingResource  绑定数据源的名称，数据源名称需要首先在元数据资源池中进行定义。</span>
使用:
&lt;sot:checkbox bindingResource="test" >&lt;/sot:checkbox><br>

<span style="color:red;">注意：要清理复选框的所有值的话，要加上特殊字段&lt;input type="hidden" name="__clearfield" /&gt;。当加上这个字段后，在保存文档的时候，系统会清空字段的值，当复选框全部不选的时候，就需要清理这些值。</span>
</code></pre>
</div>

<!--  单选框 ==================================================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">单选框<span class="anchor-target" id="getting-started"></span>
<a name="5F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:radio id="textarea" name="textfield">&lt;/sot:radio><br>
属性介绍:<br>
<span style="color:red;"> id 指单选框id <br></span>
使用:
&lt;sot:radio id="textarea" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:radio cssclass="test" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:radio cssstyle="width:100%" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  style="width:100%"/><br><br>

<span style="color:red;">disabled 指单选框是否只读</span>
使用:
&lt;sot:radio disabled="disabled" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  disabled="disabled"/><br><br>

<span style="color:red;">name 指单选框的name值</span>
使用:
&lt;sot:radio name="text" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  name="text"/><br><br>

<span style="color:red;">value 指单选框默认值</span>
使用:
&lt;sot:radio value="text" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 单选框显示文本，false 显示单选框</span>
使用:
&lt;sot:radio readonly="com.solartech.Test" >&lt;/sot:radio><br>
生成html样式:
false:
 &lt;input type="radio"  value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:radio onclick="test();" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:radio onmouseout="test();" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:radio onchange="test();" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  onchange="test();"/><br><br>

<span style="color:red;"> hidden 指是否隐藏</span>
使用:
&lt;sot:radio hidden="true" >&lt;/sot:radio><br>
生成html样式:
 &lt;input type="radio"  hidden="true"/><br><br>
 
 <span style="color:red;"> staticvalue 指单选框数据填充静态常量值</span>
使用:
&lt;sot:radio  staticvalue="1|2,3|4" >&lt;/sot:radio><br>
生成html样式:
&lt;input  type="radio"   value='1'/>2
&lt;input  type="radio"   value='3'/>4

<span style="color:red;"> data 指单选框数据填充sql语句</span>
使用:
&lt;sot:radio  data="select item_name text ,item_id id from FMW_MENU_ITEM " >&lt;/sot:radio><br>
生成html样式:
&lt;input  type="radio"   value='07df505b-0f19-4d4c-8f27-d652a20346cf'>系统配置
&lt;input  type="radio"   value='62bf8067-f996-47ff-9135-53f69770cb4b'>组织库管理
<br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:radio readstyle="color:red" >&lt;/sot:radio><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:radio readclass="t" >&lt;/sot:radio><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:radio htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:radio><br>

<!-- param -->
<span style="color:red;">dynamicData  传入类名，自定义创建一个类实现 DynamicDataISmartCtrlExtProperty接口</span>
使用demo:
&lt;sot:combobox dynamicData="com.gzsolartech.smartforms.extproperty.DynamicDataExtProperty">&lt;/sot:combobox><br>
如果反射类需要传入外部参数使用demo:
&lt;sot:combobox param="需要传入的参数" dynamicData="com.gzsolartech.smartforms.extproperty.DynamicDataExtProperty">&lt;/sot:combobox><br>

反射类实现接口重写方法的demo:  map的可以 text和value 定位这2个
	@Override
	public Object execute(WebApplicationContext wac, String documentId,
			HttpServletRequest request,String param) {
		// TODO Auto-generated method stub
		List&lt;Map&lt;String,Object>> datas=new ArrayList&lt;Map&lt;String,Object>>();
		Map&lt;String,Object> tmp=new HashMap&lt;String,Object>();
		tmp.put("value", 2);
		tmp.put("text", "测试2");
		
		Map&lt;String,Object> tmp1=new HashMap&lt;String,Object>();
		tmp1.put("value", 3);
		tmp1.put("text", "测试3");
		datas.add(tmp1);
		datas.add(tmp);
		return datas;
	}
	
<span style="color:red;">bindingResource  绑定数据源的名称，数据源名称需要首先在元数据资源池中进行定义。</span>
使用:
&lt;sot:combobox bindingResource="test" >&lt;/sot:combobox><br>
</code></pre>
</div>


<!-- 密码框 =============================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">密码框<span class="anchor-target" id="getting-started"></span>
<a name="6F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:password id="textarea" name="textfield">&lt;/sot:password><br>
属性介绍:<br>
<span style="color:red;"> id 指密码框id <br></span>
使用:
&lt;sot:password id="textarea" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:password cssclass="test" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:password cssstyle="width:100%" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  style="width:100%"/><br><br>

<span style="color:red;">disabled 指密码框是否只读</span>
使用:
&lt;sot:password disabled="disabled" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  disabled="disabled"/><br><br>

<span style="color:red;">name 指密码框的name值</span>
使用:
&lt;sot:password name="text" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  name="text"/><br><br>

<span style="color:red;">value 指密码框默认值</span>
使用:
&lt;sot:password value="text" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 密码框显示文本，false 显示密码框</span>
使用:
&lt;sot:password readonly="com.solartech.Test" >&lt;/sot:password><br>
生成html样式:
false:
&lt;input type="password"  value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:password onclick="test();" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:password onmouseout="test();" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:password onchange="test();" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  onchange="test();"/><br><br>

<span style="color:red;"> hidden 指是否隐藏</span>
使用:
&lt;sot:password hidden="true" >&lt;/sot:password><br>
生成html样式:
&lt;input type="password"  hidden="true"/><br><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:password htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:password><br>
</code></pre>
</div>

<!--  日期 ==================================================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">日期<span class="anchor-target" id="getting-started"></span>
<a name="7F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:datefield id="textarea" name="textfield">&lt;/sot:datefield><br>
属性介绍:<br>
<span style="color:red;"> id 指日期id <br></span>
使用:
&lt;sot:datefield id="textarea" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:datefield cssclass="test" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:datefield cssstyle="width:100%" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   style="width:100%"/><br><br>


<span style="color:red;">name 指日期的name值</span>
使用:
&lt;sot:datefield name="text" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   name="text"/><br><br>

<span style="color:red;">value 指日期默认值</span>
使用:
&lt;sot:datefield value="text" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 日期显示文本，false 显示日期</span>
使用:
&lt;sot:datefield readonly="com.solartech.Test" >&lt;/sot:datefield><br>
生成html样式:
false:
 &lt;input class="easyui-datebox"   value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:datefield onclick="test();" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:datefield onmouseout="test();" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:datefield onchange="test();" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"   onchange="test();"/><br><br>
 
 <span style="color:red;"> parser 指 easyui-datebox parser事件</span>
使用:
&lt;sot:datefield parser="parser();" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox"    data-options="parser:parser()"/><br><br>

  <span style="color:red;"> formatter 指 easyui-datebox formatter事件</span>
使用:
&lt;sot:datefield formatter="formatter();" >&lt;/sot:datefield><br>
生成html样式:
 &lt;input class="easyui-datebox" data-options="formatter:formatter()"  /><br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:textfield readstyle="color:red" >&lt;/sot:textfield><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:textfield readclass="t" >&lt;/sot:textfield><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>
</code></pre>
</div>


<!--数字控件-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">数字控件<span class="anchor-target" id="getting-started"></span>
<a name="8F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:numberfield id="textarea" name="textfield">&lt;/sot:numberfield><br>
属性介绍:<br>
<span style="color:red;"> id 指数字控件id <br></span>
使用:
&lt;sot:numberfield id="textarea" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:numberfield cssclass="test" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:numberfield cssstyle="width:100%" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" style="width:100%"/><br><br>

<span style="color:red;">disabled 指数字控件是否只读</span>
使用:
&lt;sot:numberfield disabled="disabled" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" disabled="disabled"/><br><br>

<span style="color:red;">name 指数字控件的name值</span>
使用:
&lt;sot:numberfield name="text" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" name="text"/><br><br>

<span style="color:red;">value 指数字控件默认值</span>
使用:
&lt;sot:numberfield value="text" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 数字控件显示文本，false 显示数字控件</span>
使用:
&lt;sot:numberfield readonly="com.solartech.Test" >&lt;/sot:numberfield><br>
生成html样式:
false:
&lt;input  class="easyui-numberbox" value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:numberfield onclick="test();" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:numberfield onmouseout="test();" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:numberfield onchange="test();" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" onchange="test();"/><br><br>


<span style="color:red;"> precision 指小数点精确到几位</span>
使用:
&lt;sot:numberfield precision="2" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" precision="2"/><br><br>



<span style="color:red;"> max 指 允许最大的值</span>
使用:
&lt;sot:numberfield max="999" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" max="999"/><br><br>




<span style="color:red;"> min 指 min最小值</span>
使用:
&lt;sot:numberfield min="1" >&lt;/sot:numberfield><br>
生成html样式:
&lt;input  class="easyui-numberbox" min="1"/><br><br>


<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:textfield readstyle="color:red" >&lt;/sot:textfield><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:textfield readclass="t" >&lt;/sot:textfield><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

</code></pre>
</div>


    <!--  上传控件 -->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">上传控件<span class="anchor-target" id="getting-started"></span>
<a name="9F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:fileupload id="textarea" >&lt;/sot:fileupload><br>
属性介绍:<br>
<span style="color:red;"> id 指上传控件id <br></span>
使用:
&lt;sot:fileupload id="textarea" >&lt;/sot:fileupload><br>


<span style="color:red;"> cssclass 指上传控件css class 类 <br></span>
使用:
&lt;sot:fileupload cssclass="btn" >&lt;/sot:fileupload><br>

<span style="color:red;"> cssstyle 指上传控件css 内部样式 <br></span>
使用:
&lt;sot:fileupload cssstyle="width:100%" >&lt;/sot:fileupload><br>

<span style="color:red;"> downloadid 指上传控件 引用下载控件的id<br></span>
使用:
&lt;sot:fileupload downloadid="downloadid" >&lt;/sot:fileupload><br>


<span style="color:red;"> width 指上传控件宽度 <br></span>
使用:
&lt;sot:fileupload width="30px" >&lt;/sot:fileupload><br>


<span style="color:red;"> height 指上传控件高度 <br></span>
使用:
&lt;sot:fileupload height="30px" >&lt;/sot:fileupload><br>

<span style="color:red;"> callback 指上传控件 附件上传成功执行的回调方法<br></span>
使用:
&lt;sot:fileupload callback="callback()" >&lt;/sot:fileupload><br>

<span style="color:red;"> folder 指上传控件 附件类型<br></span>
使用:
&lt;sot:fileupload folder="财务类型" >&lt;/sot:fileupload><br>
&lt;sot:fileupload folder="#type" >&lt;/sot:fileupload>等价于folder=$("#type").value()<br>
<span style="color:red;"> suffixes 指上传控件附件类型  允许的文件后缀，不带点，多个用逗号分割<br></span>
使用:
&lt;sot:fileupload suffixes="zip,txt" >&lt;/sot:fileupload><br>

</code></pre>
</div>

    <!--  下载控件-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">下载控件<span class="anchor-target" id="getting-started"></span>
<a name="10F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:filedownload id="textarea" >&lt;/sot:filedownload><br>
属性介绍:<br>
<span style="color:red;"> id 指下载控件id <br></span>
使用:
&lt;sot:filedownload id="textarea" >&lt;/sot:filedownload><br>

<span style="color:red;"> cssclass 指下载控件css class 类 <br></span>
使用:
&lt;sot:filedownload cssclass="btn" >&lt;/sot:filedownload><br>

<span style="color:red;"> cssstyle 指下载控件css 内部样式 <br></span>
使用:
&lt;sot:filedownload cssstyle="width:100%" >&lt;/sot:filedownload><br>

<span style="color:red;"> cssstyle 指下载控件css 内部样式 <br></span>
使用:
&lt;sot:filedownload cssstyle="width:100%" >&lt;/sot:filedownload><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 只读，false 可编辑</span>
使用:
&lt;sot:filedownload readonly="com.solartech.Test" >&lt;/sot:filedownload><br>

<span style="color:red;">optrtoolbar 是否显示操作工具栏，设置值：enabled/disabled，默认enabled  <br></span>
使用:
&lt;sot:fileupload optrtoolbar="disabled" >&lt;/sot:fileupload><br>
<span style="color:red;">delbtn 是否显示删除按钮，设置值：enabled/disabled，默认enabled  <br></span>
使用:
&lt;sot:fileupload delbtn="disabled" >&lt;/sot:fileupload><br>
<span style="color:red;">downbtn 是否显示下载按钮，设置值：enabled/disabled，默认enabled  <br></span>
使用:
&lt;sot:fileupload downbtn="disabled" >&lt;/sot:fileupload><br>
<span style="color:red;">downopenbtn 是否显示打开按钮，设置值：enabled/disabled，默认enabled  <br></span>
使用:
&lt;sot:fileupload downopenbtn="disabled" >&lt;/sot:fileupload><br>

<span style="color:red;">columns 下载控件显示的列值</span>
使用:
&lt;sot:filedownload columns="attachmentName,fileSize" >&lt;/sot:filedownload><br>
可选属性
        attachmentName  文件名<br>
		fileName  文件名<br>
		fileExt   后缀名<br>
		fileSize  文件大小<br>
		fileCreated  文件修创建者<br>
		fileModified  文件修改时间<br>
		createTime 创建时间<br>
		updateBy 更新者 <br>
		updateTime 更新时间<br>
		filePath 附件路径<br>
		documentId 文档id<br>
		attachmentVersion 版本<br>
		attachmentStatus 状态<br>
		attachmentFolder 类型<br>
		attachmentId 附件id <br>

</code></pre>
</div>

    <!--  动态表格-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">动态表格<span class="anchor-target" id="getting-started"></span>
<a name="11F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:table id="table1">
&lt;sot:thead>
    &lt;th>文件名&lt;/th>
    &lt;th>类型&lt;/th>
    &lt;th>文件大小&lt;/th>
    &lt;th>版本&lt;/th>
    &lt;th>操作&lt;/th>
&lt;/sot:thead>
&lt;sot:tbody>

    
    &lt;td>&lt;input name="file">&lt;/td>
    &lt;td>
        &lt;input name="Fruit" type="checkbox" value="apple" />苹果
&lt;input name="Fruit" type="checkbox" value="pea" />桃子 
&lt;input name="Fruit" type="checkbox" value="banana" />香蕉 
&lt;input name="Fruit" type="checkbox" value="perl" />梨 
    &lt;/td>
    &lt;td>
        &lt;select name="size"> 
&lt;option value="0">DIVCSS5&lt;/option> 
&lt;option value="1">DI&lt;/option> 
&lt;/select> 
        
    &lt;/td>
    &lt;td>
    &lt;input name="version" type="radio" value="1" />ver1
&lt;input name="version" type="radio" value="2" />ver2  
&lt;input name="version" type="radio" value="3" />ver3 
&lt;input name="version" type="radio" value="4" />ver4

    &lt;/td>
    &lt;td>&lt;input name="operate">&lt;/td>

&lt;/sot:tbody>
&lt;/sot:table>



<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> id 指动态表格id <br></span>
使用:
&lt;sot:table id="textarea" >&lt;/sot:table><br>

<span style="color:red;"> cssclass 指动态表格css class 类 <br></span>
使用:
&lt;sot:table cssclass="btn" >&lt;/sot:table><br>

<span style="color:red;"> cssstyle 指动态表格css 内部样式 <br></span>
使用:
&lt;sot:table cssstyle="width:100%" >&lt;/sot:table><br>

<span style="color:red;"> cssstyle 指动态表格css 内部样式 <br></span>
使用:
&lt;sot:table cssstyle="width:100%" >&lt;/sot:table><br>

<span style="color:red;"> optrcolumn 是否显示操作列，设置值：enabled/disabled，默认enabled </span>
使用:
&lt;sot:table optrcolumn="disabled" >&lt;/sot:table><br />

<span style="color:red;"> optrtoolbar 是否显示操作工具栏，设置值：enabled/disabled，默认enabled </span>
使用：
&lt;sot:table optrtoolbar="disabled" >&lt;/sot:table><br />

<span style="color:red;"> autorender 是否自动渲染数据，设置值：true/false，默认true </span>
使用：
&lt;sot:table autorender="false" >&lt;/sot:table><br />

<span style="color:red;"> renderfn 渲染事件函数 </span>
使用：
&lt;sot:table renderfn="testrender" >&lt;/sot:table><br />

<span style="color:red;"> serialnum 是否生成序号 </span>
<div>当设定为true后，需要在thead和tbody都设定序号列，序号才会自动生成。另外tbody的序号列要添加serialnum样式。</div>
使用方法：<br/>
&lt;sot:table serialnum="true"&gt;
&lt;thead&gt;
&lt;th&gt;序号&lt;/th&gt;
&lt;/thead&gt;
&lt;tbody&gt;
&lt;td class=&quot;serialnum&quot;&gt;&lt;/td&gt; 
&lt;/tbody&gt;
&lt;/sot:table&gt; <br/>

<div>
前端脚本：<br />
function testrender(evt, table) {
   var tableId=table.ctrlId;
   $("#"+tableId+" :input[name^='operate']").each(function() {
      $(this).prop("disabled",false);
   });
}
</div>

<span style="color:red;"> autoedit 动态自动编辑状态，默认为false </span>
使用：
&lt;sot:table autoedit="true" >&lt;/sot:table><br />

<span style="font-weight:bold; font-size:14px">表格事件:</span><br/>
<span style="color:red;">新建行事件： onAddRow(evt, newRow, rowData, index, tableId)<br></span>
<div>使用：$(table1).bind("onAddRow", function(evt, newRow, rowData, index, tableId) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>
<div>newRow：新添加的行对象，通过jquery可以控制对象中的控件。</div>
<div>rowData：行数据对象，这个对象属性是只读的。</div>
<div>index：新增行的行号</div>
<div>tableId：表格ID</div>

<span style="color:red;">插入行事件： onInsertRow(evt, newRow, rowData, index, tableId)<br></span>
<div>使用：$(table1).bind("onInsertRow", function(evt, newRow, rowData, index, tableId) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>
<div>newRow：新插入的行对象，通过jquery可以控制对象中的控件。</div>
<div>rowData：行数据对象，这个对象属性是只读的。</div>
<div>index：新增行的行号</div>
<div>tableId：表格ID</div>

<span style="color:red;">删除行事件： onRemoveRow(evt)<br></span>
<div>使用：$(table1).bind("onRemoveRow", function(evt) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>

<span style="color:red;">删除所有行事件： onRemoveAllRow(evt)<br></span>
<div>使用：$(table1).bind("onRemoveAllRow", function(evt) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>

<span style="color:red;">更新行事件： onUpdateRow(evt, row, rowData)<br></span>
<div>使用：$(table1).bind("onUpdateRow", function(evt, row, rowData) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>
<div>row：更新行的对象</div>
<div>rowData：更新行的数据</div>

<div style="font-weight:bold; font-size:14px">表格方法:</div>
<span style="color:red;">添加行： addRow()<br></span>
<div>使用：table1.addRow();</div>

<span style="color:red;">插入行： insertRow(index)<br></span>
<div>使用：table1.insertRow(1);</div>
<div>参数说明:</div>
<div>index：行号，从0开始</div>

<span style="color:red;">删除行： removeRow(index)<br></span>
<div>使用：table1.removeRow(1);</div>
<div>参数说明:</div>
<div>index：行号，从0开始</div>

<span style="color:red;">删除所有行： removeAllRow()<br></span>
<div>使用：table1.removeAllRow();</div>

<span style="color:red;">获取表格对象数据： getData()<br></span>
<div>返回值：JSON格式字符串</div>
<div>使用：table1.getData();</div>

<span style="color:red;">获取表格对象数据： getDataObj()<br></span>
<div>返回值：JSON对象</div>
<div>使用：table1.getDataObj();</div>

<span style="color:red;">设置表格数据源： setData(data)<br></span>
<div>使用：table1.setData(data);</div>

<span style="color:red;">更新行数据： updateRow(index)<br></span>
<div>使用：table1.updateRow(1);</div>
<div>参数说明:</div>
<div>index：行号，从0开始</div>

<span style="color:red;">指定行转换为编辑模式： editRow(index)<br></span>
<div>使用：table1.editRow(1);</div>
<div>参数说明:</div>
<div>index：行号，从0开始</div>


<span style="color:red;">deleteBtn 删除操作按钮<br></span>
<div>使用： 例如动态表格的id=table1  </div>
<div>
&lt;sot:table deleteBtn="&lt;span onclick='table1deteRowData(this)'>删除&lt;/span>">&lt;/sot:table>
<br>
onclick="table1deteRowData(this)" 说明  onclick="动态表格id+deteRowData(this)" 
</div>

<span style="color:red;">editBtn 编辑操作按钮<br></span>
<div>使用： 例如动态表格的id=table1  </div>
<div>
&lt;sot:table editBtn="&lt;span onclick='table1editRowData(this)'>编辑&lt;/span>">&lt;/sot:table>
<br>
onclick="table1editRowData(this)" 说明  onclick="动态表格id+editRowData(this)" 

</div>

</code></pre>
</div>
			
			
			 <!--  数据查询-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">数据查询<span class="anchor-target" id="getting-started"></span>
<a name="12F">&nbsp;</a> 
</h1>
</div>
<p>
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
每创建一个应用库，数据库会相应创建一个视图：SMF_APPVIEW_+应用库的英文名称<br>
FORM_NAME: 在应用库创建的表单名称<br>
DOCUMENT_ID:表单录入数据时的数据文档id<br>
DOCUMENT_DATA:表单录入数据以xml格式 存放在数据库<br>
xml数据库格式如下:
&lt;?xml version = '1.0' encoding = 'UTF-8'?>
&lt;root>
   &lt;__appid>appid:a0dde564-74d4-49f2-b252-24cfa0cd11d4&lt;/__appid>
   &lt;__docuid>docid:c8811e5f-d27f-4633-88de-5639167e7c7a&lt;/__docuid>
   &lt;textfield>dfwe&lt;/textfield>
   &lt;__formname>textfield&lt;/__formname>
&lt;/root>
<br>
查询语法:<br>
select  extractvalue(document_data, '/root/textfield') textfield,extractvalue(document_data, '/root/__formname') formname <br>
 from SMF_APPVIEW_TESTTAG <br>
where form_name='textfield'  <br>
and document_id='docid:c8811e5f-d27f-4633-88de-5639167e7c7a' <br>
<p>
ORACLE 中 XML 基本函数介绍
 
 
1. EXTRACT（XMLType_instance，Xpath_string）
该函数用于返回XML节点路径下的相应内容
 
示例: SELECT extract(document_data,'/root/main') FROM project t;
 
 
2. EXTRACTVALUE（XMLType_instance,Xpath_string)
该函数用于返回特定XML节点路径的数据
 
 
示例: SELECT extractvalue(  document_data ,'/root/main/姓名') FROM  project  t ;
 
3. EXISTSNODE（XMLType_instance，Xpath_string）
该函数用于确定特定的XML节点的路径是否存在，返回0表示节点不存在，返回1表示节点存在。
 
示例: SELECT existsnode(document_data,'/root/main/住院号') data FROM xmltable a;

4. UPDATEXML（XMLType_instance,Xpath_string,value_expr)
  UPDATEXML（XMLType_instance,Xpath_string,value_expr)：该函数用于更新特定XMLType实例相应的节点路径的内容。其中参数XMLType_instance用于指定XMLType实例，Xpath_string用于指定XML节点路径，value_expr用于指定新值。示例如下：
 UPDATE xmltable p SET p=UPDATEXML(document_data,    '/PurchaseOrder/User/text() ','SCOTT');

</p>

</code>
</pre>
</div>
			
			
<!-- 	数据列表视图 =========================-->
			
			<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">数据列表视图 <span class="anchor-target" id="getting-started"></span>
<a name="13F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:dataview  formName='VIEW_testTag_textfield' rows="10" 
              order="update_time desc" relate="app_id='appid:a0dde564-74d4-49f2-b252-24cfa0cd11d4'">  
  &lt;sot:query resetValue="重置按钮" searchValue="查询按钮">
        &lt;sot:condition name="forname"  binding="to_char(update_time,'yyyy-mm-dd')" text="更新时间" inputType="date" dataType="range">&lt;/sot:condition>
   &lt;sot:condition name="forname" text="应用库" inputType="select"
                  data="select app_Id value, APP_NAME text from DAT_APPLICATION"
                  binding="app_id" staticvalue="|请选择应用库"
                   >&lt;/sot:condition>
     &lt;sot:condition name="forname"  binding="textfield1" text="数据" dataType="like">&lt;/sot:condition>
     &lt;sot:condition name="formname" binding="form_name" text="表单名称">&lt;/sot:condition>
  &lt;/sot:query>
  &lt;sot:columns>
    &lt;sot:item title="表单名称" binding="form_name" alias="formname">&lt;/sot:item>
    &lt;sot:item title="文档id" binding="document_id" alias="documentId" cssstyle="width:350px">&lt;/sot:item>
    &lt;sot:item title="应用库id" binding="app_id" alias="appId">&lt;/sot:item>
     &lt;sot:item title="更新时间" binding="to_char(update_time,'yyyy-mm-dd hh24:mi:ss')" alias="updateTime">&lt;/sot:item>
    &lt;sot:item title="数据" binding="textfield1" alias="t">&lt;/sot:item>
  &lt;/sot:columns>
&lt;/sot:dataview>

<br>
<span style="color:red;">
&lt;sot:dataview  formName='VIEW_testTag_textfield' rows="10" 
              order="update_time desc" relate="app_id='appid:a0dde564-74d4-49f2-b252-24cfa0cd11d4'">  
<br>
formName：查询的sql 表<br>
order：排序字段<br>
relate：多表查询关联条件<br>
</span>
<span style="color:red;">数据列的显示<br></span>
  &lt;sot:columns>
    &lt;sot:item title="表单名称" binding="form_name" alias="formname">&lt;/sot:item>
    &lt;sot:item title="文档id" binding="document_id" alias="documentId" cssstyle="width:350px">&lt;/sot:item>
    &lt;sot:item title="应用库id" binding="app_id" alias="appId">&lt;/sot:item>
     &lt;sot:item title="更新时间" binding="to_char(update_time,'yyyy-mm-dd hh24:mi:ss')" alias="updateTime">&lt;/sot:item>
    &lt;sot:item title="数据" binding="textfield1" alias="t">&lt;/sot:item>
  &lt;/sot:columns>
  <span style="color:red;"><br>数据列的显示属性介绍:<br>
  title:表头列的显示标题<br>
  binding：绑定查询的sql 列名<br>
   alias：绑定查询的sql 列名 的别名<br>
   cssstyle: 设置列的样式<br>
   cssclass：设置列的class样式<br>
   format: 设置单元格数据样式函数，设置了函数名称后，需要在表单头添加对应的函数实现。<br/>
  </span>

  <span style="color:red;">查询条件<br>
    &lt;sot:query resetValue="重置按钮" searchValue="查询按钮">
        &lt;sot:condition name="forname"  binding="to_char(update_time,'yyyy-mm-dd')" text="更新时间" inputType="date" dataType="range">&lt;/sot:condition>
   &lt;sot:condition name="forname" text="应用库" inputType="select"
                  data="select app_Id value, APP_NAME text from DAT_APPLICATION"
                  binding="app_id" staticvalue="|请选择应用库"
                   >&lt;/sot:condition>
     &lt;sot:condition name="forname"  binding="textfield1" text="数据" dataType="like">&lt;/sot:condition>
     &lt;sot:condition name="formname" binding="form_name" text="表单名称">&lt;/sot:condition>
  &lt;/sot:query>
  
  resetValue：重置按钮值<br>
  searchValue：查询按钮值<br>
   name： 生成html input name<br>
      binding： 绑定sql 查询的列<br>
       text： 生成html input lable的值<br>
         dataType： 查询类型  值固定为: like,range,equal   like 模糊查询  range 范围查询  equal 等于<br>
  inputType: 生成 输入框的类型  值固定为:text,select,date
  </span>
  
</code></pre>
</div>

<!-- 	子表单控件 =========================-->
			
			<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">子表单 <span class="anchor-target" id="getting-started"></span>
<a name="14F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:subform formname="sub1"/><br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> formname 子表单名称 <br></span>

  
</code></pre>

</div>

<!-- 	提交按钮控件 =========================-->
			
			<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">提交按钮 <span class="anchor-target" id="getting-started"></span>
<a name="15F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:submit value="保存"/><br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> value 按钮文本 <br></span>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:submit htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:submit><br>
</code></pre>
</div>
<!--人员对话框 ====================== -->

	<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">选择人员对话框<span class="anchor-target" id="getting-started"></span>
<a name="16F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:userDlg id="user" name="user" cssstyle="width:200px;height:28px;">&lt;/sot:userDlg>
<br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> 具备的属性有:id  name  cssstyle  cssclass 用法同上<br></span>
<span style="color:red;"> single 是否单选  true或false<br></span>
使用:
&lt;sot:userDlg id="user" name="user" single="true">&lt;/sot:userDlg><br><br>
<span style="color:red;"> showcurrent  显示当前用户的部门人员  true或false<br></span>
使用:
&lt;sot:userDlg id="user" name="user" showcurrent="true">&lt;/sot:userDlg>

</code></pre>
</div>
<!-- 部门对话框 ===================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">选择部门对话框<span class="anchor-target" id="getting-started"></span>
<a name="17F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:deptDlg id="user" name="user" cssstyle="width:200px;height:28px;">&lt;/sot:deptDlg>
<br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> 具备的属性有:id  name  cssstyle  cssclass 用法同上<br></span>
</code></pre>
</div>

<!-- Span 标签 ===================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">&lt;span> 标签<span class="anchor-target" id="getting-started"></span>
<a name="18F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:span id="user" cssstyle="width:200px;height:28px;" value="标签">&lt;/sot:span>
<br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> 具备的属性有:id    cssstyle  cssclass 用法同上<br></span>
<span style="font-weight:bold; font-size:14px">value</span><br/>
<span style="color:red;">标签span 显示的值:&lt;span>value&lt;/span><br></span>
<span style="font-weight:bold; font-size:14px">key </span><br/>
<span style="color:red;">
&lt;sot:span id="user" cssstyle="width:200px;height:28px;" key="name">&lt;/sot:span><bt>
国际化 根据浏览器首选语言读取资源文件的key的值 替换span value的值 <br></span>

<span style="font-weight:bold; font-size:14px">binding  </span><br/>
<span style="color:red;">
&lt;sot:span binding="name">&lt;/sot:span><br>
绑定数据源读取文档name的值显示，上面的demo是读取&lt;input type="text" name="name"/>的值
<br></span>
</code></pre>
</div>


<!-- 面板===================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">面板<span class="anchor-target" id="getting-started"></span>
<a name="19F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:panel mode="read"  readonly="com.solartech.Test" >
其他的自定控件放在panel里面 
&lt;/sot:panel>
<br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> mode 的值 为 read或edit或hidden <br></span>
<span style="font-weight:bold; font-size:14px">mode </span><br/>

<span style="color:red;"> readonly<br></span>
<span style="font-weight:bold; font-size:14px">readonly  类的全路径  </span><br/>
</code></pre>
</div>
<!-- ====================== -->



<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">按钮控件<span class="anchor-target" id="getting-started"></span>
<a name="20F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:btn id="textarea" >&lt;/sot:btn><br>
属性介绍:<br>
<span style="color:red;"> id 指按钮id <br></span>
使用:
&lt;sot:btn id="btn" >&lt;/sot:btn><br>
生成html样式:
&lt;button type="button" id="btn">&lt;/button><br><br>
<span style="color:red;"> id 指按钮id <br></span>
使用:
&lt;sot:btn id="btn" >&lt;/sot:btn><br>
生成html样式:
&lt;button type="button" id="btn">&lt;/button><br><br>

<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:btn cssclass="test" >&lt;/sot:btn><br>
生成html样式:
&lt;button calss="test">&lt;/button><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:btn cssstyle="width:100%" >&lt;/sot:btn><br>
生成html样式:
&lt;button  style="width:100%">&lt;/button><br><br>



<span style="color:red;">value 指按钮的值</span>
使用:
&lt;sot:btn value="text" >&lt;/sot:btn><br>
生成html样式:
&lt;button >text&lt;/button><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 文本框显示文本，false 显示文本框</span>
使用:
&lt;sot:btn readonly="com.solartech.Test" >&lt;/sot:btn><br>
生成html样式:
false:
&lt;button >text&lt;/button><br><br>
true:
不显示


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:btn onclick="test();" >&lt;/sot:btn><br>
生成html样式:
&lt;button onclick="test();">text&lt;/button><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:btn onmouseout="test();" >&lt;/sot:btn><br>
生成html样式:
&lt;button onmouseout="test();">text&lt;/button><br><br>
<span style="color:red;"> key 指定资源国际化 key 读取到的值替换value值</span>
使用:
&lt;sot:btn key="name" >&lt;/sot:btn><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:button htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:button><br>
</code></pre>
</div>


<!-- ====================== -->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">富文本编辑器<span class="anchor-target" id="getting-started"></span>
<a name="21F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:editor id="textarea"  name="name" width="500" height="400">&lt;/sot:edito><br>
属性介绍:<br>
<span style="color:red;"> 
id 指编辑器的id <br>
name 指编辑器的name  等同于input的name <br>
width 指编辑器的width<br>
height 指编辑器的height <br>
</span>

</code></pre>
</div>

<!-- ====================== -->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">获取打开表单url控件<span class="anchor-target" id="getting-started"></span>
<a name="22F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:openForm appName="testTag" formName="table"/>
<br>
属性介绍:<br>
<span style="color:red;"> 
appName 应用库名称<br>
formName 表单名称
</span>

</code></pre>
</div>


<!-- ====================== -->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">资源文本标签<span class="anchor-target" id="getting-started"></span>
<a name="23F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:text name="text">
  &lt;sot:param value="国"/>
  &lt;sot:param  value="民"/>
&lt;/sot:text>
<br>
属性介绍:<br>
<span style="color:red;"> 
name 国际化资源文件name的值<br>
value  占位符参数的值<br>

国际化资源文件:
key的值等于 text 
value的值等于: 中{0}人{1}
应用控件后显示的值:中国人民
</span>

</code></pre>
</div>

 <!--  动态表格V2-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">动态表格V2<span class="anchor-target" id="getting-started"></span>
<a name="24F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:tableV2 id="tht" cssclass="" cssstyle="">
 &lt;sot:theadV2>
   &lt;tr>
	&lt;th>文件名&lt;/th>
	&lt;th>类型&lt;/th>
	&lt;th>文件大小&lt;/th>
	&lt;th>版本&lt;/th>
	&lt;th>操作&lt;/th>
  &lt;/tr>
 &lt;/sot:theadV2>
 &lt;sot:tbodyV2>
   &lt;tr>
	&lt;td>&lt;input name="file">&lt;/td>
    &lt;td>&lt;input name="Fruit" type="checkbox" value="apple" />苹果
	&lt;input name="Fruit" type="checkbox" value="pea" />桃子 
	&lt;input name="Fruit" type="checkbox" value="banana" />香蕉 
	&lt;input name="Fruit" type="checkbox" value="perl" />梨 
    &lt;/td>
    &lt;td>&lt;select name="size"> 
	&lt;option value="0">DIVCSS5&lt;/option> 
	&lt;option value="1">DI&lt;/option> 
	&lt;/select> 
    &lt;/td>
    &lt;td>
	&lt;input name="version" type="radio" value="1" />ver1
	&lt;input name="version" type="radio" value="2" />ver2  
	&lt;input name="version" type="radio" value="3" />ver3 
	&lt;input name="version" type="radio" value="4" />ver4
    &lt;/td>
    &lt;td>&lt;input name="operate">&lt;/td>
     &lt;td>&lt;input name="file">&lt;/td>
   &lt;/tr>
  &lt;/sot:tbodyV2>
&lt;/sot:tableV2>


<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> id  指定动态表格id，必填属性，动态表格控件变量名称为 "表格ID_" + "_ctrl"，绑定事件都需要使用控件的变量名称。
     如：表格ID为table1，那么控件变量名称为table1_ctrl。 <br></span>
<span style="color:red;"> name  指定动态表格name属性。 <br></span>
<span style="color:red;"> cssstyle  设置动态表格的样式style <br></span>
<span style="color:red;"> cssclass  设置动态表格的样式class <br></span>
使用:
&lt;sot:tableV2 id="table1" cssclass="test" cssstyle="width:50%;height:60px;"><br>
<span style="color:red;"> autoid  是否自动递增ID属性，属性值包括：enabled、disabled，默认为disabled。当控件的ID属性为“字母开头+下划线+数字”格式的时候，控件会自动为控件递增ID。
     如： &lt;input type="hidden" id="item_1" /><br></span>
<span style="color:red;"> autoedit  动态自动编辑状态，属性值包括：enabled、disabled，认为disabled。 <br></span>
<span style="color:red;"> autoupd  自动更新表格数据，属性值包括：enabled、disabled，默认为enabled。 <br></span>
<span style="color:red;"> savefmt  保存行数据的格式，属性值包括：xml、json，默认为xml。当数据格式为xml，可以对行数据字段进行检索，但保存数据的速度较慢；而数据格式为json，不能对行数据字段进行检索，但保存数据的速度较快。 <br></span>
<span style="font-weight:bold; font-size:14px">表格事件:</span><br/>
<span style="color:red;">新建行事件： onAddRow(evt, newRow, rowData, rowgrpId, tableId, dataObj)<br></span>
<div>使用：$(table1_ctrl).bind("onAddRow", function(evt, newRow, rowData, rowgrpId, tableId, dataObj) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>
<div>newRow：新添加的行对象，通过jquery可以控制对象中的控件。</div>
<div>rowData：行数据对象，这个对象属性是只读的。</div>
<div>rowgrpId：新增行的行组ID</div>
<div>tableId：表格ID</div>
<div>dataObj：自定义数据，这个数据对象是在调用addRow方法的时候传过来的。</div>

<span style="color:red;">插入行事件： onInsertRow(evt, newRow, rowData, newRowgrpId, tableId, dataObj)<br></span>
<div>使用：$(table1_ctrl).bind("onInsertRow", function(evt, newRow, rowData, newRowgrpId, tableId, dataObj) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>
<div>newRow：新插入的行对象，通过jquery可以控制对象中的控件。</div>
<div>rowData：行数据对象，这个对象属性是只读的。</div>
<div>newRowgrpId：新增行的行组ID</div>
<div>dataObj：自定义数据，这个数据对象是在调用insertRow方法的时候传过来的。</div>
<div>tableId：表格ID</div>
<div>dataObj：自定义数据，这个数据对象是在调用insertRow方法的时候传过来的。</div>

<span style="color:red;">删除行事件： onRemoveRow(evt)<br></span>
<div>使用：$(table1_ctrl).bind("onRemoveRow", function(evt) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>

<span style="color:red;">删除所有行事件： onRemoveAllRow(evt)<br></span>
<div>使用：$(table1_ctrl).bind("onRemoveAllRow", function(evt) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>

<span style="color:red;">更新行事件： onUpdateRow(evt, row, rowData)<br></span>
<div>使用：$(table1_ctrl).bind("onUpdateRow", function(evt, row, rowData) {});</div>
<div>参数说明:</div>
<div>evt：事件传递参数</div>
<div>row：更新行的对象</div>
<div>rowData：更新行的数据</div>

<div style="font-weight:bold; font-size:14px">表格方法:</div>
<span style="color:red;">添加行： addRow(dataObj)<br></span>
<div>返回值：新增的行对象</div>
<div>使用：var row=table1_ctrl.addRow(dataObj);</div>
<div>参数说明:</div>
<div>dataObj：自定义数据对象，会传递给onAddRow事件中</div>

<span style="color:red;">插入行： insertRow(rowgrpId, dataObj)<br></span>
<div>返回值：新插入的行对象</div>
<div>使用：var row=table1_ctrl.insertRow("rowgrp_1", dataObj);</div>
<div>参数说明:</div>
<div>rowgrpId：行组ID</div>
<div>dataObj：自定义数据对象，会传递给onInsertRow事件中</div>

<span style="color:red;">删除行： removeRow(rowgrpId)<br></span>
<div>使用：table1_ctrl.removeRow("rowgrp_1");</div>
<div>参数说明:</div>
<div>rowgrpId：行组ID</div>

<span style="color:red;">删除所有行： removeAllRow()<br></span>
<div>使用：table1_ctrl.removeAllRow();</div>

<span style="color:red;">获取表格对象数据： getData()<br></span>
<div>返回值：JSON格式字符串</div>
<div>使用：table1_ctrl.getData();</div>

<span style="color:red;">获取表格对象数据： getDataObj()<br></span>
<div>返回值：JSON对象</div>
<div>使用：table1_ctrl.getDataObj();</div>

<span style="color:red;">设置表格数据源： setData(data)<br></span>
<div>使用：table1_ctrl.setData(data);</div>

<span style="color:red;">更新行数据： updateRow(rowgrpId)<br></span>
<div>使用：table1_ctrl.updateRow("rowgrp_1");</div>
<div>参数说明:</div>
<div>index：行组ID</div>

<span style="color:red;">指定行转换为编辑模式： editRow(rowgrpId)<br></span>
<div>使用：table1_ctrl.editRow("rowgrp_1");</div>
<div>参数说明:</div>
<div>rowgrpId：行组ID</div>

<span style="color:red;">设置行数据： setRowData(row, data)<br></span>
<span>使用说明：setRowData和updateRow的用途是不一样的，updateRow主要是用户在界面上更新了数据后，由控件自动调用方法去更新行数据；而setRowData是指定某一行，然后把自定义数据传进去，使用这个方法的时候一定要注意数据结构要和行数据源保持一致。</span>
<div>
使用：var row=table1_ctrl.addRow();
table1_ctrl.setRowData(row, data);
</div>
<div>参数说明:</div>
<div>row：行对象</div>
<div>data：自定义行数据</div>

<span style="color:red;">表格数据排序： sortData(field, fieldType, order)<br></span>
<span>使用说明：按指定字段对表格的数据进行排序。</span>
<div>
使用：table1_ctrl.sortData("size", "int", "desc");
</div>
<div>参数说明:</div>
<div>field：排序字段名称，必须是表格数据源中的字段。</div>
<div>fieldType：数据的类型，只支持字符串(string)和数字(int)两种类型。</div>
<div>order：排列顺序，顺序(asc)或者倒序(desc)。</div>
<div>提示：如果排序字段的类型不在支持的范围内，需要对数据进行转换，例如字段类型是日期类型的数据，要将日期转换为时间戳。示例代码：<br/>
  $("#btnorder3").click(function() {
      var ds=table1_ctrl.getDataObj();
      //给表格数据源添加临时排序列——日期时间戳
      for (var i=0; i&lt;ds.length; i++) {
        var date1=ds[i].date1;
        date1=new Date(Date.parse(date1.replace(/-/g, "/"))); 
        ds[i].date1_ts=date1.getTime();
      }
      table1_ctrl.sortData("date1_ts", "int", "desc");
      //删除临时排序列
      ds=table1_ctrl.getDataObj();
      for (var i=0; i&lt;ds.length; i++) {
        delete ds[i].date1_ts;
      }
    });
</div>

<span style="color:red;">更新所有行数据： updateAllRow()<br></span>
<div>使用：table1_ctrl.updateAllRow();</div>

</code></pre>
</div>

	
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">全局子表单 <span class="anchor-target" id="getting-started"></span>
<a name="25F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less">
&lt;sot:shareSubForm formname="sub1"/><br/>
<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> formname 共享子表单名称 <br></span>
</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">列表框<span class="anchor-target" id="getting-started"></span>
<a name="26F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:list id="textarea" name="textfield">&lt;/sot:list><br>
属性介绍:<br>
<span style="color:red;"> id 指列表框id <br></span>
<span style="color:red;">cssstyle 指写内部css样式</span>
<span style="color:red;">csssclass 指写cass class样式</span>
<span style="color:red;">name 指列表框name</span>
<span style="color:red;">size 指列表框的大小</span>

 <span style="color:red;"> staticvalue 指列表框数据填充静态常量值</span>
使用:
&lt;sot:list  staticvalue="1|2,3|4" >&lt;/sot:list><br>

<span style="color:red;"> data 指列表框数据填充sql语句</span>
使用:
&lt;sot:list  data="select item_name text ,item_id id from FMW_MENU_ITEM " >&lt;/sot:list><br>
<span style="color:red;"> 列表框会生成一个input隐藏域 控件的name+"_value" 列表框选中的值需填写入这个隐藏域</span>
<br><br>

</code></pre>
</div>


<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">千分位金额控件<span class="anchor-target" id="getting-started"></span>
<a name="27F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:currency id="currency" name="currency">&lt;/sot:currency><br>
属性介绍:<br>

<span style="color:red;">数值千分位显示</span>
使用:
在文本框中输入数值，自动转化为千分位<br>

<span style="color:red;">数值转化为千分位方法调用</span>
使用:
//通过方法，传入数值，返回处理后的千分位值
  function format(num){
	var test = new smartforms.formctrl.CurrencyTag();
	var formatterNum = test.formatAmount(num);
	return formatterNum ;
  }<br>
  
<span style="color:red;">千分位化为数值转方法调用</span>
使用:
//通过方法，传入千分位值，返回处理后的数值
  function format(num){
	var test = new smartforms.formctrl.CurrencyTag();
	var formatterNum = test.recoverAmount(num);
	return formatterNum ;
  }<br>

<span style="color:red;"> id 指文本框id <br></span>
使用:
&lt;sot:currency id="currency" >&lt;/sot:currency><br>
生成html样式:
&lt;input id="currency"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:currency cssclass="test" >&lt;/sot:currency><br>
生成html样式:
&lt;input calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:currency cssstyle="width:100%" >&lt;/sot:currency><br>
生成html样式:
&lt;input style="width:100%"/><br><br>

<span style="color:red;">disabled 指文本框是否只读</span>
使用:
&lt;sot:currency disabled="disabled" >&lt;/sot:currency><br>
生成html样式:
&lt;input disabled="disabled"/><br><br>

<span style="color:red;">name 指文本框的name值</span>
使用:
&lt;sot:currency name="text" >&lt;/sot:currency><br>
生成html样式:
&lt;input name="text"/><br><br>

<span style="color:red;">value 指文本框默认值</span>
使用:
&lt;sot:currency value="text" >&lt;/sot:currency><br>
生成html样式:
&lt;input value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 文本框显示文本，false 显示文本框</span>
使用:
&lt;sot:currency readonly="com.solartech.Test" >&lt;/sot:currency><br>
生成html样式:
false:
&lt;input value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:currency onclick="test();" >&lt;/sot:currency><br>
生成html样式:
&lt;input onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:currency onmouseout="test();" >&lt;/sot:currency><br>
生成html样式:
&lt;input onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:currency onchange="test();" >&lt;/sot:currency><br>
生成html样式:
&lt;input onchange="test();"/><br><br>

<span style="color:red;"> hidden 指定是否隐藏域</span>
使用:
&lt;sot:currency hidden="true" >&lt;/sot:currency><br>
生成html样式:
&lt;input type="hidden"/><br><br>

<span style="color:red;"> require 指定是否必填</span>
使用:
&lt;sot:currency require="true" >&lt;/sot:currency><br><br>

<span style="color:red;"> minlength 指允许输入最小长度</span>
使用:
&lt;sot:currency minlength="5" >&lt;/sot:currency><br><br>


<span style="color:red;"> maxlength 指允许输入最大长度</span>
使用:
&lt;sot:currency maxlength="16" >&lt;/sot:currency><br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:currency readstyle="color:red" >&lt;/sot:currency><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:currency readclass="t" >&lt;/sot:currency><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">escape  指定只读模式下文本内容是否编码，默认为false（不编码）</span>
使用:
&lt;sot:currency escape="true" >&lt;/sot:currency><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:currency htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:currency><br>

</div>


<!--  动态表格视图V2-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading" style="color:black">动态表格视图V2<span class="anchor-target" id="getting-started"></span>
<a name="28F">&nbsp;</a> 
</h1>
</div>
<p style="color:black">
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:tableViewV2 id="tableView1" documentId="${docUid}" tableId="table1" orderColumn="size"&gt;
  &lt;sot:theadViewV2&gt;
    &lt;tr&gt;
	&lt;th&gt;文件名&lt;/th&gt;
	&lt;th&gt;类型&lt;/th&gt;
	&lt;th&gt;文件大小&lt;/th&gt;
	&lt;th&gt;版本&lt;/th&gt;
	&lt;th&gt;操作&lt;/th&gt;
   &lt;/tr&gt;
  &lt;/sot:theadViewV2&gt;
  &lt;sot:tbodyViewV2&gt;
    &lt;tr&gt;
     &lt;td rowspan="2"&gt;{{:selme}}&lt;/td&gt;
    &lt;td&gt;{{:Fruit}}&lt;/td&gt;
    &lt;td&gt;{{:size}}&lt;/td&gt;
    &lt;td&gt;{{:version}} &lt;/td&gt;
    &lt;td&gt;&nbsp;&lt;/td&gt;
   &lt;/tr&gt;
   &lt;tr&gt;
     &lt;td&gt;文本：{{:text_1}}&lt;/td&gt;
     &lt;td&gt;&nbsp;&lt;/td&gt;
     &lt;td&gt;创建日期：{{:date1}}&lt;/td&gt;
     &lt;td&gt;{{:descr}}&lt;/td&gt;
   &lt;/tr&gt;
  &lt;/sot:tbodyViewV2&gt;
&lt;/sot:tableViewV2&gt;

<span style="font-weight:bold; font-size:14px">属性介绍:</span><br/>
<span style="color:red;"> id  指定表格视图id，必填属性，动态表格控件变量名称为 "tv2_" + "表格ID"。
     如：表格ID为tableView1，那么控件变量名称为tv2_tableView1。 <br></span>
<span style="color:red;"> name  指定表格视图name属性。 <br></span>
<span style="color:red;"> cssstyle  设置动态表格的样式style <br></span>
<span style="color:red;"> cssclass  设置动态表格的样式class <br></span>
使用:
&lt;sot:tableViewV2 id="tableView1" cssclass="test" cssstyle="width:50%;height:60px;"&gt;<br/>
<span style="color:red;"> tableId  视图绑定的表格ID。 <br></span>
<span style="color:red;"> documentId  视图绑定的文档ID。 <br></span>
<span style="color:red;"> orderColumn  需要进行排序的字段名称。 <br></span>
<span style="color:red;"> orderType  排序类型，asc或者desc，默认asc。 <br></span>

</code></pre>
</div>




<!--单行文本加密控件  -->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">单行加密文本框<span class="anchor-target" id="getting-started"></span>
<a name="29F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:encrypttextfield id="textarea" name="textfield">&lt;/sot:encrypttextfield><br>
属性介绍:<br>
<span style="color:red;"> id 指文本框id <br></span>
使用:
&lt;sot:encrypttextfield id="textarea" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input id="textarea"/><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:encrypttextfield cssclass="test" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input calss="test"/><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:encrypttextfield cssstyle="width:100%" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input style="width:100%"/><br><br>

<span style="color:red;">disabled 指文本框是否只读</span>
使用:
&lt;sot:encrypttextfield disabled="disabled" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input disabled="disabled"/><br><br>

<span style="color:red;">name 指文本框的name值</span>
使用:
&lt;sot:encrypttextfield name="text" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input name="text"/><br><br>

<span style="color:red;">value 指文本框默认值</span>
使用:
&lt;sot:encrypttextfield value="text" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input value="text"/><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 文本框显示文本，false 显示文本框</span>
使用:
&lt;sot:encrypttextfield readonly="com.solartech.Test" >&lt;/sot:encrypttextfield><br>
生成html样式:
false:
&lt;input value="text"/><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:encrypttextfield onclick="test();" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input onclick="test();"/><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:encrypttextfield onmouseout="test();" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input onmouseout="test();"/><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:encrypttextfield onchange="test();" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input onchange="test();"/><br><br>

<span style="color:red;"> hidden 指定是否隐藏域</span>
使用:
&lt;sot:encrypttextfield hidden="true" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;input type="hidden"/><br><br>

<span style="color:red;"> require 指定是否必填</span>
使用:
&lt;sot:encrypttextfield require="true" >&lt;/sot:encrypttextfield><br><br>

<span style="color:red;"> minlength 指允许输入最小长度</span>
使用:
&lt;sot:encrypttextfield minlength="5" >&lt;/sot:encrypttextfield><br><br>


<span style="color:red;"> maxlength 指允许输入最大长度</span>
使用:
&lt;sot:encrypttextfield maxlength="16" >&lt;/sot:encrypttextfield><br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:encrypttextfield readstyle="color:red" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:encrypttextfield readclass="t" >&lt;/sot:encrypttextfield><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">escape  指定只读模式下文本内容是否编码，默认为false（不编码）</span>
使用:
&lt;sot:encrypttextfield escape="true" >&lt;/sot:encrypttextfield><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:encrypttextfield htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:encrypttextfield><br>

<span style="color:red;">editrole  具备文本编辑者权限的角色唯一编码字符串</span>
使用:
&lt;sot:encrypttextfield editrole="字段管理员,系统管理员" >&lt;/sot:encrypttextfield><br>

<span style="color:red;">readrole  具备文本阅读者权限的角色唯一编码字符串，若无阅读权限则返回加密*</span>
使用:
&lt;sot:encrypttextfield readrole="字段管理员,系统管理员" >&lt;/sot:encrypttextfield><br>

<span style="color:red;">controlclass  传入类名，默认执行execute方法 </span>
使用:
&lt;sot:encrypttextfield controlclass="com.solartech.Test" >&lt;/sot:encrypttextfield><br>

<span style="color:red;">decrypt  传入类名，执行解码方法 </span>
使用:
&lt;sot:encrypttextfield decrypt="com.solartech.Test" >&lt;/sot:encrypttextfield><br>

<span style="color:red;">encrypt  传入类名，执行加密方法 </span>
使用:
&lt;sot:encrypttextfield encrypt="com.solartech.Test" >&lt;/sot:encrypttextfield><br>

</code></pre>
</div>

<!-- 多行加密文本框 ===========================================================================-->
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">多行加密文本框 <span class="anchor-target" id="getting-started"></span>
<a name="30F">&nbsp;</a> 
</h1>
</div>
<p>
使用demo:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
&lt;sot:encrypttextarea id="textarea" name="textfield">&lt;/sot:encrypttextarea><br>
属性介绍:<br>
<span style="color:red;"> id 指多行文本框id <br></span>
使用:
&lt;sot:encrypttextarea id="textarea" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea id="textarea">&lt;/encrypttextareaid><br><br>
<span style="color:red;">  cssclass指css class样式类</span>
使用:
&lt;sot:encrypttextarea cssclass="test" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea calss="test">&lt;/encrypttextareaid><br><br>
<span style="color:red;">cssstyle 指写内部css样式</span>
使用:
&lt;sot:encrypttextarea cssstyle="width:100%" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea style="width:100%">&lt;/textareaid><br><br>

<span style="color:red;">disabled 指多行文本框是否只读</span>
使用:
&lt;sot:encrypttextarea disabled="disabled" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea disabled="disabled">&lt;/encrypttextarea><br><br>

<span style="color:red;">name 指多行文本框的name值</span>
使用:
&lt;sot:encrypttextarea name="text" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea name="text">&lt;/encrypttextarea><br><br>

<span style="color:red;">value 指多行文本框默认值</span>
使用:
&lt;sot:encrypttextarea value="text" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea >text&lt;/encrypttextarea><br><br>

<span style="color:red;">readonly 传入类名，默认执行execute方法 返回true 多行文本框显示文本，false 显示多行文本框</span>
使用:
&lt;sot:encrypttextarea readonly="com.solartech.Test" >&lt;/sot:encrypttextarea><br>
生成html样式:
false:
&lt;encrypttextarea >&lt;/encrypttextarea><br><br>
true:
&lt;span>text&lt;/span>


<span style="color:red;">onclick 指点击事件</span>
使用:
&lt;sot:encrypttextarea onclick="test();" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea onclick="test();">&lt;/encrypttextarea><br><br>

<span style="color:red;">onmouseout 指鼠标离开事件</span>
使用:
&lt;sot:encrypttextarea onmouseout="test();" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea onmouseout="test();">&lt;/encrypttextarea><br><br>

<span style="color:red;"> onchange 指 onchange事件</span>
使用:
&lt;sot:encrypttextarea onchange="test();" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;encrypttextarea onchange="test();">&lt;/encrypttextarea><br><br>
<span style="color:red;"> require 指定是否必填</span>
使用:
&lt;sot:encrypttextarea require="true" >&lt;/sot:encrypttextarea><br><br>

<span style="color:red;"> minlength 指允许输入最小长度</span>
使用:
&lt;sot:encrypttextarea minlength="5" >&lt;/sot:encrypttextarea><br><br>

<span style="color:red;"> maxlength 指允许输入最大长度</span>
使用:
&lt;sot:encrypttextarea maxlength="16" >&lt;/sot:encrypttextarea><br><br>

<span style="color:red;">readstyle  只读模式的css内部样式</span>
使用:
&lt;sot:encrypttextarea readstyle="color:red" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;span style="color:red">text&lt;/span><br>

<span style="color:red;">readclass  只读模式的css 类样式</span>
使用:
&lt;sot:encrypttextarea readclass="t" >&lt;/sot:encrypttextarea><br>
生成html样式:
&lt;span class="t">text&lt;/span><br>

<span style="color:red;">escape  指定只读模式下文本内容是否编码，默认为false（不编码）</span>
使用:
&lt;sot:encrypttextarea escape="true" >&lt;/sot:encrypttextarea><br>

<span style="color:red;">htmlattrs  html扩展属性</span>
使用:
&lt;sot:encrypttextarea htmlattrs="readonly='readonly' title='abc'" >&lt;/sot:encrypttextarea><br>

<span style="color:red;">editrole  具备文本编辑者权限的角色唯一编码字符串</span>
使用:
&lt;sot:encrypttextarea editrole="字段管理员,系统管理员" >&lt;/sot:encrypttextarea><br>

<span style="color:red;">readrole  具备文本阅读者权限的角色唯一编码字符串，若无阅读权限则返回加密*</span>
使用:
&lt;sot:encrypttextarea readrole="字段管理员,系统管理员" >&lt;/sot:encrypttextarea><br>

<span style="color:red;">controlclass  传入类名，默认执行execute方法 </span>
使用:
&lt;sot:encrypttextarea controlclass="com.solartech.Test" >&lt;/sot:encrypttextarea><br>

<span style="color:red;">decrypt  传入类名，执行解码方法 </span>
使用:
&lt;sot:encrypttextarea decrypt="com.solartech.Test" >&lt;/sot:encrypttextarea><br>

<span style="color:red;">encrypt  传入类名，执行加密方法 </span>
使用:
&lt;sot:encrypttextarea encrypt="com.solartech.Test" >&lt;/sot:encrypttextarea><br>

</code></pre>
</div>

</div>
</body></html>