<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.www.ProcessClassify" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-常見問答</title>
<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>

<script type="text/javascript" src="../js/6-8-001-2.js"></script>

</head>

<body >
<jsp:include page="../sub/top.jsp"/>

   
<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><img src="../images/menu_pic07.png" width="231" height="81" alt="常見問答" /></div>

   
   
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
    <h1>常見問答</h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li><a href="../marketing/NewsList?cid=148">常見問答</a></li>

    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
	
	
    <div class="content">
    
	<div class="content_problem_table">
	
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


<ul>
	<li class="color"><p class="QQ"><%=article.getTitle()%></p> </li>
   	<li><p class="AA"><%=article.getContent()%></p></li>	
</ul>

    
    
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