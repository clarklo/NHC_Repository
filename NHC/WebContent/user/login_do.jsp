
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.util.*" %>
<%@ page import="com.web.www.Userman" %>
<%@ page import="com.web.www.ProcessUserMan" %>
<%@ page import="com.web.util.MD5" %>
<%
	
	String loginname=(request.getParameter("loginname")==null?"":request.getParameter("loginname"));
	String password=MD5.toMD5(request.getParameter("password"));

	Userman user=new Userman();
	user.setUserManLoginName(loginname);
	user.setUserManPassword(password);
	ProcessUserMan pu=new ProcessUserMan();
	pu.setUserman(user);

	pu.checkLogin();
	
	if(!pu.isStatus())
		out.print("<script language=javascript> alert('"+pu.getMsg()+"'); history.go(-1);</script>");
	else{
	 	session.setAttribute("loginname",loginname);
		session.setAttribute("password",password);	
		String id=pu.queryIdByLoginname(loginname);
		session.setAttribute("id",id);
	 	response.sendRedirect("../index.jsp");

	}
%>