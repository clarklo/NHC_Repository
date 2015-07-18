<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*"  %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
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
.SUBMIT_btn{
	width:580px;
	margin:10px auto;}
.SUBMIT_btn ul{
	width:500px;
	text-align:center;}
.SUBMIT_btn ul li{
	display:inline-block;
	margin-left:20px;
	border:none;}
.SUBMIT_btn ul li a{
	text-indent:-9999px;}

.SUBMIT_btn ul li a.up{
	display:block;
	width:95px;
	height:38px;
	border:none;
	background-image:url(../images/up.png);
	background-repeat:no-repeat;}
.SUBMIT_btn ul li a.up:hover{
	background-image:url(../images/up_c.png);}
.SUBMIT_btn ul li a.de{
	display:block;
	width:106px;
	height:38px;
	border:none;
	background-image:url(../images/de.png);
	background-repeat:no-repeat;}
.SUBMIT_btn ul li a.de:hover{
	background-image:url(../images/de_c.png);}
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
/*-----價錢計算-------*/
.Calculate{
	margin-top:15px;
	margin-left:30px;}
.Calculate table{
	background-color:#f4faff;}
.Calculate th{
	background-color:#dfdfe2;
	text-align:right;
	padding:6px;
	font-size:15px;
	color:#000;
	border-bottom:1px dotted #FFFFFF;}
.Calculate td{
	padding:5px;
	border-bottom:1px solid #dfdfdf;}
.Calculate td p{
	font-size:15px;
	margin-bottom:5px;}
.Calculate td span{
	color:#F30;}
.Calculate td.White{
	background-color:#FFF;}
.Calculate td p span{
	color:#F30;}
.Calculate td p.Note{
	color:#360;}
.Calculate td p.Comment{
	color:#C00;}
.Calculate td p span.rr{
	font-size:18px;
	color:#F00;
	font-weight:bold;
	margin:0 5px;}
.Calculate td p a{
	margin-left:20px;
	text-decoration:none;
	color:#03C;}
.Calculate td p a:hover{
	color:#8841AD;}
.CommentsThat{
	width:630px;
	margin-top:10px;
	margin-bottom:20px;}
.CommentsThat p{
	font-size:14px;
	margin-bottom:5px;
	letter-spacing:1px;
	line-height:20px;
	color:#ee6a00;}
</style>
</head>

<body>
<%
Operation op = new Operation();
ResultSet rs = null;

//int id = 0;
String type0 = "";
String name0 = "";

String introduce0 = "無!";



   //從sessoin對象中獲取數據  
   String stype=(String)session.getAttribute("stype");  
   String wsel=(String)session.getAttribute("wsel");  
   String roomID= request.getParameter("room"); 
   int totalCountLow =0 ;
   int totalCountHigh=0 ;
   int roomPay=0 ;
    String roomName="";
   if (roomID==null){
       roomPay=0 ;
   }else 
   {
        rs = op.query("select * from PAYROOM where room_id='"+roomID+"'");
        rs.next();
         roomPay=rs.getInt("Room_PAY");
         roomName=rs.getString("Room_Name");
   }
  
  
  
   rs = op.query("select * from paycont where pay_id='"+wsel+"'");
   rs.next();
   String PAY_TYPE_CHT=rs.getString("PAY_TYPE_CHT");
    if (stype.equals("A")) {
        totalCountLow=rs.getInt("pay_001")+(rs.getInt("pay_001") * rs.getInt("pay_003") )+rs.getInt("pay_004")+rs.getInt("pay_006")+(rs.getInt("pay_XCODE") * roomPay ) ;
        totalCountHigh=rs.getInt("pay_002")+(rs.getInt("pay_002") * rs.getInt("pay_003") )+rs.getInt("pay_005")+rs.getInt("pay_007")+(rs.getInt("pay_LOGS") * roomPay ) ;
    }else if (stype.equals("B")) {
        totalCountLow= rs.getInt("pay_001")+(rs.getInt("pay_001") * rs.getInt("pay_003") )+(rs.getInt("pay_001") * rs.getInt("pay_004") )+(rs.getInt("pay_XCODE") * roomPay ) ;
        totalCountHigh=rs.getInt("pay_002")+(rs.getInt("pay_002") * rs.getInt("pay_003") )+(rs.getInt("pay_002") * rs.getInt("pay_004") )+(rs.getInt("pay_LOGS") * roomPay ) ;
    }else if (stype.equals("C")) {
        totalCountLow=rs.getInt("pay_001")+rs.getInt("pay_003")+rs.getInt("pay_005")+rs.getInt("pay_007") ;
        totalCountHigh=rs.getInt("pay_002")+rs.getInt("pay_004")+rs.getInt("pay_006")+rs.getInt("pay_008") ;
    }
    op.closestmt();
 
%> 
<div class="content">
   <div class="pay">
  
    <div class="member_title">
    <div class="number">STEP04:</div>
    <div class="Explanation">預估總費用</div>
    </div>
    <div class="clear"></div> 
    <div class="Calculate">
    <table width="630" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="15%">醫療名稱：</th>
    <td><p><%=PAY_TYPE_CHT%></p>
    <span></span>
    </td>
  </tr>
  <tr>
    <th>病房類型：</th>
    <td><p>
    <%=roomName%>
    </p>
    </td>
  </tr>
  
  <tr>
    <td colspan="2" class="White">
    <p class="Note">90%病患治療參考價格</p>
   <p class="Comment">(包含麻醉、手術、檢查、診療、病患飲食、病房費及術後諮詢等相關費用，術後休養居所費與國內交通費另計)</p></td>
    </tr>
  <tr>
    <th>試算金額：</th>
    <td><p>新台幣<span class="rr">
   
    &nbsp;<%=totalCountLow%>
    ~
    &nbsp;<%=totalCountHigh%>
    元</span><a href="https://tw.money.yahoo.com/currency_exc_result?amt=1&from=USD&to=TWD" target="new">匯率換算</a></p>
    </td>
  </tr>
</table>
  <div class="CommentsThat">
  <p>1.以上醫療服務價格以新台幣計價並受國內各醫院規模大小、地區、物價指數、技術新穎性及醫護人員比例而有所差異。</p>
  <p>2.實際價格煩請洽詢各醫院服務窗口。 
*90%病患治療價格代表90%的病患支付此價格或更低價格，而另外10%的病患支付比此更高的治療價格。</p>
  </div>
    </div>
    <div class="SUBMIT">
   <ul>
   
<li><a href="javascript:history.go(-1)" class="up"><img src="../images/up.png"" alt="上一步"></a></li>
  <li><a href="javascript:history.go(-2)" class="de"><img src="../images/de.png"" alt="清除重選"></a></li>
   </ul>
   </div>
   
    
    
    
    
    
   </div>
    
    
    
    
    
    
    </div>

</body>
</html>
