<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.util.DealString" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.www.FriendSite"%>
<%@ page import="com.web.www.ProcessFriendSite"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>高雄榮民總醫院國際醫療中心</title>
<link href="css/vghks_index.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="js/6-8-001-2.js"></script>
<script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function loginChedk(){
	if(document.loginForm.loginname.value==""){
		alert("請輸入登入名");
		return false;
	}
	if(document.loginForm.password.value==""){
		alert("請輸入密碼");
		return false;
	}
	return true;
}
//-->
</script>
</head>

<body>
<!----上選單區------>
<div class="TOP_menu">
<div class="box01">
<div class="logo">
<div class="logo_img"><a href="index.jsp"><img src="images/logo.png" width="428" height="68" alt="高雄榮民總醫院國際醫療中心logo" /></a></div>
<div class="Languages">
<form   name="search" method="post" action="search/SearchList">
<ul>
<li>
<!--<input class="inputSearch" name="title" type="text" onmouseover="if(this.value=='請輸入關鍵字') this.value=''" onfocus="if(this.value=='請輸入關鍵字') this.value=''" size="10" maxlength="10" value="請輸入關鍵字">

<input name="Submit1" type="image" src="images/index_Search.png" width="28" height="25">

<input class="inputSearch" type="text" onmouseover="if(this.value=='請輸入關鍵字') this.value=''" onfocus="if(this.value=='請輸入關鍵字') this.value=''" size="10" value="請輸入關鍵字" accesskey="S" name="q"><a class="btnSearch" onclick="doSubmit();" onkeypress="doSubmit();" href="#">
<img src="images/index_Search.png" width="28" height="25" alt="搜尋" /> </a>--></li>

<li><a class="Change" href="index.jsp">中文版</a></li>
<li>|</li>
<li><a class="Change" href="../NHCCN/index.jsp">简体版</a></li>
<li>|</li>
<li><a class="Change" href="../NHCEN/index.jsp">English</a></li>
</ul>
</form>
</div>
</div>
<div class="clear"></div>
<div class="menu">
<ul>
<li id="MENU1"><a href="summary/Page.jsp?id=127">關於我們</a>
<ul id="SUB1" class="menu_min">
<li><a href="summary/Page.jsp?id=127">國際醫療中心簡介</a></li>
<li><a href="summary/NewsList?cid=129">國際交流</a></li>
<!--<li><a href="summary/NewsList?cid=129">國際義診</a></li>
<li><a href="summary/NewsList?cid=130">學術交流</a></li>-->
</ul>
</li>
<li id="MENU2"><a href="navigation/showproduct.jsp?cid=155">醫療服務</a>
<ul id="SUB2" class="menu_min">
<li><a href="navigation/showproduct.jsp?id=1154661702812">心臟血管中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661724984">植牙中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661797171">生殖醫學中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661998968">美容醫學中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661780859">骨科部</a></li>
<li><a href="navigation/showproduct.jsp?id=1154662095281">健康管理中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661760312">銩雷射治療中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661917000">屈光雷射中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1155690083354">兒童心臟中心</a></li>
<li><a href="navigation/showproduct.jsp?id=1154661972843">正子造影中心</a></li>
</ul>
</li>
<li id="MENU3"><a href="culture/index.jsp">就醫資訊</a>
<ul id="SUB3" class="menu_min">
<li><a href="culture/index.jsp?id=132">就醫流程</a></li>
<li><a href="culture/index.jsp?id=133">交通資訊</a></li>
<li><a href="culture/index.jsp?id=134">貴賓住宿</a></li>
<li><a href="culture/index.jsp?id=135">便民服務</a></li>
</ul>
</li>
<li><a href="management/Pay.jsp">收費標準</a></li>
<li><a href="system/index.jsp">衛教園地</a></li>
<li><a href="marketing/index.jsp?cid=148">常見問答</a></li>
<li><a href="resources/index.jsp">友善連結</a></li>
<li><a href="services/index.jsp?cid=159">心情故事</a></li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<!----banner區------>
<div class="header_slide">
<div class="box02">
<div class="banner">
<iframe src="demo.html" width="909" height="374" align="top"  scrolling ="no" frameborder="0"></iframe>

