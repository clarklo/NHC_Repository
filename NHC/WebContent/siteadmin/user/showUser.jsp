<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.web.www.Userman"%>
<%@ page import="com.web.www.ProcessUserMan"%>
<%@ include file="../permission.jsp" %>
<%@ include file="../permission/permission8.jsp" %>
　　

<html>
<head>

<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.style1 {color: #FF0000}
.STYLE2 {color: #51CC5A}
-->
</style>
</head>
<%
  
  	String id=request.getParameter("id"); 
  	ProcessUserMan pu=new ProcessUserMan();
   	pu.getOneDate(id);
   	Userman user=pu.getUserman();
   
%>
<body>

<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td height="30" colspan="4" align="center" background="../images/tablebg.gif"><b>會員詳細訊息</b></td>
  </tr>
  <tr>
    <td width="12%" height="30" align="center"><strong>會員編號</strong></td>
    <td width="35%" align="left">&nbsp;<%=user.getUserManId()%></td>
    <td width="13%" align="center"><strong>帳號</strong></td>
    <td width="40%" align="left">&nbsp;<%=user.getUserManLoginName()%></td>
  </tr>
  <tr>
    <td align="center" height="30"><strong>真實姓名</strong></td>
    <td align="left">&nbsp;<%=user.getUserManName()%></td>
    <td align="center"><strong>手機號</strong></td>
    <td align="left"><%=user.getUserManMobile()%></td>
  </tr>
  <tr>
    <td align="center" height="30"><strong>性別</strong></td>
    <td align="left">&nbsp;<%=user.getUserManSex()%></td>
    <td align="center"><strong>生日</strong></td>
    <td align="left">&nbsp;<%=user.getUserManAge()%></td>
  </tr>
  <tr>
    <td align="center" height="30"><strong>地址</strong></td>
    <td align="left">&nbsp;<%=user.getUserManWork()%></td>
    <td align="center"><strong>登錄次數</strong></td>
    <td align="left"><%=user.getUserManLogintimes()%></td>
  </tr>
  
  <tr>
    <td align="center"><strong>審核狀態</strong></td>
    <td align="left"  colspan="3">&nbsp;
    <%if("1".equals(user.getUserManFlag())) out.print("通過"); else out.print("未通過");%></td>
  </tr>
  
  <tr>
    <td height="30" colspan="4" align="center"><a href="userGameList.jsp?id=<%=user.getUserManId()%>"></a>&nbsp;&nbsp;&nbsp;<a href="javascript:history.go(-1);"><img src="../images/1_r2_c6.jpg" width="50" height="25" border="0"></a></td>
  </tr>
</table>

<br>
</body>
</html>