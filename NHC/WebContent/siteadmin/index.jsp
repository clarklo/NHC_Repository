<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="error/error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>高雄榮民總醫院國際醫療中心-網站後台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="0"> 
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/sign.css" rel="stylesheet" type="text/css" media="all" />

<script language="javascript1.2">
<!--
function check(){
	if(login.username.value == ""){
		alert("帳號不能為空,請輸入您的帳號!");
		login.username.focus();
		return false;
	}
	if(login.password.value == ""){
		alert("密碼不能為空,請輸入您的密碼!");
		login.password.focus();
		return false;
	}
	if(login.checkcode.value == ""){
		alert("驗証碼不能為空,請輸入系統產生的驗証碼!");
		login.checkcode.focus();
		return false;
	}
	return true;
}

function selected(){
	login.username.focus();
}
-->
</script>
</head>

<body leftmargin="0" topmargin="0" onLoad="selected();">


<form name="login" action="processlogin.jsp" method=post onSubmit="return check();">

  
<div id="container">
<div class="hkhead">
<div class="hklogo"><img src="images/logo_pic.png" width="338" height="53" alt="logo" /></div>
</div>

<div class="content">
      

              <div class="fullshow">
                <div id="login_c">
              <div class="mlist">
                <table>
                  <tr>
                    <td colspan="2"><h1>管理系統</h1></td>
                  </tr>
                  <tr>
                    <td colspan="2">帳號 
                      <input name="username" type="text" id="username" size="20" maxlength="255" value="<%=(session.getAttribute("username") != null)?(String.valueOf(session.getAttribute("username"))):""%>" />
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">密碼
                    <input name="password" type="password" id="password" size="21" maxlength="255" />
                    </td>
                  </tr>
                  <tr>
                    <td>驗證碼
                        <input name="checkcode" type="text" id="checkcode" size="10" maxlength="4" /> 
                    </td>
                    <td>
                    <ul class="btn_login">
                    <li>
                        <img src="../checkcode/checkcode.jsp" border=0 align="absmiddle" /></li>
                    </ul>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                    <ul class="btn_login">
                    <li><input name="login" class="submitB" type="submit" id="login" value="登入" /></li> 
                    <li><input name="reset" class="submitB" type="reset" id="reset" value="重置" /></li>
                    </ul>
                    </td>
                  </tr>
                </table>
                 
                 </div>
                 </div>
        
           </div> 
        </div>
        
        
        </div>

  
  
  
  
  
  
</form>
</body>
</html>