</div>
</div>
</div>
<div class="clear"></div>
<!----內容區------>
<div class="CONTENT">
<div class="box03">
<div class="Shadow"><img src="images/index_banner_bg.png" width="946" height="24" /></div>
<div class="Specialty_medical">
<ul>
<!--<li><a href="navigation/showproduct.jsp?id=1154661917000"><img src="images/index_pic01.jpg" width="174" height="122" alt="雷射屈光中心" /></a>
<h1>屈光雷射中心</h1>
<p>Laser Refractive Center</p>
<span><a href="navigation/showproduct.jsp?id=1154661917000">Read More ></a></span>
</li>-->

<li><a href="KVGH/index.html?id=1154661917000" target="new"><img src="images/index_pic05.jpg" width="175" height="123" alt="達文西機器手臂手術系統" /></a>
<h1>達文西機械手臂手術系統</h1>
<p>da Vinci Surgery Systen</p>
<span><a href="KVGH/index.html?id=1154661917000" target="new">Read More ></a></span>
</li>

<li><a href="navigation/showproduct.jsp?id=1154662095281"><img src="images/index_pic02.png" width="174" height="122" alt="健康管理中心" /></a>
<h1>健康管理中心</h1>
<p>Physical Examination Center</p>
<span><a href="navigation/showproduct.jsp?id=1154662095281">Read More ></a></span>
</li>
<li><a href="navigation/showproduct.jsp?id=1154661998968"><img src="images/index_pic03.jpg" width="174" height="122" alt="美容醫學中心" /></a>
<h1>美容醫學中心</h1>
<p>Aesthetic Medical Center</p>
<span><a href="navigation/showproduct.jsp?id=1154661998968">Read More ></a></span>
</li>
<li><a href="navigation/showproduct.jsp?id=1154661724984"><img src="images/index_pic04.jpg" width="174" height="122" alt="植牙中心" /></a>
<h1>植牙中心</h1>
<p>Cardiovascular Center</p>
<span><a href="navigation/showproduct.jsp?id=1154661724984">Read More ></a></span>
</li>
</ul>
</div>
<div class="border_Shadow"><img src="images/border_Shadow.png" width="961" height="10" alt="影子" /></div>
<div class="NEWS_BOX">
<div class="news">
<div class="news_h1">
  <img src="images/index_news.png" width="281" height="80" alt="最新消息" /> 
  <p><a href="news/index.jsp?cid=124&mid=1">More 》》》</a></p>
  </div>
<div class="clear"></div>
<ul>
					<%
					  ProcessArticle par = new ProcessArticle();
					  Article  ar = new Article();
					  List li = new ArrayList();
					  li = par.query(6,"124");
					  if(li.size()>0)
					  { for(int j=0;j<li.size();j++)
					     {
					       ar=(Article)li.get(j);
					 %>


<li><a href="news/showNews.jsp?id=<%=ar.getId()%>"><%=ar.getTitle()%></a></li>

					<%  } 
                       }else
                       {
                      %>
					  <li>暫時無訊息</li>
					<%}%>
</ul>
</div>
<div class="Member">
<ul>

<li>
<div class="memberBOX">
<div class="BOXleft">
<img src="images/index_right_icon01.png" width="83" height="76" alt="icon" />
</div>
<div class="BOXright">
<%
	HttpSession Session = request.getSession(true);
	String loginname=(String)Session.getAttribute("loginname");
	if("".equals(loginname)||loginname==null)
	{
%>
</br></br>
<h1>會員登入</h1>
<span><a href="user/login.jsp">登入會員</a></span>
<span><a href="user/regist.jsp">加入會員</a></span>
<%}else{%>
<span><%=loginname%> 歡迎您﹗</span>
<span><a href="user/modpsw.jsp">更換密碼</a></span>
<span><a href="user/moduser.jsp">修改個人資料</a></span>
<span><a href="user/logout.jsp">登出</a></span>
<%}%>
</div>
</div>
</li>

