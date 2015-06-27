<%@ page contentType="text/html; charset=utf-8"  import="java.util.*" import="java.sql.*"%>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<jsp:useBean id="link" scope="page" class="com.msg.bean.Link">
</jsp:useBean>
<%
if(session.getAttribute("adminname")==null)
{
response.sendRedirect("login.jsp");
}else{
%>
<html>
<head>
<title>
del_pro
</title>
</head>
<body bgcolor="#ffffff">
<%
String id=request.getParameter("id");
link.delLink(id);
response.sendRedirect("addLink.jsp");
}
%>
</body>
</html>
