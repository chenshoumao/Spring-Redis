<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String roleId =  (String)session.getAttribute("USER_GROUP_ID");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
	<div id="def_content-left" class="content-left">
<!-- 		<ul> -->
<!-- 			<li class=".TitalNav"><h3> -->
<!-- 					功能菜单 -->
<!-- 					<div class="arrow"></div> -->
<!-- 				</h3> -->
			
				<ul id="leftMenuId">
                   <li class="current" id="weizhi1" value="<%=basePath%>home/chart.action"><a href="javascript:void(0)">图表分析1</a><span>&gt;</span></li>
                   <!-- 
                   <div class="box" style="border-color: transparent transparent transparent #eb5606;"></div>-->
                   
                   <li><a href="javascript:void(0)" style="color: #333;">站场汇总</a><span>&gt;</span></li>
                   <li><a href="javascript:void(0)" style="color: #333;">站场明细</a><span>&gt;</span></li>
                   <li><a href="javascript:void(0)" style="color: #333;">动态分析</a><span>&gt;</span></li>
                   </ul>
				</li>
<!-- 		</ul> -->
	</div>    
<script type="text/javascript">
	function onClickItem(obj2,url,name, item, roleid, flag){
		//document.getElementById("de_freme_iframe").src=url;
		if('f' == flag){
			$("#topTipDetail").html(name);
		}
		$("#weizhi3").html(url);
// 		$('#leftMenuId li').removeClass('current');
		if('f' == flag){
			$('#leftMenuId li').find('ul').slideUp(200);
			$(".threeMenu").hide();
		}else{
			$(".threeMenu").show();
			$("#topChildName").html(name);
		}
// 		$(obj2).parent().find('ul').slideUp(200);
// 		$(obj2).parent()siblings("li").removeClass('current');
// 		$(obj2).parent().find('ul').slideDown(200).parent('li').siblings('li').find('ul').slideUp(200);

		$(obj2).parent().addClass('current').siblings('li').removeClass('current');
		
		if($(obj2).parent().hasClass('Parent')){
			$(obj2).parent().addClass('ParentSelect').siblings('li').removeClass('ParentSelect');
		}
		else{
			$(obj2).parent().siblings('li').removeClass('ParentSelect');
		}
			
		
		$.ajax({
			async:true,
	        type: "post",
	        url: "<%=basePath%>contract/getMenuItem.action?belong="+item,
	        data: {roleId:roleid},
	        success: function(data){
            	var result=data.datas;
            	
            	var leftHtml="<ul>";
	        	for(var i=0;i<result.length;i++){

					// 连二运测试
					var obj=result[i];										
					
					var url="<%=basePath %>"+obj.ITEM_URL+"";
					var selectUrl="onClickItem(this,\""+url+"\",\""+obj.ITEM_NAME+"\",\"" + obj.ITEM_ID + "\",\"" + roleid + "\",\"c\")";
					if(i==0){
						var lurl=url;
						leftHtml=leftHtml+"<li class='current'>"+
// 						"<p id='weizhi2' style='display: none;'>"+lurl+"</p>"+
// 						"<p id='weizhi3' style='display: none;'></p>"+
						"<a href='javascript:void(0)' onclick='"+selectUrl+"' >"
						+obj.ITEM_NAME+"</a></li>";
						if(obj.ITE_MURL != null){
							//document.getElementById("de_freme_iframe").src="<%=basePath %>"+obj.ITEM_URL;
						}
// 						$("#topTipDetail").html(obj.ITEMNAME);
						$(".threeMenu").show();
						$("#topChildName").html(obj.ITEM_NAME);
						
					}else{
						leftHtml=leftHtml+"<li >"+
							"<a href='javascript:void(0)' style='color: #333;' onclick='"+selectUrl+"' >"+
									obj.ITEM_NAME+"</a></li>";
					}
	        	}
	        	
	        	$(obj2).parent().children('ul').remove(); 
	        	$(obj2).parent().html($(obj2).parent().html() + leftHtml + "</ul>");
	    	}
	    });
	}
	
  	function getMenuItem(item,topName,roleid,obj, arePage){  		
  		$('#top_menu_u li').removeClass('current01');
   		$(obj).parent().addClass('current01');
   
//    		huantu(topName,obj);
   
  		$("#topTipTopName").html(topName);
  		//$("#topTipTopName").prev().id=item;
  		$("#leftMenuId").html("");
  		
  		$(".threeMenu").hide();
  		
  		$.ajax({
			async:true,
	        type: "post",
	        url: "<%=basePath%>contract/getMenuItem.action?belong="+item,
	        data: {roleId:roleid},
	        success: function(data){
            	var result=data.datas;
            	var leftHtml="<li class='TitalNav '><a href='javascript:void(0)'>功能菜单</a></li>";
	        	for(var i=0;i<result.length;i++){

					// 连二运测试
					var obj=result[i];										
										
					var url="<%=basePath %>"+obj.ITEM_URL+"";
					var selectUrl="onClickItem(this,\""+url+"\",\""+obj.ITEM_NAME+"\",\"" + obj.ITEM_ID + "\",\"" + roleid + "\",\"f\")";
					
					var menuType = "";						
					if('e' == obj.MENU_TYPE){
						menuType = "Parent";
					}
					
					if(i==0){
						
						if("" != menuType){
							menuType += " ParentSelect";
						}
						
						var lurl=url;
						
						if('e' == arePage){
							leftHtml="<li class='TitalNav current'><a href='javascript:void(0)' onclick='"+selectUrl+"'>"+obj.ITEM_NAME+"</a></li>";
						}else{												
							leftHtml=leftHtml+"<li class='current " + menuType + "' id='weizhi1' value='"+lurl+"'>"+
							"<p id='weizhi2' style='display: none;'>"+lurl+"</p>"+
							"<p id='weizhi3' style='display: none;'></p>"+
							"<a href='javascript:void(0)' onclick='"+selectUrl+"' style=\"background:url('<%=basePath %>" + obj.ITEM_ICON + "') no-repeat 15px 0px\">"
							+obj.ITEM_NAME+"</a></li>";
						}
						
						
						
						if(obj.ITEM_URL != null){
							//document.getElementById("de_freme_iframe").src="<%=basePath %>"+obj.ITEM_URL;
						}
						$("#topTipDetail").html(obj.ITEM_NAME);
					}else{
						leftHtml=leftHtml+"<li class=" + menuType + ">"+
							"<a href='javascript:void(0)' style='color: #333;background:url(\"<%=basePath %>" + obj.ITEM_ICON + "\") no-repeat 15px 0px' onclick='"+selectUrl+"' >"+
									obj.ITEM_NAME+"</a></li>";
					}
	        	}
	        	
// 				leftHtml=leftHtml+"<li >"+"<a href='javascript:void(0)' style='color: #333;' onclick='"+"onClickItem(this,\""+""+"\",\""+"仓储部"+"\",\"113\",\"" + roleid + "\",\"f\")"+"' >"+"仓储部"+"</a></li>";
// 				leftHtml=leftHtml+"<li >"+"<a href='javascript:void(0)' style='color: #333;' onclick='"+"onClickItem(this,\""+""+"\",\""+"商超部"+"\",\"114\",\"" + roleid + "\",\"f\")"+"' >"+"商超部"+"</a></li>";
		        		        		        		        
	        	$("#leftMenuId").html(leftHtml);
	    	}
	    });
  	}
    
	function initMenu(item,topName){
  		var roleId = '<%=roleId%>';
  		$("#topTipTopName").html(topName);
  		$("#leftMenuId").html("");
   		$.ajax({
			async:true,
	        type: "post",
	        url: "<%=basePath%>contract/getMenuItem.action?belong="+item,
	        data: {roleId:roleId},
	        success: function(data){
	            var result=data.datas;
	            var leftHtml="<li class='TitalNav '><a href='javascript:void(0)'>功能菜单</a></li>";
		        for(var i=0;i<result.length;i++){
		        	var obj=result[i];
		        	var url="<%=basePath %>"+obj.ITEM_URL+"";
// 		        	var selectUrl="onClickItem(this,\""+url+"\",\""+obj.ITEMNAME+"\")";
					var selectUrl="onClickItem(this,\""+url+"\",\""+obj.ITEM_NAME+"\",\"" + obj.ITEM_ID + "\",\"" + roleId + "\",\"f\")";
					
					var menuType = "";						
					if('e' == obj.MENU_TYPE){
						menuType = "Parent";
					}
					
		        	if(i==0){
		        		
		        		if("" != menuType){
							menuType += " ParentSelect";
						}
		        		
		        		var lurl=url;
		        			leftHtml=leftHtml+"<li class='current " + menuType + "' id='weizhi1' value='"+lurl+"'>"+
		        			"<p id='weizhi2' style='display: none;'>"+lurl+"</p>"+
		        			"<p id='weizhi3' style='display: none;'></p>"+
							"<a href='javascript:void(0)' onclick='"+selectUrl+"'  style=\"background:url('<%=basePath %>" + obj.ITEM_ICON + "') no-repeat 15px 0px\">"
						+obj.ITEM_NAME+"</a></li>";
		        	//document.getElementById("de_freme_iframe").src="<%=basePath %>"+obj.ITEM_URL;
		        $("#topTipDetail").html(obj.ITEM_NAME);
		        	}else{
		        		leftHtml=leftHtml+"<li class=" + menuType + ">"+
							"<a href='javascript:void(0)' style='color: #333;background:url(\"<%=basePath %>" + obj.ITEM_ICON + "\") no-repeat 15px 0px' onclick='"+selectUrl+"' >"+
									obj.ITEM_NAME+"</a></li>";
		        	}
		        	
		        }
		        $("#leftMenuId").html(leftHtml);
	        }
	    });
	}
	
	$(function(){
		initMenu('1','主页'); 
	});
</script>		