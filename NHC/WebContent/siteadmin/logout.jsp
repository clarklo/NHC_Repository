<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="error/error.jsp" %>
<%
session.setAttribute("admin", null);
response.sendRedirect("index.jsp");
%>