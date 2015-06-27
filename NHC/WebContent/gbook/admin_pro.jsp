<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<html>
<head>
<title>
admin_pro
</title>
</head>
<body bgcolor="#ffffff">
<%
Connection conn=db.getConn();
Statement stmt=conn.createStatement();
String adminname=new String(request.getParameter("adminname"));
String adminpassword=new String(request.getParameter("adminpassword"));
String condition="update system set adminname='"+adminname+"',adminpassword='"+adminpassword+"'";
stmt.executeUpdate(condition);
stmt.close();
conn.close();
response.sendRedirect("admin.jsp");
%>
</body>
</html>
