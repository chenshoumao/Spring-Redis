<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="decorator" content="none" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="<%=basePath%>/styles/portal/contractType/resetout.css">
	<link rel="stylesheet" href="<%=basePath%>/styles/portal/contractType/publicout.css">
	<script type="text/javascript" src="<%=basePath%>/scripts/portal/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/scripts/portal/public.js"></script>
	
</head>
<style>
	/**tabs**/
	.tabPanel .tab11{height:30px;border-bottom:1px solid #aaa;}
	.tabPanel .tab11 li{
		float:left;margin:0 5px 0 0;border:1px solid #aaa;font-size:11px;height:29px;line-height:30px;width:111px;text-align:center;cursor:pointer;
		text-shadow:0 1px 0 #fff;
		border-radius:4px 4px 0 0;
		box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.5);
		background:#ddd;
		background:-moz-linear-gradient(top, #eee, #ddd);
		background:-webkit-gradient(linear, left top, left bottom, from(#eee), to(#ddd));
	}
	.tabPanel .tab11 .hit{
		border-bottom:1px solid #fff;cursor:pointer;color:#ff6600;font-weight: 600;text-shadow:0 1px 0 #fff;
		background:#fff;
		background:-webkit-gradient(linear, left top, left bottom, from(#e1e1e1), to(#fff));
		background:-moz-linear-gradient(top, #e1e1e1, #fff);
	}
	.pane{display:none;}
	.old{line-height: 40px;text-indent: 10px;border-top: 1px solid #eee;margin-top: 30px;}
	.tabo{width: 100%;margin-top: 25px;}
	.tabo tr{line-height: 42px;}
	.tabo tr td input{line-height: 32px;height:32px;width: 156px;text-indent: 10px;border: 1px solid #d6dbdf;text-indent: 10px;}
	.tabo tr td button{width: 100px;line-height:20px;background-color: #FC6621;color: #fff;border:none;border-radius: 3px;margin-left: 82px;}
	.dateBg {background: url(./images/calendar.png) #fff no-repeat 96% center;}
</style>
<body style="background: none;">
<div class="content-right-bottom">
			<div class="gray">
				<div class="tabPanel">
					<ul class="tab11">
						<li class="hit">项目查询</li>
						<li>项目资料维护</li>
					</ul>
					<div class="panes">
						<div class="pane" style="display:block;">
							 <!-- <table class="tabo">
							 	<tr>
							 		<td style="padding-right: 15px;">项目状态 : </td>
							 		<td>
							 			<dl class="selects">
										<dt class="cur">所有状态</dt>
											<dd style="display: none;">
												<ul>
													<li><a href="javascript:void(0);">所有状态</a></li>
													<li><a href="javascript:void(0);">所有状态</a></li>
													<li><a href="javascript:void(0);">所有状态</a></li>
													<li><a href="javascript:void(0);">所有状态</a></li>
													<li><a href="javascript:void(0);">所有状态</a></li>
													<li><a href="javascript:void(0);">信息技术部门</a></li>
												</ul>
											</dd>
										</dl>	
							 		</td>
							 		<td style="width: 103px;text-align: right;padding-right: 10px;">项目名称 : </td><td  colspan="6"><input type="text" name="" id="" style="width:490px;"></td>	
							 	</tr>
							 	<tr>
							 		<td>项目编号 : </td><td><input type="text" style="width: 181px;" name="" id="" placeholder="公开"></td>
							 		<td style="width: 103px;text-align: right;padding-right: 10px;">经办部门 : </td><td><input type="text" name="" id=""></td>	
							 		<td style="padding-left:83px;">原始编号 : <input type="text" name="" id="" style="width:180px;"></td>	
							 	</tr>
							 	<tr>
							 		<td>立项时间 : </td>
							 		<td colspan="3"><input type="text" name="" id="" style="width:44%;" class="dateBg"><span style="padding:0 15px;">至</span><input type="text" name="" id="" style="width:44%;" class="dateBg"></td>
							 		<td><button type="submit">查询</button></td>	
							 	</tr>
							 </table>
							 
							 <p class="old">共搜出2条记录</p>
							 <table class="TableDemo">
			 					<thead>
			 						<tr><th>项目编号</th>
			 						<th>项目名称</th>
			 						<th>项目状态</th>
			 						<th>经办部门</th>
			 						<th>原始编号</th>	
			 						<th>创建时间</th>
			 					</tr></thead>
			 					<tbody>
			 						<tr>
			 							<td>21312312</td>
			 							<td>广州屈臣氏货运物流项目</td>
			 							<td>结束</td>
			 							<td>经营部</td>
			 							<td>232323</td>
			 							<td>2016-04-11</td>
			 						</tr>
			 						<tr>
			 							<td>21312312</td>
			 							<td>广州屈臣氏货运物流项目</td>
			 							<td>结束</td>
			 							<td>部门A</td>
			 							<td>232323</td>
			 							<td>2016-04-11</td>
			 						</tr>
			 					</tbody>
			 				</table> -->
			 				<script language="javascript" >

						var iframecode='<iframe id="externalhot" scrolling="auto" frameborder="0" style="width:100%;height:590px" src="<%=basePath%>console/template/engine/openform/appid:be753c93-7d83-46e1-aed6-164556b6e931/formid:f27e0987-3860-4257-8369-503076375922.xsp"></iframe>'
						
						document.write(iframecode)
						
						</script>
			 				
			 				
						</div>
						<div class="pane">
							<script language="javascript" >

						var iframecode='<iframe id="external" scrolling="auto" frameborder="0" style="width:100%;height:990px" src="<%=basePath%>console/template/engine/openform/appid:be753c93-7d83-46e1-aed6-164556b6e931/formid:bcb138f5-2fc8-42e0-a919-e32c9984469a.xsp"></iframe>'
						
						document.write(iframecode)
						
						</script>
						</div>
					</div>
			    </div>
			</div>
		</div>
<br clear="both">
</body>


<script>
	$(function(){	
	/* //获取客户信息	
	getCityList() */
	// tab切换
	$('.tabPanel > ul > li').click(function(){
		$(this).addClass('hit').siblings().removeClass('hit');
		$('.panes>div:eq('+$(this).index()+')').show().siblings().hide();	
	})
	


	$(".selects").each(function(){
		var s=$(this);
		var z=parseInt(s.css("z-index"));
		var dt=$(this).children("dt");
		var dd=$(this).children("dd");
		var _show=function(){dd.slideDown(200);dt.addClass("cur");s.css("z-index",z+1);};   //展开效果
		var _hide=function(){dd.slideUp(200);dt.removeClass("cur");s.css("z-index",z);};    //关闭效果
		dt.click(function(){dd.is(":hidden")?_show():_hide();});
		dd.find("a").click(function(){dt.html($(this).html());_hide();});     //选择效果（如需要传值，可自定义参数，在此处返回对应的“value”值 ）
		$("body").click(function(i){ !$(i.target).parents(".selects").first().is(s) ? _hide():"";});
	})

	<%-- function getCityList(){
		$.ajax({
			url:'<%=basePath%>contract/getcustomerType.action',
			data:{},
			type:'post',
			dataType:'json',
			success:function(data){
				var cityList = data.cityList;
				var str = '';
				
				for(var i=0;i<cityList.length;i++){
					str += '<option value="'+cityList[i].TYPEID+'">'+cityList[i].TYPENAME+'</option>';
	
				}
				$('#cityId').html(str);
				
				
				/* $('#cityId').change(function(){
					getList();
				}); */
			},
			error:function(){alert("获取失败")}
		});
	} --%>
})
</script>
</html>