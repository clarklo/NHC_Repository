<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission2.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
	
ProcessAdmin processAdmin = new ProcessAdmin();
processAdmin.del(id);
	
if(processAdmin.isStatus()){		
	response.sendRedirect("manager.jsp");
}
else{
	out.println("<script language=javascript> alert('"+ processAdmin.getMsg() + "'); location.href='manager.jsp';</script>");	
}
%>
