<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<html>
<head>
<title>      
edit_pro
</title>
</head>
<body bgcolor="#ffffff">
<%
String idz=new String(request.getParameter("id"));
String name=new String(request.getParameter("name"));
String content=new String(request.getParameter("content"));
String recontent=new String(request.getParameter("recontent"));
int id=Integer.parseInt(idz);
Connection conn=db.getConn();
Statement stmt=conn.createStatement();
String condition="update message set name='"+name+"',content='"+content+"',recontent='"+recontent+"'where id="+id;
stmt.executeUpdate(condition);
stmt.close();
conn.close();
response.sendRedirect("index.jsp");
%>
</body>
</html>
