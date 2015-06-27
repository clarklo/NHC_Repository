<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.www.ProcessClassify" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-關於我們</title>
<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../css/health_ifram.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="../js/6-8-001-2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.fancybox').fancybox({
			maxWidth	: 1024,
			maxHeight	: 768,
			fitToView	: false,
			width		: 700,
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none'
		});
	});
</script>
<style>
.dnone
{
	display:none;
}
</style>
</head>

<body >
<jsp:include page="../sub/top.jsp"/>

   
<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><img src="../images/menu_pic04.png" width="231" height="81" alt="關於我們" /></div>

   
   
   <jsp:include page="left.jsp"/>
   
   
   </td>
    <td valign="top">
    <table width="729" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="content_banner"><iframe src="../0023_2.html" width="726" height="176" align="top"  scrolling ="no" frameborder="0"></iframe></div></td>
  </tr>
  <tr>
    <td valign="top">
    <div class="title">
	
		<%
        	String id=request.getParameter("id");
        	ProcessArticle pa=new ProcessArticle();
        	Article article=new Article();
        	ProcessClassify pc=new ProcessClassify();
        	pa.getOnedate(id);
        	article=pa.getArticle();
        	System.out.println("article.getCid():"+article.getCid());
        	String classid=Integer.toString(article.getCid());
        	
        	String classname=pc.queryNameByid(classid);
        %>
	
    <h1><%=classname%></h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
	<li>></li>
    <li>關於我們</li>
	<li>></li>
    <li><%=classname%></li>

    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
	
	
    <div class="content">
    
    <div class="content_news_word">
	



	
     <h1><%=article.getTitle()%></h1>
<%=article.getContent()%> 
   
    
    
    </div>
    
  
                
    
    </div>
    
    
    <!------編輯內容區結束-------------->
    </td>
  </tr>
  <tr>
    <td valign="bottom">
		<jsp:include page="../sub/back.jsp"/>
    </td>
  </tr>
</table>
    </td>
  </tr>
</table>



<jsp:include page="../sub/foot_top.jsp"/>
</div>
</div>


		<jsp:include page="../sub/foot.jsp"/>
</body>
</html>