
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>

<div class="easyui-accordion" data-options="fit:true,border:false">
	<div>
		<ul id="ruleType" class="ztree"></ul>
		<div id="rule_type_dlg" class="easyui-dialog"
			style="width: 400px; height: 250px;" closed="true"
			buttons="#rule_type_dlg_buttons" modal="true">
			<div id="tabs" class="easyui-tabs" fit="true" border="false">
				<div title="类型配置">
					<form id="fm" method="post">
						<br>
						<div class="fitem">
						<input id="typeId" name="typeId" type="hidden">
						<input id="typeParentId" name="typeParentId" type="hidden">
							<label>名称:</label> <input class="easyui-textbox" required="true"
								name="typeName" id="typeName" />
						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="rule_type_dlg_buttons">
			<a id="rule_type_dlg_btnsave" href="javascript:void(0)"
				class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="createOrUpdateRuleType()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#rule_type_dlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
	</div>

	<div id="tabsMenu" class="easyui-menu" style="width: 120px;">
		<div id="createPage" onclick="createRuleType()">新建</div>
		<div onclick="deleteRuleType()">删除</div>
		<div onclick="updateRuleType()">更新</div>
	</div>
	<script type="text/javascript">
	/**
	删除规则类型
	*/
	function deleteRuleType(){
	 var treeObj=$.fn.zTree.getZTreeObj("ruleType");
      var nodes=treeObj.getCheckedNodes(true);
      if(nodes.length==1){
	    $.ajax({
        		url:"${pageContext.request.contextPath}/console/detRuleType/deletRuleType.action",
        		type:"post",
        		data:{"typeId":nodes[0].id},
        		dataType:"json",
        		success:function(result){
        			   if (result.state==false){
        	                $.messager.show({
        	                    title: '温馨提示',
        	                    msg: result.msg
        	                });
        	            } else {
        	               getDetRuleType();
        	            }
        			}
        		}); 
        		}else{
        		 $.messager.show({
        	                    title: '温馨提示',
        	                    msg: "请选择一个要删除的类型"
        	                });
        		}
			}
	
	/**
	创建或更新规则类型
	*/
	 function createOrUpdateRuleType(){
            var values=$("#fm").serialize();
            if($("#fm").form('validate')){
            $("#rule_type_dlg_btnsave").linkbutton("disable");
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/detRuleType/createOrUpdate.action",
        		type:"post",
        		data:values,
        		dataType:"json",
        		success:function(result){
        		$("#rule_type_dlg_btnsave").linkbutton("enable");
        			   if (result.state==false){
        	                $.messager.show({
        	                    title: '温馨提示',
        	                    msg: result.msg
        	                });
        	            } else {
        	               getDetRuleType();
        	               $('#rule_type_dlg').dialog('close'); 
        	            }
        		},
        		error:function(){
        		$("#rule_type_dlg_btnsave").linkbutton("enable");
        		}
        	}); 
            }
        }
	
	
	    /**
	     打开创建规则界面
	    */
		function createRuleType() {
			 var treeObj=$.fn.zTree.getZTreeObj("ruleType");
             var nodes=treeObj.getCheckedNodes(true);
              if(nodes.length==1){
              $('#rule_type_dlg').dialog('open').dialog('setTitle', ' ');
		     	$('#fm').form('clear');
                var pid=nodes[0].id;
                  $("#typeParentId").val(pid);
                 }else{
                 $.messager.show({
        	          title: '温馨提示',
        	         msg: '请选择一个分类目录'
        	      });
              }
		}
		
		/**
		打开更新规则类型界面
		*/
		function updateRuleType() {
			 var treeObj=$.fn.zTree.getZTreeObj("ruleType");
             var nodes=treeObj.getCheckedNodes(true);
              if(nodes.length==1){
              $('#rule_type_dlg').dialog('open').dialog('setTitle', ' ');
		     	$('#fm').form('clear');
                  $("#typeParentId").val(nodes[0].pid);
                   $("#typeId").val(nodes[0].id);
                    $("#typeName").textbox('setValue',nodes[0].name);
                 }else{
                 $.messager.show({
        	          title: '温馨提示',
        	         msg: '请选择一个分类目录'
        	      });
              }
		}
		
		//绑定鼠标右键事件
		function OnRightClick(e, treeId, treeNode) {
			e.preventDefault();
			$("#tabsMenu").menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}

		/**ztree的参数配置，setting主要是设置一些tree的属性，是本地数据源，还是远程，动画效果，是否含有复选框等等**/
		var _deptSetting = {
		  check: {
      				 enable: true,
					chkStyle: "radio",
					radioType: "all"
   			 },
			view : {
				//dblClickExpand: false,  
				expandSpeed : 300
				//设置树展开的动画速度，IE6下面没效果，  
			},
			data : {
				simpleData : { //简单的数据源，一般开发中都是从数据库里读取，API有介绍，这里只是本地的                           
					enable : true,
					idKey : "id", //id和pid，这里不用多说了吧，树的目录级别  
					pIdKey : "pid",
					rootPId : 0
				//根节点  
				}
			},
			callback : {
				onRightClick : OnRightClick,
				/**回调函数的设置，随便写了两个**/
				beforeClick : function() {
				},
				onClick : function(event, treeId, treeNode) {
				 var treeObj=$.fn.zTree.getZTreeObj("ruleType");
				 treeObj.checkNode(treeNode, true, true);
                 treeNode.checked = true; 
                 treeObj.updateNode(treeNode);
				 var id=treeNode.id;
				 if (id == "0") {
						document.getElementById("userIframeId").src = "${pageContext.request.contextPath}/console/detRuleDefinition/index/show.xsp";
				} else {
						document.getElementById("userIframeId").src = "${pageContext.request.contextPath}/console/detRuleDefinition/index/show.xsp?typeId="+ id;
				} 
				}
			}
		};

   /**
   获取所有的规则类型
   */
	function getDetRuleType(){
		$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/console/detRuleType/getDetRuleType.action',
					dataType : 'json',
					success : function(result) {
						if (result.state == true) {
								var ztrees = $.fn.zTree.init($("#ruleType"),
									_deptSetting, result.data);
								ztrees.expandAll(true);//全部展开  	
						}
					}
				});
	
	}
	getDetRuleType();
	
	
	</script>
</div>