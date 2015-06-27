<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>


    <div class="menu_BG">
    <div class="MENU_c">
    <ul>
<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("115");
	if(list.size()>0)
	{
	  for(int i=0;i<list.size();i++)
	  {
		Classify classify=(Classify)list.get(i);
%>
  
 <%if("--線上訂購".equals(classify.getName().trim())){%>	
     <li><a href="online_ordering.jsp"><%=classify.getName()%></a></li>

 <%}else if("醫療服務".equals(classify.getName().trim())){%>	
     <li><a href="../navigation/showproduct.jsp?cid=<%=classify.getId()%>" ><%=classify.getName()%></a></li> 
 <%} else {%>
    <li><a href="index.jsp?id=<%=classify.getId()%>" ><%=classify.getName()%></a></li>
  <% } %>

  <%
  	}
  	
 }%>


    </ul>
    </div>



   <jsp:include page="../sub/left_foot.jsp"/>
    
    </div>



