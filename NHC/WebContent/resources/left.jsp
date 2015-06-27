<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>


    <div class="menu_BG">
    <div class="MENU_c">
    <ul>
	
<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("116");
	if(list.size()>0)
	{
	  for(int i=0;i<list.size();i++)
	  { 
		Classify classify=(Classify)list.get(i);
%>
	<li><a href="index.jsp?id=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></li>

<%
  	}
  }
  %>
    

 </ul>
    </div>
     <jsp:include page="../sub/left_foot.jsp"/>
    
    </div>


