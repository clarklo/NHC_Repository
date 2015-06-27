<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>


    <div class="menu_BG">
    <div class="MENU_c">
    <ul>
	
<%
	ProcessClassify pa=new ProcessClassify();
	List list=pa.qurAllClassByfatid("117");
	if(list.size()>0)
	{
	  for(int i=0;i<1;i++)
	  {
		Classify classify=(Classify)list.get(i);
%>

	<%if("--技術支援".equals(classify.getName())) {%>
	    <li><a href="support.jsp" class="red_link15"><%=classify.getName()%></a></li>
	<%} else if(classify.getId()==159)  { %>
		<li><a href="NewsList?cid=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></li>
	<%} else { %>
		<li><a href="Page.jsp?id=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></li>
	<%}
	%>

  <%}
  }
  %>
  
   </ul>
    </div>
    
   <jsp:include page="../sub/left_foot.jsp"/>
    
    </div>



