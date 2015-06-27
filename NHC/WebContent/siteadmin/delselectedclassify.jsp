<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission1.jsp"%>
<%
int pid = Integer.parseInt(request.getParameter("pid"));
String path = request.getRealPath("/");	
ProcessClassify processClassify = new ProcessClassify();

int ps = Integer.parseInt(request.getParameter("ps"));
String id[] = new String[ps];
for(int i = 0; i < ps; i ++){
	id[i] = request.getParameter("id" + (i +1));
	if(id[i] != null){
		processClassify.del(path,Integer.parseInt(id[i]));
	}
}

if(processClassify.isStatus()){		
	response.sendRedirect("classify.jsp?pid="+pid);
}
else{
	out.println("<script language=javascript> alert('"+ processClassify.getMsg() + "'); location.href='classify.jsp?pid="+pid+"';</script>");	
}
%>
