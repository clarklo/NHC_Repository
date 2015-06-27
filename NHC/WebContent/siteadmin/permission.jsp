<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%
//權限控制
if(session.getAttribute("admin") == null){
	out.println("<script language=javascript> alert('你還沒有登入,請先登入!'); location.href='index.jsp';</script>");	
}
%>