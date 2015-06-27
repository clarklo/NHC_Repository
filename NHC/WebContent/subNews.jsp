
<%@ page pageEncoding="big5" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.util.DealString" %>
<%@ page import="java.util.List" %>

<html>
  <head>
  <!--
@import url("css.css");
.STYLE1 {color: #999999}
-->
</style>
  </head>
  
  <body>
    <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="10" colspan="3"></td>
                    </tr>
                  <%
                  	  String id=request.getParameter("id");
                  	  ProcessArticle pa=new ProcessArticle();
                  	  List list=pa.query(4,id);
                  	  for(int i=0;i<list.size();i++)
                  	  {
                  	  	Article article=(Article)list.get(i);
                  %>
                  <tr>
                    <td width="4%" height="22" align="center"><img src="images/sy10_r2_c2.jpg" width="3" height="3"></td>
                    <td width="76%"><a href="news/showNews.jsp?id=<%=article.getId()%>" class="red_link">
                    <%
                    	String title=article.getTitle();
                    	if(title.length()>29)
                    	  title=title.substring(0,29);
                    	  out.print(title);
                    %>
                    
                    </a></td>
                    <td width="20%"><%=article.getTime().substring(0,10)%></td>
                  </tr>
                  <%
                  	}
                  %>
                 
                  <tr>
                    <td height="10" colspan="3"></td>
                    </tr>
                </table>
  </body>
</html>
