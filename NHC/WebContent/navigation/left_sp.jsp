<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.www.Article" %>


    <div class="menu_BG">
    <div class="MENU_c">
    <ul>
<%     
	    ProcessArticle pa =  new ProcessArticle();
		Article  article = new Article();
	    List li = new ArrayList();
		li = pa.query(0,"155");
		if(li.size()>0)
		{
		   for(int i=0;i<li.size();i++)
		   {
		      article=(Article)li.get(i);
	 %>
    <li><a href="showproduct.jsp?id=<%=article.getId()%>" ><%=article.getTitle()%></a></li>
  <% } 
  }%>


    </ul>
    </div>


       <jsp:include page="../sub/left_foot.jsp"/>
    
    </div>



