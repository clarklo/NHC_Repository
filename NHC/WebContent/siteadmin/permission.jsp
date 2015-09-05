<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%
//權限控制
   
if(session.getAttribute("admin") == null){
	out.println("<script language=javascript> alert('你還沒有登入,請先登入!');window.open('logout.jsp','_parent');</script>");	
}
com.web.www.Admin admin = (com.web.www.Admin)session.getAttribute("admin");
%> 