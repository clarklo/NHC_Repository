<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-線上預約</title>
<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>

<script type="text/javascript" src="../js/6-8-001-2.js"></script>
<script type="text/javascript" src="../siteadmin/lhgcalendar/lhgcore.js"></script>
<script type="text/javascript" src="../siteadmin/lhgcalendar/lhgcalendar.js"></script>
<script language="javascript">
function checkthis(){
  if(myform.l_email.value.indexOf("@")<=-1||myform.l_email.value.indexOf(".")<=-1)
  {
    alert("您輸入的電子郵箱格式錯誤，請重新輸入﹗");
	myform.l_email.focus;
	return false;
  }
  if(isNaN(myform.user_tel.value))
  {
     alert("電話號碼應為數字﹗");
	 myform.user_tel.focus;
	 return false;
  }
  
}
</script>
</head>
<body>
<jsp:include page="../sub/top.jsp" flush="true"/>
<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><img src="../images/menu_pic02.png" width="231" height="81" alt="線上預約" /></div>

<jsp:include page="../menu.jsp" flush="true"/>

  
   </td>
    <td valign="top">
    <table width="729" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="content_banner"><iframe src="../0023_2.html" width="726" height="176" align="top"  scrolling ="no" frameborder="0"></iframe></div></td>
  </tr>
  <tr>
    <td valign="top">
    <div class="title">
    <h1>線上預約</h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li>線上預約</li>
    </ul>
    </div>
     <div class="clear"></div>
    
	<jsp:include page="../sub/font.jsp"/>
	
    <div class="clear"></div>
    <!------編輯內容區-------------->
    <div class="content">
	  <div class="Reservation_btn">
	   <ul>
		   <li><input class="submitC" type="submit" value="一般預約" /></li>
		   <li><input class="submitB" type="submit" value="美容中心預約" onclick="location='../services/support2.jsp'" /></li>
	   </ul>
	  </div>
	
    <div class="write">
<h1>您可以透過下表預約掛號</h1>

<form name="myform"  method="post" action="addleav.jsp" onsubmit="return checkthis();">

    <table width="650" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="35%">姓名<span class="smail">Name：</span></th>
    <td width="65%"><input type="text" class="w_in10" size="20" name="l_user" /></td>
  </tr>
  <tr>
    <th>台灣健保卡<br /><span class="smail">ROC National Health Insurance</span>:</th>
    <td><label>
		<input type="radio" name="l_class_id" id="l_class_id" value="0" />無</label>
		<label><input type="radio" name="l_class_id" id="l_class_id" value="1" checked="checked" />有</label>
	</td>
  </tr>
  <tr>
    <th>出生西元年<span class="smail">BirthDate</span>:</th>
    <td>
		<input name="l_title" type="text" class="w_in10" id="l_title" size="20" onclick="J.calendar.get({dir:'right'});"/>

	</td>
  </tr>
  <tr>
    <th>性別<span class="smail">Gender</span>：</th>
    <td><label>
        <input type="radio" name="user_sex" id="user_sex" value="0" checked="checked" />
        男</label>
        <label>
		<input type="radio" name="user_sex"   id="user_sex" value="1" />
        女</label>
	</td>
  </tr>
  <tr>
    <th>國籍<span class="smail">Nationality</span>：</th>
    <td><input type="text" class="w_in10" size="30" name="user_company" /></td>
  </tr>
  <tr>
    <th>聯絡電話<span class="smail">TEL</span>：</th>
    <td><input id="user_tel" class="w_in10" type="text" maxlength="45" size="30" name="user_tel" /></td>
  </tr>
  <tr>
    <th>電子郵件<span class="smail">e-mail</span>：</th>
    <td><input type="text" class="w_in10" name="l_email" size="25" /></td>
  </tr>
  <tr>
    <th>聯絡地址<span class="smail">Contact Address</span>：</th>
    <td><input type="text" name="user_addr" class="w_in10" size="50" /></td>
  </tr>
  <tr>
	<th>留言：</th>
	<td><textarea name="l_content" class="w_in10" cols="40" rows="6"></textarea></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle"><p>我們將盡快與你聯絡</p></td>
    </tr>
</table>

 <div class="SUBMIT">
   <ul>
     <li><input class="submit-button" type="reset" value="重填" onclick="reset()" /></li>
     <li><input class="submit-button_c" type="submit" name="Submit3" value="確定" /></li>
   </ul>
</div>

</form>
</div>
    
    </div>
    
    
    <!------編輯內容區結束-------------->
    </td>
  </tr>
  <tr>
    <td valign="bottom">
		<jsp:include page="../sub/back.jsp"/>
    </td>
  </tr>
</table>
    </td>
  </tr>
</table>
<jsp:include page="../sub/foot_top.jsp"/>
</div>
</div>				  
<jsp:include page="../sub/foot.jsp" flush="true"/>

</body>
</html>