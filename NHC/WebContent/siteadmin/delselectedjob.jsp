<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*,java.io.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission5.jsp"%>
<%
ProcessJob pj = new ProcessJob();
int ps = Integer.parseInt(request.getParameter("ps"));
String id[] = new String[ps];
for(int i = 0; i < ps; i ++){
	id[i] = request.getParameter("id" + (i +1));
	}
	pj.delJob(id);
 
	
if(pj.isStatus()){	
	response.sendRedirect("job.jsp");
}
else{
	out.println("<script language=javascript> alert('"+ pj.getMsg() + "'); location.href='job.jsp';</script>");	
}
 
 
 %>
