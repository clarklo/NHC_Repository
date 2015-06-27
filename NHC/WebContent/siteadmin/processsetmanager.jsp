<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission1.jsp"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
int ps = Integer.parseInt(request.getParameter("ps"));
String id[] = new String[ps];
int mid[] = new int[ps];
for(int i = 0; i < ps; i ++){
	id[i] = request.getParameter("mid" + (i+1));
	if(id[i] != null){
		mid[i] = Integer.parseInt(id[i]);
	}
	else{
		mid[i] = 0;
	}
}
Permission perm = new Permission();
perm.setCid(cid);
perm.setMid(mid);
perm.setPermission();

if(perm.isStatus()){		
	response.sendRedirect("classify.jsp?pid="+request.getParameter("pid"));
}
else{
	out.println("<script language=javascript> alert('"+ perm.getMsg() + "'); location.href='classify.jsp?pid="+request.getParameter("pid")+"';</script>");	
}
%>