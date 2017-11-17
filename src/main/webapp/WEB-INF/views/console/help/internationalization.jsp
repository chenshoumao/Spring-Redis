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
国际化资源配置
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
<li class="active"><a href="#1F" >国际化资源配置</a></li>
</ul>
</div>
<!-- </div>  -->
</div>
<div class="col-md-9" role="main">
<div class="panel docs-content">
<div class="docs-section">
<div class="page-header">
<h1 class="docs-heading">国际化资源配置<span class="anchor-target" id="getting-started"></span>
<a name="1F">&nbsp;</a> 
</h1>
</div>
<p>
介绍:
</p>
<pre>
<code class="lang-less"><span class="hljs-at_rule">
国际化（internationalization）是设计和制造容易适应不同区域要求的产品的一种方式。
它要求从产品中抽离所有地域语言，国家/地区和文化相关的元素。
换言之，应用程序的功能和代码设计考虑在不同地区运行的需要，其代码简化了不同本地版本的生产。
开发这样的程序的过程，就称为国际化。

配置的国际化信息根据浏览器的首选语言进行展示。

配置步骤:
(1) 新建一个菜单: 系统框架-->菜单管理-->创建
上级菜单选中:国际化资源
菜单名称:添写要添加的地区语言名称
菜单的url：
填写 /console/detInternationalization/index.xsp?type=messages_+国际资源文件代码
例如创建一个公用荷兰语 – 南非：
/console/detInternationalization/index.xsp?type=messages_af-ZA

(2)新建的菜单 根据角色或人员进行授权  

(3) 打开创建的菜单进行相应的地区语言配置

国际资源文件代码 对照表

