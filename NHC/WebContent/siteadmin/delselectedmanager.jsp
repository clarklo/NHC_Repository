<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission2.jsp"%>
<%
ProcessAdmin processAdmin = new ProcessAdmin();

int ps = Integer.parseInt(request.getParameter("ps"));
String id[] = new String[ps];
for(int i = 0; i < ps; i ++){
	id[i] = request.getParameter("id" + (i +1));
	if(id[i] != null){
		processAdmin.del(Integer.parseInt(id[i]));
	}
}

if(processAdmin.isStatus()){		
	response.sendRedirect("manager.jsp");
}
else{
	out.println("<script language=javascript> alert('"+ processAdmin.getMsg() + "'); location.href='manager.jsp';</script>");	
}
%>
