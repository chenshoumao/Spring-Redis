<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <div >
    部门名称:<input type="text" id="deptName" />
    <input type="button" value="查询" onclick="getAlldeptsDataByName()">
    </div>
   <ul id="deptTrees" class="ztree"></ul>
<script>
    	//查找节点
    	var deptDatas=[];
     /**ztree的参数配置，setting主要是设置一些tree的属性，是本地数据源，还是远程，动画效果，是否含有复选框等等**/
		var deptTreeSetting = {
		  check: {
      				 enable: true,
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
				/**回调函数的设置，随便写了两个**/
				beforeClick : function() {
				},
				onClick : function(event, treeId, treeNode) {
				}
			}
		};
		
		
      function getAlldeptsData(name){
		$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/console/detRuleDefinition/getDepts.action',
					dataType : 'json',
					data:{'deptName':name,'ruleNum':$("#ruleNum_value").val()},
					success : function(result) {
						if (result.state == true) {
								var ztrees = $.fn.zTree.init($("#deptTrees"),
									deptTreeSetting, result.data);
								ztrees.expandAll(true);//全部展开  	
								deptDatas=result.data;
						}
					}
				});
	
	}
	

  
  	function getAlldeptsDataByName(){
	  var roleName=$("#deptName").val();
	  getAlldeptsData(roleName);
	}
	

</script>