af 公用荷兰语
af-ZA 公用荷兰语 – 南非
sq 阿尔巴尼亚
sq-AL 阿尔巴尼亚 -阿尔巴尼亚
ar 阿拉伯语
ar-DZ 阿拉伯语 -阿尔及利亚
ar-BH 阿拉伯语 -巴林
ar-EG 阿拉伯语 -埃及
ar-IQ 阿拉伯语 -伊拉克
ar-JO 阿拉伯语 -约旦
ar-KW 阿拉伯语 -科威特
ar-LB 阿拉伯语 -黎巴嫩
ar-LY 阿拉伯语 -利比亚
ar-MA 阿拉伯语 -摩洛哥
ar-OM 阿拉伯语 -阿曼
ar-QA 阿拉伯语 -卡塔尔
ar-SA 阿拉伯语 – 沙特阿拉伯
ar-SY 阿拉伯语 -叙利亚共和国
ar-TN 阿拉伯语 -北非的共和国
ar-AE 阿拉伯语 – 阿拉伯联合酋长国
ar-YE 阿拉伯语 -也门
hy 亚美尼亚
hy-AM 亚美尼亚的 -亚美尼亚
az Azeri
az-AZ-Cyrl Azeri-(西里尔字母的) 阿塞拜疆
az-AZ-Latn Azeri(拉丁文)- 阿塞拜疆
eu 巴斯克
eu-ES 巴斯克 -巴斯克
be Belarusian
be-BY Belarusian-白俄罗斯
bg 保加利亚
bg-BG 保加利亚 -保加利亚
ca 嘉泰罗尼亚
ca-ES 嘉泰罗尼亚 -嘉泰罗尼亚
zh-HK 华 – 香港的 SAR
zh-MO 华 – 澳门的 SAR
zh-CN 华 -中国
zh-CHS 华 (单一化)
zh-SG 华 -新加坡
zh-TW 华 -台湾
zh-CHT 华 (传统的)
hr 克罗埃西亚
hr-HR 克罗埃西亚 -克罗埃西亚
cs 捷克
cs-CZ 捷克 – 捷克
da 丹麦文
da-DK 丹麦文 -丹麦
div Dhivehi
div-MV Dhivehi-马尔代夫
nl 荷兰
nl-BE 荷兰 -比利时
nl-NL 荷兰 – 荷兰
en 英国
en-AU 英国 -澳洲
en-BZ 英国 -伯利兹
en-CA 英国 -加拿大
en-CB 英国 -加勒比海
en-IE 英国 -爱尔兰
en-JM 英国 -牙买加
en-NZ 英国 – 新西兰
en-PH 英国 -菲律宾共和国
en-ZA 英国 – 南非
en-TT 英国 – 千里达托贝哥共和国
en-GB 英国 – 英国
en-US 英国 – 美国
en-ZW 英国 -津巴布韦
et 爱沙尼亚
et-EE 爱沙尼亚的 -爱沙尼亚
fo Faroese
fo-FO Faroese- 法罗群岛
fa 波斯语
fa-IR 波斯语 -伊朗王国
fi 芬兰语
fi-FI 芬兰语 -芬兰
fr 法国
fr-BE 法国 -比利时
fr-CA 法国 -加拿大
fr-FR 法国 -法国
fr-LU 法国 -卢森堡
fr-MC 法国 -摩纳哥
fr-CH 法国 -瑞士
gl 加利西亚
gl-ES 加利西亚 -加利西亚
ka 格鲁吉亚州
ka-GE 格鲁吉亚州 -格鲁吉亚州
de 德国
de-AT 德国 -奥地利
de-DE 德国 -德国
de-LI 德国 -列支敦士登
de-LU 德国 -卢森堡
de-CH 德国 -瑞士
el 希腊
el-GR 希腊 -希腊
gu Gujarati
gu-IN Gujarati-印度
he 希伯来
he-IL 希伯来 -以色列
hi 北印度语
hi-IN 北印度的 -印度
hu 匈牙利
hu-HU 匈牙利的 -匈牙利
is 冰岛语
is-IS 冰岛的 -冰岛
id 印尼
id-ID 印尼 -印尼
it 意大利
it-IT 意大利 -意大利
it-CH 意大利 -瑞士
ja 日本
ja-JP 日本 -日本
kn 卡纳达语
kn-IN 卡纳达语 -印度
kk Kazakh
kk-KZ Kazakh-哈萨克
kok Konkani
kok-IN Konkani-印度
ko 韩国
ko-KR 韩国 -韩国
ky Kyrgyz
ky-KZ Kyrgyz-哈萨克
lv 拉脱维亚
lv-LV 拉脱维亚的 -拉脱维亚
lt 立陶宛
lt-LT 立陶宛 -立陶宛
mk 马其顿
mk-MK 马其顿 -FYROM
ms 马来
ms-BN 马来 -汶莱
ms-MY 马来 -马来西亚
mr 马拉地语
mr-IN 马拉地语 -印度
mn 蒙古
mn-MN 蒙古 -蒙古
no 挪威
nb-NO 挪威 (Bokm?l) – 挪威
nn-NO 挪威 (Nynorsk)- 挪威
pl 波兰
pl-PL 波兰 -波兰
pt 葡萄牙
pt-BR 葡萄牙 -巴西
pt-PT 葡萄牙 -葡萄牙
pa Punjab 语
pa-IN Punjab 语 -印度
ro 罗马尼亚语
ro-RO 罗马尼亚语 -罗马尼亚
ru 俄国
ru-RU 俄国 -俄国
sa 梵文
sa-IN 梵文 -印度
sr-SP-Cyrl 塞尔维亚 -(西里尔字母的) 塞尔维亚共和国
sr-SP-Latn 塞尔维亚 (拉丁文)- 塞尔维亚共和国
sk 斯洛伐克
sk-SK 斯洛伐克 -斯洛伐克
sl 斯洛文尼亚
sl-SI 斯洛文尼亚 -斯洛文尼亚
es 西班牙
es-AR 西班牙 -阿根廷
es-BO 西班牙 -玻利维亚
es-CL 西班牙 -智利
es-CO 西班牙 -哥伦比亚
es-CR 西班牙 – 哥斯达黎加
es-DO 西班牙 – 多米尼加共和国
es-EC 西班牙 -厄瓜多尔
es-SV 西班牙 – 萨尔瓦多
es-GT 西班牙 -危地马拉
es-HN 西班牙 -洪都拉斯
es-MX 西班牙 -墨西哥
es-NI 西班牙 -尼加拉瓜
es-PA 西班牙 -巴拿马
es-PY 西班牙 -巴拉圭
es-PE 西班牙 -秘鲁
es-PR 西班牙 – 波多黎各
es-ES 西班牙 -西班牙
es-UY 西班牙 -乌拉圭
es-VE 西班牙 -委内瑞拉
sw Swahili
sw-KE Swahili-肯尼亚
sv 瑞典
sv-FI 瑞典 -芬兰
sv-SE 瑞典 -瑞典
syr Syriac
syr-SY Syriac-叙利亚共和国
ta 坦米尔
ta-IN 坦米尔 -印度
tt Tatar
tt-RU Tatar-俄国
te Telugu
te-IN Telugu-印度
th 泰国
th-TH 泰国 -泰国
tr 土耳其语
tr-TR 土耳其语 -土耳其
uk 乌克兰
uk-UA 乌克兰 -乌克兰
ur Urdu
ur-PK Urdu-巴基斯坦
uz Uzbek
uz-UZ-Cyrl Uzbek-(西里尔字母的) 乌兹别克斯坦
uz-UZ-Latn Uzbek(拉丁文)- 乌兹别克斯坦
vi 越南
vi-VN 越南 -越南




</code></pre>
</div>




</div>
</body></html>