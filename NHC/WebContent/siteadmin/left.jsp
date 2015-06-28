<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@include file="permission.jsp"%>
<%
com.web.www.Admin admin = (com.web.www.Admin)session.getAttribute("admin");
String permission = admin.getPermission();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 2</title>
<base target="main">
<link href="css/cool.css" rel="stylesheet" type="text/css">
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
   var obj1= "ss" + sid
   whichEl = eval("submenu" + sid);
   if (whichEl.style.display == "none")
   {
      eval("submenu" + sid + ".style.display=\"\";");
      document.all.item(obj1).src='images/hide.GIF';
   }
   else
   {
      eval("submenu" + sid + ".style.display=\"none\";");
      document.all.item(obj1).src='images/show.gif';
   }
}

</SCRIPT></head>

<body topmargin="0" leftmargin="0">

<table border="0" width=158 align=center cellpadding="0" cellspacing="0" height="38">
  <tr>
    <td width="156" background="images/title.gif" height="24" colspan="2">
      <p align="center"><b><font color="#FFFFFF">&nbsp;功能選單</font></b></td>
  </tr>
  <tr>
    <td class="menu" background="images/bg.GIF">
      <p align="center"><b><a href="function.jsp">首 頁</a></b> | <b><a href="logout.jsp" target="_parent">退 
        出</a></b></td>                                   
    <td width="26" height=25"><img border="0" src="images/quit.GIF" width="25" height="25"></td>
  </tr>
</table>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="156">
  <tr onClick="showsubmenu(1)" style="cursor: hand">
    <td class="menu" background="images/bg.GIF">&nbsp;<b>訊息管理</b></td>
    <td width="26"><img id=ss1 border="0" src="images/hide.GIF" width="25" height="25"></td>
  </tr>
  <tr>
    <td colspan="2" width="154" style="display:" id='submenu1'>
    <div class=sub_menu style="width:158">
	    <table cellpadding=0 cellspacing=0 align=center width=135>
         
          <tr>
            <td height=20> <p align="center"><a href="admin.jsp">訊息管理</a></p></td>
          </tr>
         
		   <!--<tr>
            <td height=20><div align="center"><a href="docupload.jsp">下載管理</a></div></td>
          </tr>-->
          
         <tr>
            <td height=20><div align="center"><a href="friendsite.jsp">連結管理</a></div></td>
          </tr>
         
          <tr>
            <td height=20><div align="center"><a href="admin1.jsp?pid=124&no=8">新聞管理</a></div></td>
          </tr>
          
        </table>
	  </div>
    </td>
  </tr>
</table>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="156">
  <tr onClick="showsubmenu(2)" style="cursor: hand">
    <td class="menu" background="images/bg.GIF">&nbsp;<strong>會員管理</strong></td>
    <td width="26"><img id=ss2 border="0" src="images/hide.GIF" width="25" height="25"></td>
  </tr>
  <tr>
    <td colspan="2" width="154" style="display:" id='submenu2'>
    <div class=sub_menu style="width:158">
	    <table cellpadding=0 cellspacing=0 align=center width=135>
          <tr>
            <td height=20> <p align="center">
            <a href="user/UserList" target="main">會員管理</a>
          </p></td>
          </tr>
          <tr>
            <td height=20> <p align="center">
            <a href="user/mailInput.jsp" target="main">發信通知</a>
          </p></td>
          </tr>
         
        </table>
	  </div>
    </td>
  </tr>
</table>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="156">
  <tr onClick="showsubmenu(3)" style="cursor: hand">
    <td class="menu" background="images/bg.GIF">&nbsp;<strong>預約管理</strong></td>
    <td width="26"><img id=ss3 border="0" src="images/hide.GIF" width="25" height="25"></td>
  </tr>
  <tr>
    <td colspan="2" width="154" style="display:" id='submenu3'>
    <div class=sub_menu style="width:158">
	    <table cellpadding=0 cellspacing=0 align=center width=135>
          
          <tr>
            <td height=20> <p align="center">
            <a href="wordList1.jsp" target="main">一般預約管理</a>
          </p></td>
          </tr>
          <tr>
            <td height=20> <p align="center">
            <a href="wordList2.jsp" target="main">美容預約管理</a>
          </p></td>
          </tr>
          
        </table>
	  </div>
    </td>
  </tr>
</table>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="156">
  <tr onClick="showsubmenu(4)" style="cursor: hand">
    <td class="menu" background="images/bg.GIF">&nbsp;<strong>收費標準管理</strong></td>
    <td width="26"><img id=ss4 border="0" src="images/hide.GIF" width="25" height="25"></td>
  </tr>
  <tr>
    <td colspan="2" width="154" style="display:" id='submenu4'>
    <div class=sub_menu style="width:158">
	    <table cellpadding=0 cellspacing=0 align=center width=135>
          
          <tr>
            <td height=20> <p align="center">
            <a href="PayContAdmin.jsp" target="main">醫療項目管理</a>
          </p></td>
          </tr>
          <tr>
            <td height=20> <p align="center">
            <a href="PatientRoomAdmin.jsp" target="main">病房資料管理</a>
          </p></td>
          </tr>
          
        </table>
	  </div>
    </td>
  </tr>
</table>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="156">
  <tr onClick="showsubmenu(5)" style="cursor: hand">
    <td class="menu" background="images/bg.GIF">&nbsp;<b>系統管理</b></td>
    <td width="26"><img id=ss5 border="0" src="images/hide.GIF" width="25" height="25"></td>
  </tr>
  <tr>
    <td colspan="2" width="154" style="display:" id='submenu5'>
    <div class=sub_menu style="width:158">
	<table cellpadding=0 cellspacing=0 align=center width=135 height="43">
	
	<tr>
            <td height=20 align="center"><a href="manager.jsp" target="main">管 理 員</a></td>
	</tr>
	<tr>
	  <td height=20 align="center" valign="middle"><a href="modpass.jsp">修改密碼</a></td>
	</tr>
</table>
	  </div>
    </td>
  </tr>
</table>
<br>
<br>
</body>

</html>
