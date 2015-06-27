<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*,com.web.util.*"%>
<%@ page import="com.web.database.Operation" %>
<%
Operation op = new Operation();
ResultSet rs = null;

String id = "0";
String title0 = "";
String author0 = "";
String date0 = "";
String keyword0 = "";
String summary0 = "";
String html0 = "";
String content0 = " ";
String indexImage0 = "";
String commemd0 = "";
            
if((String)session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
	rs = op.query("SELECT user_man_loginname,user_man_name,user_man_bankcard,user_man_password,user_man_sex,user_man_age,user_man_mobile,user_man_work,user_man_email FROM user_man WHERE user_man_id='"+id+"'");
	rs.next();
    //帳號
	title0 = rs.getString("user_man_loginname");
	//姓名
	author0 = rs.getString("user_man_name");
	//病例號碼
	date0 = rs.getString("user_man_bankcard");
	//if(date0.length()>10)
	//    date0=date0.substring(0,10);
	//密碼
	keyword0 = rs.getString("user_man_password");
	//性別
	summary0 = rs.getString("user_man_sex");
	//生日
	html0 = rs.getString("user_man_age");
	//手機
	content0 = rs.getString("user_man_mobile");
	//地址
	indexImage0 = rs.getString("user_man_work");
	//email
	commemd0 = rs.getString("user_man_email");
	op.closestmt();
}
%>
<script  language="javascript">
function registCheck(){
	
	if(document.registForm.name.value=="")
	{
		alert("請填寫姓名﹗");
		document.registForm.name.focus();
		return false;
	}
	
	if(document.registForm.email.value=="")
	{
		alert("電子郵箱不能為空﹗");
		document.registForm.email.focus();
		return false;
	}
    var strEmail = document.registForm.email.value;
	emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	if(strEmail.search(emailRule)<= -1){
	    alert("電子郵件信箱格式錯誤﹗");
	    document.registForm.email.focus();
		return false;      
	}
	if (document.registForm.email.value.length > 33 || document.registForm.email.value.length < 9)
    { 
        alert("電子郵件信箱長度格式錯誤﹗");
		document.registForm.email.focus();
		return false;
     }
	if(document.registForm.Mobile.value=="")
	{
		alert("行動電話號碼不能為空﹗");
		document.registForm.Mobile.focus();
		return false;
	}
   cell_phone=document.registForm.Mobile.value;
    if(cell_phone.length==0)
    {
    alert("行動電話號碼不能為空﹗");
		document.registForm.Mobile.focus();
		return false;
    }
    if(cell_phone.length!=10)
    {
    alert("行動電話號碼長度錯誤﹗");
		document.registForm.Mobile.focus();
		return false;
    }
    if(isNaN(cell_phone))
    {
    alert("行動電話號碼不能為中文﹗");
		document.registForm.Mobile.focus();
		return false;
    } 

	return true;
}
</script>
<script type="text/javascript" src="../siteadmin/lhgcalendar/lhgcore.js"></script>
<script type="text/javascript" src="../siteadmin/lhgcalendar/lhgcalendar.js"></script>

<form name="registForm" action="moduser_do.jsp" method="post">
	
	


   <div class="FlowChart">
      
    <div class="member_title">
    <div class="number">STEP01:</div>
    <div class="Explanation">病患資料</div>
    </div>
    <div class="clear"></div> 
    <div class="write">
<table width="630" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th><span>*</span>帳號：</th>
    <td><%=title0%>
    </td>
  </tr>
  <tr>
    <th width="20%"><span>*</span>姓名：</th>
    <td width="80%">
	<input name="name" class="w_in10" class="input" value="<%=author0%>" size="16" maxlength="20" />
	</td>
  </tr>
  <tr>
    <th>病歷號碼：</th>
    <td>
	<input name="bankcard" class="w_in10" class="input" id="bankcard" value="<%=date0%>" size="18" maxlength="20" />
<p>5-20個字符(包括小寫字母、數字)</p>
	</td>
  </tr>
 
  <tr>
    <th>性別</th>
    <td><%=summary0%></td>
  </tr>
  <tr>
    <th>出生年月日：</th>
    <td>
	<input name="age" class="w_in10" type="text" id="date" value="<%=html0%>" size="20" onClick="J.calendar.get({dir:'right'});"/>
	</td>
  </tr>
  <tr>
    <th><span>*</span>行動電話：</th>
    <td>
	<input name="Mobile" class="w_in10" class="input" id="Mobile" value="<%=content0%>" size="18" maxlength="30" />
	<p>行動電話號碼請填寫 例:0988123456</p>
	</td>
  </tr>
  <tr>
    <th>聯絡地址：</th>
    <td>
	<input name="work" class="w_in10" class="input" id="work" value="<%=indexImage0%>" size="18" maxlength="30" />
	</td>
  </tr>
  <tr>
    <th><span>*</span>電子信箱：</th>
    <td>
	<input name="email" class="w_in10" class="input" value="<%=commemd0%>" id="email" size="30" />
	</td>
  </tr>
  <tr>
      <input name="mid" type="hidden" id="mid" value="<%=id%>">
      <input name="loginname" type="hidden" id="loginname" value="<%=title0%>">
      <input name="password" type="hidden" id="password" value="<%=keyword0%>">
      <input name="sex" type="hidden" id="sex" value="<%=summary0%>">
  </tr>
</table>
   <div class="SUBMIT">
   <ul>
   <li><input class="submit-button" type="submit" value="送出" onclick="return registCheck();" /></li>
   <li><input class="submit-button" type="reset" value="重填" onclick="reset();" /></li>
   </ul>
   </div>

    </div>
   </div>




</form>
					
					

              


