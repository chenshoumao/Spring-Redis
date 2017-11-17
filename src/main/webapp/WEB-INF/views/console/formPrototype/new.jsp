<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap-responsive.min.css" rel="stylesheet">
  
 
  <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor/formdesign/formdesign.v4.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/beautify/beautify.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/beautify/beautify-css.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/beautify/beautify-html.js"></script>

<title>表单原型设计</title>
</head>
<style>
.navbar .brand{    text-shadow:none;color:#fff;}
.input[type="text"]{margin-bottom:0px;}
.form-horizontal .control-label{width: 25%;}
.form-horizontal .controls{margin-left: 26.5%;}
.nav-list > li > a {
    padding: 8px 15px;
}
</style>
<body style="background-color: #FBFBFB">
<div class="navbar  navbar-fixed-top"  style="background:#eb5606;">
        <div class="navbar-inner" style="background:#eb5606;">
            <div class="container-fluid" >
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="brand"  href="#" >表单原型设计器</a>
            </div>
        </div>
    </div>
<div class="container-fluid" >
    <form method="post" id="saveform" name="saveform" action="" style="margin-top:60px">
        <input type="hidden" id="prototypeId" value="${detFormPrototype.prototypeId}">
      <div class="alert form-horizontal">
            <div class="row-fluid">
                <div class="span4">
                    <label class="control-label" for="inputEmail">编码</label>
                    <div class="controls">
                        <input type="text" id="code" placeholder="编码" value="${detFormPrototype.code}">
                    </div>
                </div>
               <div class="span4">
                    <label class="control-label" for="inputEmail">名称</label>
                    <div class="controls">
                        <input type="text" id="name" placeholder="名称" value="${detFormPrototype.name}">
                    </div>
                </div>
                <div class="span4">
                    <label class="control-label" for="inputEmail">标题</label>
                    <div class="controls">
                        <input type="text" id="title" placeholder="标题" value="${detFormPrototype.title}">
                    </div>
                </div>
            </div>                
            </div>
        <div class="row-fluid">
            <div class="span2">
                <ul class="nav nav-list" style="border: 1px solid #CFCFCF;height:530px">
                    <li class="nav-header" style="line-height: 26px;font-size: 17px;background-color: white; text-align: center;">表单控件</li>
                    <li><a href="javascript:void(0);" onclick="formDesign.exec('text');" class="btn btn-link">文本框</a></li>
                    <li><a href="javascript:void(0);" onclick="formDesign.exec('textarea');" class="btn btn-link">多行文本</a></li>
                    <li><a href="javascript:void(0);" onclick="formDesign.exec('select');" class="btn btn-link">下拉菜单</a></li>
                    <li><a href="javascript:void(0);" onclick="formDesign.exec('radios');" class="btn btn-link">单选框</a></li>
                    <li><a href="javascript:void(0);" onclick="formDesign.exec('checkboxs');" class="btn btn-link">复选框</a></li>
                </ul>
            </div>

            <div class="span10">
                <script id="formEditor" type="text/plain" style="width:100%;">${detFormPrototype.content}</script>
            </div>
        </div><!--end row-->

    </form>
             <div class="form-horizontal">
            <div class="row-fluid" style="text-align:right">
            <button id="formPrototype">保存</button>
            </div>
            </div>
</div>
<!-- script start-->
<script type="text/javascript">
var formEditor = UE.getEditor('formEditor',{
    toolleipi:true,
    textarea: 'design_content',
    toolbars:[[
      'source', '|', 'undo', 'redo', '|','bold', 'italic', 'underline', 'fontborder', 'strikethrough',  'removeformat', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist','|', 'fontfamily', 'fontsize', '|', 'indent', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify',   '|',  'horizontal',  'spechars', '|', 'inserttable', 'deletetable',  'mergecells',  'splittocells']],
    wordCount:false,
    elementPathEnabled:false,
    initialFrameHeight:500
    ,iframeCssUrl:"${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css" 
});

var formDesign = {
    /*执行控件*/
    exec : function (method) {
    	formEditor.execCommand(method);
    }
    /* ,
    fnReview : function (){
        if(formEditor.queryCommandState( 'source' ))
            formEditor.execCommand('source');
        if(formEditor.hasContents()){
            formEditor.sync();       
            alert("你点击了预览,请自行处理....");
            return false;
        } else {
            alert('表单内容不能为空！');
            return false;
        }
    } */
};





$(function(){
 $("#formPrototype").click(function(){
   if(formEditor.queryCommandState( 'source' ))
            formEditor.execCommand('source');
        if(formEditor.hasContents()){
             formEditor.sync();
              var code=$("#code").val(),
              name=$("#name").val(),
              title=$("#title").val();
              if(code==""){
                 alert("表单编码不能为空");
              }else if(name==""){
                  alert("表单名称不能为空");
              }else if(title==""){
                  alert("表单标题不能为空");
              }else{
            //获取表单设计器里的内容
            var content=formEditor.getContent();
              var opts ={
					    "indent_size": 4,
					    "indent_char": " ",
					    "indent_with_tabs": false,
					    "eol": "\n",
					    "end_with_newline": false,
					    "indent_level": 0,
					    "preserve_newlines": true,
					    "max_preserve_newlines": 10,
					    "space_in_paren": false,
					    "space_in_empty_paren": false,
					    "jslint_happy": false,
					    "space_after_anon_function": false,
					    "brace_style": "collapse",
					    "break_chained_methods": false,
					    "keep_array_indentation": false,
					    "unescape_strings": false,
					    "wrap_line_length": 0,
					    "e4x": false,
					    "comma_first": false,
					    "operator_position": "before-newline"
             };

        content = html_beautify(content, opts);
            $.ajax({
                type: 'POST',
                url : '${pageContext.request.contextPath}/console/form/prototype/saveOrUpdate.action',
                dataType : 'json',
                data : {
                name:name,
                code:code,
                title:title,
                content:content,
                prototypeId:$("#prototypeId").val()
                },
                success : function(data){
					if(data.state == true) {
						alert('表单保存成功');
						try {
		 					window.opener.searchByName();
						} catch (e) {}
						var prototypeId=$("#prototypeId").val();
						if(prototypeId==""){
						  window.close();
						}
					} else {
						alert(data.msg);
					}
                }
            });
         }
        } else {
            alert('表单内容不能为空！');
        }
   });
});

</script>
<!-- script end -->
</body>
</html>
