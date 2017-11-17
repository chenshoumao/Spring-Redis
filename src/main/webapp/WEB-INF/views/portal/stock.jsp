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
		float:left;margin:0 2px 0 0;border:1px solid #aaa;font-size:11px;height:29px;line-height:30px;width:111px;text-align:center;cursor:pointer;
		text-shadow:0 1px 0 #fff;
		border-radius:4px 4px 0 0;
		box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.5);
		background:#ddd;
		background:-moz-linear-gradient(top, #eee, #ddd);
		background:-webkit-gradient(linear, left top, left bottom, from(#eee), to(#ddd));
	}
	.tabPanel .tab11 .hit{
		border-bottom:1px solid #fff;cursor:pointer;color:black;text-shadow:0 1px 0 #fff;
		background:#fff;
		background:-webkit-gradient(linear, left top, left bottom, from(#e1e1e1), to(#fff));
		background:-moz-linear-gradient(top, #e1e1e1, #fff);
	}
	.pane{display:none;}
	.old{line-height: 40px;text-indent: 10px;border-top: 1px solid #eee;margin-top: 30px;}
	.tabo{width: 100%;margin-top: 25px;}
	.tabo tr{line-height: 42px;}
	.tabo tr td input{line-height: 26px;width: 178px;text-indent: 10px;}
	.tabo tr td button{width: 100px;line-height:20px;background-color: #FC6621;color: #fff;border:none;border-radius: 3px;margin-left: 82px;}
</style>

<script>

var frame = window.parent.document.getElementById('de_freme_iframe');
frame.setAttribute('height', 1020);

</script>
<body style="background: none;">
			<div class="content-right-bottom">
			<div class="gray">
				<div class="tabPanel" >
					<ul class="tab11">
						<li class="hit">未过期</li>
						<li>已过期</li>
					</ul>
					<div class="panes">
						<div class="pane" style="display:block;">
			 				<script language="javascript" >

						var iframecode='<iframe id="externalhot" scrolling="auto" frameborder="0" style="width:100%;height:600px" src="<%=basePath%>console/template/engine/openform/appid:78c72b53-d104-4ebd-8fb5-64c1ad45002e/formid:c2e6c9a7-3148-419a-b272-11cbbb960ae6.xsp"></iframe>'
						
						document.write(iframecode)
						
						</script>
			 				
			 				
						</div>
						<div class="pane">
						
			<%-- 			<script language="javascript" >

						var iframecode='<iframe id="external" scrolling="auto" frameborder="0" style="width:100%;height:330px" src="<%=basePath%>console/template/engine/opendocument/appid:be753c93-7d83-46e1-aed6-164556b6e931/docid:582ec5e5-8936-4ed5-9d11-5d9e5b467ce3.xsp?mode=edit"></iframe>'
						
						document.write(iframecode)
						
						</script> --%>
						
						
						
						
						<script language="javascript" >

						var iframecode='<iframe id="externalout" scrolling="auto" frameborder="0" style="width:100%;height:550px" src="<%=basePath%>console/template/engine/openform/appid:78c72b53-d104-4ebd-8fb5-64c1ad45002e/formid:4a0cedb1-2f19-4450-920f-e94e0193561f.xsp"></iframe>'
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
	//获取客户信息	
	getCityList()
	// tab切换
	$('.tabPanel ul li').click(function(){
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

	function getCityList(){
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
	}
})
</script>
</html>