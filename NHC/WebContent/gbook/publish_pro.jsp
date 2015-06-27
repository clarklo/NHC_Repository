<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<html>
<head>
<title>
publish_pro
</title>
</head>
<body bgcolor="#ffffff">
<%
Connection conn=db.getConn();
Statement stmt=conn.createStatement();
String news=new String(request.getParameter("news"));
String condition="update system set news='"+news+"'";
stmt.executeUpdate(condition);
stmt.close();
conn.close();
response.sendRedirect("index.jsp");
%>
</body>
</html>
