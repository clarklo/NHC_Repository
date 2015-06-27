<%@ page contentType="text/html; charset=utf-8" language="java" import="java.io.*" isErrorPage="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>出錯了!</title>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
.style3 {
	font-size: 18px;
	color: #FFFFFF;
}
-->
</style>
</head>

<body>
<table width="95%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#0066FF">
  <tr bgcolor="#0033CC">
    <td><div align="left"><span class="style1"><span class="style3">  可能發生了下面的錯誤</span></span></div></td>
  </tr>
  <tr>
    <td height="300" align="left" valign="top"><p><%=exception.getMessage()%></p>    </td>
  </tr>
  <tr>
    <td height="300" align="left" valign="top"><p><%=exception.toString()%></p>    </td>
  </tr>
   <tr>
    <td height="300" align="left" valign="top"><p><%
    exception.printStackTrace();
    %></p>    </td>
  </tr>
</table>
</body>
</html>