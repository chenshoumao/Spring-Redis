<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<%
String path1 = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
  
    <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/Uploadify/uploadify.css">
   <script type="text/javascript" src="<%=basePath%>scripts/js/jquery-1.8.3.min.js"></script>  
      <script type="text/javascript" src="<%=basePath%>styles/Uploadify/jquery.uploadify.js"></script>
   
 <script type="text/javascript">
 	$(function(){
 		 $('#file_upload').uploadify({  
 			  method         : 'get',
             'debug'         : false,  
             'auto'          : false,             //是否自动上传,  
             'buttonClass'   : 'haha',           //按钮辅助class  
             'buttonText'    : '上传图片',       //按钮文字  
             'height'        : 30,               //按钮高度  
             'width'         : 100,              //按钮宽度  
             
             'fileObjName'   : 'filedata',           //默认 Filedata, $_FILES控件名称  
             'fileSizeLimit' : '10024KB',          //文件大小限制 0为无限制 默认KB  
             'fileTypeDesc'  : 'All Files',       //图片选择描述  
          //   'fileTypeExts'  : '*.gif; *.jpg; *.png',//文件后缀限制 默认：'*.*'  
         //    'formData'      : {'someKey' : 'someValue', 'someOtherKey' : 1},//传输数据JSON格式  
             //'overrideEvents': ['onUploadProgress'],  // The progress will not be updated  
             //'progressData' : 'speed',             //默认percentage 进度显示方式  
             'queueID'       : 'queue',              //默认队列ID  
             'queueSizeLimit': 20,                   //一个队列上传文件数限制  
             'removeCompleted' : true,               //完成时是否清除队列 默认true  
             'removeTimeout'   : 3,                  //完成时清除队列显示秒数,默认3秒  
             'requeueErrors'   : false,              //队列上传出错，是否继续回滚队列  
             'successTimeout'  : 5,                  //上传超时  
             'uploadLimit'     : 99,                 //允许上传的最多张数  
             'swf'  : '<%=basePath%>styles/Uploadify/uploadify.swf',
             'uploader': 'http://localhost:8080/menusystem/UploadVersion',//服务器端脚本
              onUploadStart  :function(file){
              var obj={'someKey' : 'someValue', 'key' : $('#name').val()};
              $("#file_upload").uploadify("settings","formData",obj );  
            	 
             //	 this.addPostParam('someKey','123123');
            	 
             }

 	})
 	})
 	
 	function up(){  
 	//	$("#file_upload").uploadify("settings", "formData",{'form_inputfile1':'中文','someKey':'english','form_inputfile3':'123'});
 	$('#file_upload').uploadify('upload', '*');
    	}
 </script>
</head>
<body>
	 <div class="upload_pictures">
	 <input id="name">
         	<input type="file" name="uploadify" id="file_upload"> 
         	<div id="fileQueue"></div>
      	  	<p>
       	 		<input type="button" value="开始上传" onclick="up();" class="start_upload"/> 
        	</p>
       		 
         </div>
         
         <!--   <a href="javascript:$('#file_upload').uploadify('upload', '*');">开始上传</a>  -->
</body>
</html>