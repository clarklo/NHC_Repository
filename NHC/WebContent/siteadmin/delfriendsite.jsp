<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission4.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
	
ProcessFriendSite processFriendSite = new ProcessFriendSite();
processFriendSite.del(id);
	
if(processFriendSite.isStatus()){		
	response.sendRedirect("friendsite.jsp");
}
else{
	out.println("<script language=javascript> alert('"+ processFriendSite.getMsg() + "'); location.href='friendsite.jsp';</script>");	
}
%>
