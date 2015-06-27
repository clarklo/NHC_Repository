<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.util.DealString" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessDocDown" %>
<%@ page import="com.web.www.DocDown" %>
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
<%
	DealString ds=new DealString();
	String cid=ds.toString(request.getParameter("id"));
    String id="";
	ProcessArticle pa=new ProcessArticle();
	if("".equals(cid)||cid==null)
		{
			cid="148";
			List list=pa.query(0,cid);
			Article ac=(Article)list.get(0);
			id=ac.getId();
		}
	else
		{
			List list=pa.query(0,cid);
			Article ac=(Article)list.get(0);
			id=ac.getId();
		}
	
	pa.getOnedate(id);
	Article article=pa.getArticle();
%>
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
    <h1><%=article.getTitle()%></h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li><a href="../marketing/">常見問答</a></li>
    <li>></li>
    <li><%=article.getTitle()%></li>
    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
    <div class="content">
	
	  
&nbsp;<%=article.getContent()%>



                     <%	
                     	ProcessDocDown pdd=new ProcessDocDown();
                     	List list=pdd.quryDocDownByCid(cid);
                     	if(list.size()>0)
						{  
					%>
					
					<table width="87%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                    <%
						   int i=0;
                     	   while(i<list.size())
                     	   {
                     		DocDown dd = new DocDown();
                     	    dd=(DocDown)list.get(i);
                     	    String img="tuu_r2_c2.jpg";
                     	    String type=dd.getDown_document();
                     	    if(type.indexOf(".rar")>0 ||type.indexOf(".zip")>0  )      img="tuu_r2_c2.jpg";
                     	    else if(type.indexOf(".doc")>0) img="ico_doc.gif";
		                    else if(type.indexOf(".xls")>0) img="ico_xls.gif";
		                    else if(type.indexOf(".ppt")>0) img="ico_ppt.gif";
		                    else if(type.indexOf(".pdf")>0) img="ico_pdf.gif";
		                    else if(type.indexOf(".exe")>0) img="0_9.gif";
                     %>
                      
                        <td width="8%" height="35" align="center"><a href="download.jsp?id=<%=dd.getDown_id()%>" class="red_link"><img src="../images/<%=img%>" width="34" height="30" border="0"></a></td>
                        <td width="46%"><a href="../resource/download.jsp?id=<%=dd.getDown_id()%>" class="red_link"><%=dd.getDown_title()%></a></td>
                       <%   i=i+1;
					        if(i%2==0)
							   out.print("</tr><tr>");
                       		} //end while
                      %>
                      </tr> 
                    </table>
					<%   } // end list  %>
                  
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