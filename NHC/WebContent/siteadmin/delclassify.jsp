<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission1.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));
String path = request.getRealPath("/");	

ProcessClassify processClassify = new ProcessClassify();
processClassify.del(path, id);
	
if(processClassify.isStatus()){		
	response.sendRedirect("classify.jsp?pid="+pid);
}
else{
	out.println("<script language=javascript> alert('"+ processClassify.getMsg() + "'); location.href='classify.jsp?pid="+pid+"';</script>");	
}

%>
