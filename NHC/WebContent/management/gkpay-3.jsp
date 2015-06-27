﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>Untitled Document</title>
<script type="text/javascript" src="../js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox.pack.js"></script>
<link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
	margin:0;
	padding: 0;
}
table {
	border-collapse:collapse;
	border-spacing:0;
	font-family: "新細明體";
}
fieldset, img {
	border:0;
}
address, caption, cite, code, dfn, em, strong, th, var {
	font-style:normal;
	font-weight:normal;
}
ol, ul {
	list-style:none;
}
caption, th {
	text-align:left;
}
/*h1, h2, h3, h4, h5, h6 {
	font-size:100%;
	font-weight:normal;
}*/
q:before, q:after {
	content:'';
}
abbr, acronym {
	border:0;
}
body,html{
	height:100%;
	font-family:"新細明體", "Microsoft JhengHei", "新細明體", "PMingLiU", AppleGothic, Dotum, Lucida Grande, Verdana Sans-serif;
    padding:0;
	background-color:#FFF;}
.clear{
	clear:both;}
.content{
	width:720px;
	min-height:250px;
	margin:10px;}

/*----收費流程------*/
.MemberCenter{
	margin-bottom:20px;
	margin-top:15px;}
.MemberCenter ul{}
.MemberCenter ul li{
	display:inline;
	margin-right:10px;
	font-size:16px;
	color:#333;}
.MemberCenter ul li a{
	text-decoration:none;
	font-size:14px;
	color:#333;}
.MemberCenter ul li a:hover{
	color:#C30;
	text-decoration:underline;}
.MemberCenter ul li .qqq{
	display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 3px 5px;
    border: 1px solid #ac9b2e;
    border-radius: 9px;
    background: #f5dd42;
    background: -webkit-gradient(linear, left top, left bottom, from(#f5dd42), to(#ac9b2e));
    background: -moz-linear-gradient(top, #f5dd42, #ac9b2e);
    background: linear-gradient(to bottom, #f5dd42, #ac9b2e);
    text-shadow: #ffff56 1px 1px 1px;
    font: normal normal bold 11px arial;
    color: #111111;
    text-decoration: none;}
.MemberCenter ul li .qqq:hover,
.qqq:focus {
    border: 1px solid #f5dd42;
    background: #ffff4f;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffff4f), to(#ceba37));
    background: -moz-linear-gradient(top, #ffff4f, #ceba37);
    background: linear-gradient(to bottom, #ffff4f, #ceba37);
    color: #111111;
    text-decoration: none;}
.MemberCenter ul li .qqq:active {
    background: #ac9b2e;
    background: -webkit-gradient(linear, left top, left bottom, from(#ac9b2e), to(#ac9b2e));
    background: -moz-linear-gradient(top, #ac9b2e, #ac9b2e);
    background: linear-gradient(to bottom, #ac9b2e, #ac9b2e);}
.Protection{
	width:400px;
	margin:15px auto;
	border:1px solid #E2E6FF;}
.Protection p{
	padding:15px;
	font-size:15px;
	color:#333;
	letter-spacing:1px;
	line-height:20px;}
.pay{}
.pay h1{
	background-image:url(../images/Charge_icon.png);
	background-repeat:no-repeat;
	background-position:0px 5px;
	font-size:18px;
	padding-left:18px;
	margin-left:10px;}
.pay h1 span{
	font-size:16px;
	margin-left:8px;
	color:#900;}
.pay img{
	margin:15px 10px;}
.Sickroom{
	margin-top:15px;
	margin-left:30px;}
.Sickroom table{}
.Sickroom th{
	text-align:center;
	padding:5px 0px;
	background-color:#D9F8FB;
	border-bottom:1px solid #69848F;
	font-size:16px;
	color:#34444C;}
.Sickroom td{
	padding:5px 0px;
	font-size:16px;
	color:#333;
	border-bottom:1px dotted #999999;}
.Sickroom td span{
	color:#900;
	font-weight:bold;}
.SUBMIT{
	width:580px;
	margin:10px auto;}
.SUBMIT ul{
	width:500px;
	text-align:center;}
.SUBMIT ul li{
	display:inline;
	margin-left:20px;}
.SUBMIT ul li .submit-button{
	display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 8px;
    border: 1px solid #4982a8;
    border-radius: 9px;
    background: #89d6fa;
    background: -webkit-gradient(linear, left top, left bottom, from(#89d6fa), to(#4a8cb8));
    background: -moz-linear-gradient(top, #89d6fa, #4a8cb8);
    background: linear-gradient(to bottom, #89d6fa, #4a8cb8);
    text-shadow: #345d78 1px 1px 1px;
    font: normal normal bold 16px arial;
    color: #ffffff;
    text-decoration: none;}

.SUBMIT ul li .submit-button:focus, .submit-button:hover{
    border: 1px solid #68b9f0;
    background: #a4ffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#a4ffff), to(#59a8dd));
    background: -moz-linear-gradient(top, #a4ffff, #59a8dd);
    background: linear-gradient(to bottom, #a4ffff, #59a8dd);
    color: #ffffff;
    text-decoration: none;
}
.SUBMIT ul li .submit-button:active {
    background: #528096;
    background: -webkit-gradient(linear, left top, left bottom, from(#528096), to(#4a8cb8));
    background: -moz-linear-gradient(top, #528096, #4a8cb8);
    background: linear-gradient(to bottom, #528096, #4a8cb8);
}
.member_title{
	display:block;
	width:640px;
	height:26px;
	float:left;
	margin-top:15px;
	margin-left:25px;}
.number{
	float:left;
	width:97px;
	height:23px;
	margin-right:15px;
	background-color:#215e92;
    border:none 5px #000000;
    -moz-border-radius-topleft: 7px;
    -moz-border-radius-topright:7px;
    -moz-border-radius-bottomleft:7px;
    -moz-border-radius-bottomright:7px;
    -webkit-border-top-left-radius:7px;
    -webkit-border-top-right-radius:7px;
    -webkit-border-bottom-left-radius:7px;
    -webkit-border-bottom-right-radius:7px;
    border-top-left-radius:7px;
    border-top-right-radius:7px;
    border-bottom-left-radius:7px;
    border-bottom-right-radius:7px;
	color:#FFF;
	font-size:16px;
	text-align:center;
	padding-top:3px;

}
.Explanation{
	float:left;
	width:518px;
	background-color:#cad4dc;
	height:23px;
	 border:none 5px #000000;
    -moz-border-radius-topleft: 7px;
    -moz-border-radius-topright:7px;
    -moz-border-radius-bottomleft:7px;
    -moz-border-radius-bottomright:7px;
    -webkit-border-top-left-radius:7px;
    -webkit-border-top-right-radius:7px;
    -webkit-border-bottom-left-radius:7px;
    -webkit-border-bottom-right-radius:7px;
    border-top-left-radius:7px;
    border-top-right-radius:7px;
    border-bottom-left-radius:7px;
    border-bottom-right-radius:7px;
	font-size:16px;
	padding-top:3px;
	color:#333;
	padding-left:10px;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.fancybox').fancybox({
			maxWidth	: 500,
			maxHeight	: 500,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none'
		});
	});
</script>
</head>
<%  
   //從表單中獲取數據  
   String stype= request.getParameter("stype");  
   String wsel1=request.getParameter("wsel1");  
   String wsel2= request.getParameter("wsel2"); 
   String wsel3= request.getParameter("wsel3"); 
   //驗證"名字(name)"的長度是否符合要求  
   if(wsel1.length()<1||wsel1.length()>5)  
      out.println("你輸入的長度不符合要求");  
   else  
   {  
      //out.println("你的項目是："+stype+"<br>");  
        //out.println("你的選項是："+wsel1+"<br>");  
        //out.println("你所從事的工作是："+wsel2+"<br>");
		  //out.println("你的選項是："+wsel3+"<br>"); 
      //將"名字(name)"保存到session對象中,讓後續頁面(下個頁面、下下個頁面、……)引用  
      session.setAttribute("stype",stype);
      session.setAttribute("wsel1",wsel1);
      session.setAttribute("wsel2",wsel2);
      session.setAttribute("wsel3",wsel3);
	  
   }  

%> 
<body>

<div class="content">
   <div class="pay">
   


    


  <form name="form1" method="post" action="gkpay-4.jsp">  
    <div class="member_title">
    <div class="number">STEP03:</div>
    <div class="Explanation">貴賓住宿選擇</div>
    </div>
    <div class="clear"></div> 
    <div class="Sickroom">
    <table width="630" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="8%" align="center">選擇</th>
    <th>病房類型</th>
    <th width="15%">價錢</th>
    <th width="30%">病房照片</th>
  </tr>
 
  <tr>
    <td align="center"><input value="1" name="house" type="radio" id="radio1" checked="checked" /></td>
    <td align="center">普通單人房</td>
    <td align="center"><span>4180</span></td>
    <td align="center">
	<a href="../images/Sickroom_big4180.png" class="fancybox" title="普通單人房4180">
		<img src="../images/Sickroom_smil4180.png" width="149" height="109" alt="普通單人房4180" /></a></td>
  </tr>
  <tr>
    <td align="center"><input value="2" name="house" type="radio" id="radio1" /></td>
    <td align="center">特等病房</td>
    <td align="center"><span>6160</span></td>
    <td align="center">
	<a href="../images/Sickroom_big6160.png" class="fancybox" title="特等病房(D級)6160">
		<img src="../images/Sickroom_smil6160.png" width="149" height="109" alt="特等病房(D級)6160" /></a></td>
  </tr>

  <tr>
    <td align="center"><input value="3" name="house" type="radio" id="radio1" /></td>
    <td align="center">尊榮國際病房</td>
    <td align="center"><span>7380</span></td>
    <td align="center">
	<a href="../images/Sickroom_big7380.png" class="fancybox" title="7380特等病房(A級)">
		<img src="../images/Sickroom_smil7380.png" width="149" height="109" alt="7380特等病房(A級)" /></a></td>
  </tr>
</table>
<div class="SUBMIT">
    <ul>
     <li><a href="javascript:history.go(-1)"><input class="submit-button" type="button" value="上一步" /></a></li>
     <li><input class="submit-button" type="submit" value="下一步" /></li>
     </ul>
   </div>
    </div>
    <div class="clear"></div> 
  
   </div>
   </div>
</form> 
</body>
</html>
