<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>

    <div class="menu_BG">
    <div class="MENU_c">
    <ul>
	
	<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("111");
	if(list.size()>0)
	{
	  for(int i=0;i<1;i++)
	  {
		Classify cf=(Classify)list.get(i);
		
	
%>
	
    <li><a href="NewsList?cid=<%=cf.getId()%>&mid=1"><%=cf.getName()%></a></li>
	  <%
  	}
  }else
   {
  %>
	
      <%}%>
    </ul>
    </div>
     <jsp:include page="../sub/left_foot.jsp"/>

    
    </div>



