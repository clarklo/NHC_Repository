<%@ page pageEncoding="big5" contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.sql.*" %>
<%@ page import="com.web.www.Article"%>
<%@ page import="com.web.www.ProcessArticle"%>
<%@ page import="com.web.util.DealString"%>
<html>
<head>
<title>My JSP 'test.jsp' starting page</title>
</head>
<%
  DealString ds = new DealString();
  Article article = new Article();
  ProcessArticle pa = new ProcessArticle();
  int currpage =0;
  int pageNum=0;
  pa.getOnedate("1151983182671");
  article=pa.getArticle();
  
  if(!"".equals(request.getParameter("page")))
     currpage=Integer.parseInt(request.getParameter("page"));
  StringTokenizer st=new StringTokenizer(article.getContent(),"|||");
  String content[]= new String[st.countTokens()] ;
  System.out.println("st.countTokens()="+st.countTokens());
  for(int i=0;st.hasMoreTokens();i++)
    {
         content[i]=st.nextToken();
        // System.out.println(content[i]);
    }
%>
<body>
   <table width="800" border="1" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><%=article.getTitle()%></td>
  </tr>
  <tr>
    <td><%=content[currpage-1]%></td>
  </tr>
  <tr>
    <td><%for(int k=0;k<st.countTokens();k++)
    { pageNum=k+1; %>
    <a href="test.jsp?page=<%=pageNum%>"><%out.print("pageNum");%></a>
  <%}%>
  </td>
  </tr>
</table>
</body>
</html>
