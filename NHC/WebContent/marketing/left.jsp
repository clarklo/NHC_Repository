<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>

      <div class="menu_BG">
    <div class="MENU_c">
    <ul>
<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("114");
	if(list.size()>0)
	{
	  for(int i=0;i<1;i++)
	  {
		Classify classify=(Classify)list.get(i);
%>

    <%if("--".equals(classify.getName())){%>
            <li><a href="client.jsp" class="red_link15"><%=classify.getName()%></a></li>
    <%}else if("--".equals(classify.getName())){%>
            <li><a href="showgrade.jsp?cid=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></li>
    <%}else if(classify.getId()==148){%>
            <li><a href="NewsList?cid=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></li>
    <%}else {%>
            <li><a href="Page.jsp?id=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></li>

    <%}%>

  <%
  	}
  }
  %>
      </ul>
    </div>
       <jsp:include page="../sub/left_foot.jsp"/>
    
    </div>

