<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script language="javascript1.2">
<!--
function check(){
	if(modpass.oldPassword.value == ""){
		alert("舊密碼不能為空,請輸入您的舊密碼!");
		
		modpass.oldPassword.focus();
		return false;
	}
	if(modpass.newPassword.value == ""){
		alert("新密碼不能為空,請輸入您的新密碼!");
		
		modpass.newPassword.focus();
		return false;
	}
	if(modpass.confirmPassword.value != modpass.newPassword.value){
		alert("前後兩次輸入的密碼不一致，請重新輸入新密碼﹗");
		return false;
	}
	return true;
}

function selected(){
	modpass.oldPassword.focus();
}
-->
</script>
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body onLoad="selected();">
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="7" align="center" height="30" background="images/tablebg.gif"><b>修 改 密 碼</b></td>
  </tr>
  <form name="modpass" method="post" action="processmodpass.jsp" onSubmit="return check();">
  <tr> 
    <td width="33%" height="25" align="center"><div align="right">舊 密 碼︰</div></td>
    <td width="67%" align="center"><div align="left">
      <input name="oldPassword" type="password" id="oldPassword" size="40" maxlength="255">
      <span class="style2">*</span></div></td>
  </tr>
  <tr>
    <td height="25" align="center"><div align="right">新 密 碼︰</div></td>
    <td height="25" align="center"><div align="left">
      <input name="newPassword" type="password" id="newPassword" size="40" maxlength="255">
      <span class="style2">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">確認密碼︰</div></td>
    <td height="25" align="center"><div align="left">
      <input name="confirmPassword" type="password" id="confirmPassword" size="40" maxlength="255">
      <span class="style2">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" colspan="2" align="center">
      <div align="center">
        <input type="submit" name="Submit" value="提交">
         <input name="Reset" type="reset" id="Reset" value="重置">
      </div></td>
  </tr>
  </form>
</table>
</body>
</html>