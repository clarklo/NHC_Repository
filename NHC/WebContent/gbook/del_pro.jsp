<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
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
Connection con=db.getConn();
Statement stmt=con.createStatement();
String id=request.getParameter("id");
String sql="delete from message where id="+id;
stmt.executeUpdate(sql);
stmt.close();
con.close();
response.sendRedirect("index.jsp");
}
%>
</body>
</html>
