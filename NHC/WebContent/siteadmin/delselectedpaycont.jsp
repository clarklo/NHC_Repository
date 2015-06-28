<%@page import="www.ProcessPayCont"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission6.jsp"%>
<%
ProcessPayCont processPayCont = new ProcessPayCont();
int ps = Integer.parseInt(request.getParameter("id"));
processPayCont.del(ps);

if(processPayCont.isStatus()){		
	response.sendRedirect("PayContAdmin.jsp");
}
else{
	out.println("<script language=javascript> alert('"+ processPayCont.getMsg() + "'); location.href='friendsite.jsp';</script>");	
}
%>