<li>
<div class="memberBOX02">
<div class="BOXleft">
<img src="images/index_right_icon02.png" width="83" height="76" alt="icon" /></div>
<div class="BOXright">
<h1>線上預約</h1>
<span><a href="services/support.jsp">如何預約</a></span>
<span><a href="services/support2.jsp">美容醫學中心預約</a></span>
</div>
</div>
</li>

<li>
<div class="memberBOX03">
<div class="BOXleft">
<img src="images/index_right_icon03.png" width="83" height="76" alt="icon" /></div>
<div class="BOXright">
<h1>醫療項目</h1>
<p>星期一～星期五 </p>
<p>AM8:00 ~ PM6:00  </p>  
<p>星期六 : AM8:00 ~ AM12:00</p>
<select class="select" name="theraphy" onchange="if(this.value!=''){window.location.assign(this.value);}" >
<option>= 請選擇醫療項目 =</option>
<option value="navigation/showproduct.jsp?id=1154661702812">心臟血管中心</option>
<option value="navigation/showproduct.jsp?id=1154661724984">植牙中心</option>
<option value="navigation/showproduct.jsp?id=1154661760312">銩雷射治療中心</option>
<option value="navigation/showproduct.jsp?id=1154661780859">骨科部</option>
<option value="navigation/showproduct.jsp?id=1154661797171">生殖中心</option>
<option value="navigation/showproduct.jsp?id=1154661917000">屈光雷射中心</option>
<option value="navigation/showproduct.jsp?id=1154661998968">美容醫學中心</option>
<option value="navigation/showproduct.jsp?id=1154662095281">健康管理中心</option>
<option value="navigation/showproduct.jsp?id=1155690083354">兒童心臟中心</option>
<option value="navigation/showproduct.jsp?id=1154661972843">正子造影中心</option>
</select></div>
</div>
</li>
</ul>
</div>
</div>
<div class="clear"></div>
<div class="border_Shadow"><img src="images/border_Shadow.png" width="961" height="10" alt="影子" /></div>
<div class="link_b">
<iframe src="Link.jsp" width="900" height="65" align="top"  scrolling ="no" frameborder="0"></iframe>
</div>



</div>
</div>
<div class="clear"></div>
<!----頁尾區------>
<div class="bottom">



<div class="box4">
<div class="footer_menu">
<ul>
<li><a href="index.jsp">Home </a></li>
<li>  | </li> 
<li><a href="summary/Page.jsp?id=127">關於我們</a></li> 
<li>  ｜ </li> 
<li><a href="navigation/showproduct.jsp?cid=155">醫療服務</a></li>  
<li>  ｜ </li>  
<li> <a href="culture/index.jsp">就醫資訊</a></li>   
<li>  ｜ </li>  
<li> <a href="management/Pay.jsp">收費標準 </a></li>  
<li>  ｜ </li>  
<li> <a href="system/index.jsp">衛教園地</a></li>    
<li>  ｜ </li>  
<li> <a href="marketing/index.jsp?cid=148">常見問與答 </a></li>  
<li>  ｜ </li>  
<li> <a href="resources/index.jsp">友善連結 </a></li> 
<li>  ｜ </li>  
<li> <a href="services/index.jsp?cid=159">心情故事</a></li>

</ul>
<p>Connect with us:<span><a href="mailto:imc@vghks.gov"><img src="images/index_icon_mail.png" width="25" height="17" alt="mail" /></a></span></p>
</div>
<div class="clear"></div>
<div class="Authenticate">
<p>高雄榮民總醫院　地址：81362高雄市左營區大中一路386號 電話：07-3422121 傳真：07-3422288</p>
<p>本網站內容著作權歸高雄榮民總醫院所有，未經允許請勿任意轉載、複製或做商業用途</p>

</div>
</div>
</div>
</body>
</html>
