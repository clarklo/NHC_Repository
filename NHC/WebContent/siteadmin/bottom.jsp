<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<%@include file="permission.jsp"%>
<%
com.web.www.Admin admin = (com.web.www.Admin)session.getAttribute("admin");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<title>後台管理</title>
<style type="text/css">
<!--
body {
	background-color: #799AE1;
	margin-left: 0px;
	margin-top: 2px;
}
.style2 {color: #000000}
-->
</style>
</head>

<body>
<div align="left"></div>
<div align="left" class="style2">
  <div align="center"><%=admin.getName()%> 登錄次數:<%=(admin.getLogins()+1)%> 上次登錄時間︰<%=admin.getLastLogin()%> CopyRight(C)2012 CMS後台管理系統</div>
</div>
</body>
</html>