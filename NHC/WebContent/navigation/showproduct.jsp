<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" %>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.www.Article" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-醫療服務</title>
<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
<link href="../css/health_ifram.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />

<!--<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>-->
<script type="text/javascript" src="../js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox.js"></script>
<script type="text/javascript" src="../js/6-8-001-2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.fancybox').fancybox({
			type		: 'iframe',
			maxWidth	: 800,
			maxHeight	: 768,
			fitToView	: false,
			width		: '70%',
			height		: '90%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none',
			iframe		: { preload: false }
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
 <%	 String id=request.getParameter("id");
  	 String cid=request.getParameter("cid");
  	 ProcessArticle par = new ProcessArticle();
  	 List list = new ArrayList();
  	 Article ar = new Article();
  	 if("".equals(id)||id==null)
  	 {
  	    list=par.query(0,cid);
  	    Article ar1 = new Article();
  	    ar1 =(Article)list.get(0);
  	    id=ar1.getId();
  	 }
  	 par.getOnedate(id);
  	 ar=par.getArticle();
  	 String Title=ar.getTitle();
  	 String content =ar.getContent();
  %>
<body>
<jsp:include page="../sub/top.jsp" flush="true"/>
<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><img src="../images/menu_pic05.png" width="231" height="81" alt="醫療服務" /></div>

   
   
   <jsp:include page="left_sp.jsp"/>
   
   
   </td>
    <td valign="top">
    <table width="729" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="content_banner"><iframe src="../0023_2.html" width="726" height="176" align="top"  scrolling ="no" frameborder="0"></iframe></div></td>
  </tr>
  <tr>
    <td valign="top">
    <div class="title">
    <h1><%=Title%></h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li><a href="../navigation/showproduct.jsp?cid=155">醫療服務</a></li>
    <li>></li>
    <li><%=Title%></li>
    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
    <div class="content">




      <%=content%>
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
    <jsp:include page="../sub/foot.jsp" flush="true"/>
</body>
</html>
