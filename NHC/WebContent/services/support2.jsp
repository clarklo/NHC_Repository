<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-美容醫學中心線上預約</title>
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
    <div class="menu_title"><img src="../images/menu_pic02.png" width="231" height="81" alt="美容醫學中心線上預約" /></div>

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
    <h1>美容中心線上預約</h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li>美容中心線上預約</li>
    </ul>
    </div>
     <div class="clear"></div>
    
	<jsp:include page="../sub/font.jsp"/>
	
    <div class="clear"></div>
    <!------編輯內容區-------------->



<div class="content">
  <div class="Reservation_btn">
	<ul>
		<li><input class="submitB" type="submit" value="一般預約" onclick="location='../services/support.jsp'"/></li>
		<li><input class="submitC" type="submit" value="美容中心預約" /></li>
	</ul>
  </div>
  
  <form name="myform"  method="post" action="addleav1.jsp" onsubmit="return checkthis();">
	  <div class="Reservation">
	   <div class="explain">
		  <p>若你有任何美麗方面的問題，歡迎隨時提出，我們將有專業人員為您解答，並回覆給您。<br />
			（此詢問之相關之個人資料，基於個人隱私之保護原則，個人資料不外洩，敬請放心詢問。）</p>
	   </div>
	 
	   <h1>請選擇想要諮詢的項目：</h1>
	   <ul>
		 <li><input type="radio" name="l_title" value="午休美容-玻尿酸/肉毒桿菌-為整形注射" checked="checked"> 午休美容-玻尿酸/肉毒桿菌-為整形注射</li>
		 <li><input type="radio" name="l_title" value="遇髮/健髮雷射"> 遇髮/健髮雷射</li>
		 <li><input type="radio" name="l_title" value="隆乳"> 隆乳</li>
		 <li><input type="radio" name="l_title" value="脈衝光"> 脈衝光</li>
		 <li><input type="radio" name="l_title" value="乳房重建"> 乳房重建</li>
		 <li><input type="radio" name="l_title" value="電波/光波/內視鏡拉皮"> 電波/光波/內視鏡拉皮</li>
		 <li><input type="radio" name="l_title" value="淨膚雷射"> 淨膚雷射</li>
		 <li><input type="radio" name="l_title" value="雷射除毛"> 雷射除毛</li>
		 <li><input type="radio" name="l_title" value="隆鼻"> 隆鼻</li>
		 <li><input type="radio" name="l_title" value="抽脂"> 抽脂</li>
		 <li><input type="radio" name="l_title" value="磨皮除疤"> 磨皮除疤</li>
		 <li><input type="radio" name="l_title" value="雙眼皮手術"> 雙眼皮手術</li>
		 <li><input type="radio" name="l_title" value="變性手術"> 變性手術</li>
		 <li><input type="radio" name="l_title" value="狐臭旋轉刀"> 狐臭旋轉刀</li>
		 <li><input type="radio" name="l_title" value="其他"> 其他</li>
	   </ul>
	 
	 
	   <h1>諮詢內容：</h1>
	   <ul>
		<li><textarea name="l_content" class="w_in10" cols="80" rows="4"></textarea></li>
	   </ul>
	 
	 
	   <h1>基本資料：</h1>
	   <p>(<span>*</span>為必要項目，請確認以上資料無誤，我們將請專業人員儘速與您聯絡，謝謝！）</p>
	   <ul>
		<li><span>*</span>姓名：
			<input id="l_user" class="w_in10" type="text" name="l_user">
		</li>
		<li><span>*</span>性別：
			<label>
        <input type="radio" name="user_sex" id="user_sex" value="男" checked="checked" />
        男</label>
        <label>
		<input type="radio" name="user_sex"   id="user_sex" value="女" />
        女</label>
		</li>
		<li><span>*</span>e-mail：
			<input name="l_email" class="w_in10" type="text" maxlength="45" size="40">
		</li>
		<li><span>*</span>電話：
			<input name="user_tel" class="w_in10" type="text" maxlength="16" size="20">
		</li>
	   </ul>
	 	 
	   <h1>請選擇方便聯絡時間：</h1>
	   <ul>
		<li><input name="user_company" type="radio" value="08:00~10:00" checked="checked"> 08:00~10:00</li>
		<li><input name="user_company" type="radio" value="10:00~12:00"> 10:00~12:00</li>
		<li><input name="user_company" type="radio" value="12:00~14:00"> 12:00~14:00</li>
		<li><input name="user_company" type="radio" value="14:00~16:00"> 14:00~16:00</li>
		<li><input name="user_company" type="radio" value="16:00~18:00"> 16:00~18:00</li>
	   </ul>
	   
	   <div class="SUBMIT">
		 <ul>
			<li><input class="submit-button" type="submit" value="送出" /></li>
		 </ul>
	   </div>
	   
	  </div>
  </form>
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