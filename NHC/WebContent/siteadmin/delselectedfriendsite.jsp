<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission6.jsp"%>
<%
ProcessFriendSite processFriendSite = new ProcessFriendSite();

int ps = Integer.parseInt(request.getParameter("ps"));
String id[] = new String[ps];
for(int i = 0; i < ps; i ++){
	id[i] = request.getParameter("id" + (i +1));
	if(id[i] != null){
		processFriendSite.del(Integer.parseInt(id[i]));
	}
}

if(processFriendSite.isStatus()){		
	response.sendRedirect("friendsite.jsp");
}
else{
	out.println("<script language=javascript> alert('"+ processFriendSite.getMsg() + "'); location.href='friendsite.jsp';</script>");	
}
%>
