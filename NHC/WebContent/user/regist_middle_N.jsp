<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="com.web.database.Operation" %>



<script  language="javascript">
function registCheck(){
	if(document.registForm.registname.value=="")
	{
		alert("帳號不能為空﹗");
		document.registForm.registname.focus();
		return false;
	}
	if (document.registForm.registname.value.length > 13 || document.registForm.registname.value.length < 5)
    { 
        alert("帳號長度介於6-12個英文字母、數字組成﹗");
		document.registForm.registname.focus();
		return false;
     }
	var txt1=window.document.registForm.registname;
	var regs='^[a-z0-9A-Z]+$';
	var re=new RegExp(regs);
	var rc=re.exec(txt1.value);
	if(rc==null)
	{
		window.alert('帳號只可由6-12個英文字母、數字組成');
		txt1.focus();
		txt1.select();
		return false;
	}
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
	//emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	emailRule =/^([a-z0-9])(([-a-z0-9._])*([a-z0-9]))*\@([a-z0-9])'.'(([a-z0-9-])*([a-z0-9]))+'.'(\.([a-z0-9])([-a-z0-9_-])?([a-z0-9])+)+$/
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

	
	if(document.registForm.password.value=="")
	{
		alert("密碼不能為空﹗");
		document.registForm.password.focus();
		return false;
	}
	if(document.registForm.password.value!=document.registForm.confirmPassword.value)
	{
		alert("兩次密碼不一致﹗");
		document.registForm.confirmPassword.focus();
		return false;
	}
	return true;
}
</script>
<script type="text/javascript" src="../siteadmin/lhgcalendar/lhgcore.js"></script>
<script type="text/javascript" src="../siteadmin/lhgcalendar/lhgcalendar.js"></script>

<form name="registForm" action="regist_do.jsp" method="post">
	
	


   <div class="FlowChart">
     <img src="../images/Member_FlowChart.png" width="638" height="87" alt="加入會員流程圖" /> 
    <div class="member_title">
    <div class="number">STER01:</div>
    <div class="Explanation">病患資料</div>
    </div>
    <div class="clear"></div> 
    <div class="write">
<table width="630" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th><span>*</span>帳號：</th>
    <td>
	<input name="registname" class="w_in10" class="input" id="registname" size="16" maxlength="20"  onkeyup="^[a-zA-Z]\w{5,11}$" />
	<p>6-12個字符(包括小寫字母、數字)</p>
    </td>
  </tr>
  <tr>
    <th width="20%"><span>*</span>姓名：</th>
    <td width="80%">
	<input name="name" class="w_in10" class="input" size="16" maxlength="20" />
	</td>
  </tr>
  <tr>
    <th>病歷號碼：</th>
    <td>
	<input name="bankcard" class="w_in10" class="input" id="bankcard" size="18" maxlength="20" />
<p>5-20個字符(包括小寫字母、數字)</p>
	</td>
  </tr>
  <tr>
    <th><span>*</span>密碼：</th>
    <td>
	<input name="password" class="w_in10" type="password" class="input" id="password" title="請牢記您的密碼" size="12" maxlength="12" />
	<p>密碼長度為6-12個字符。</p></td>
  </tr>
  <tr>
    <th><span>*</span>密碼確認：</th>
    <td>
	<input name="confirmPassword" class="w_in10" type="password" class="input" id="confirmPassword" title="請牢記您的密碼" size="12" maxlength="12" />
	<p>請再輸入一遍您上面輸入的密碼。</p></td>
  </tr>
  <tr>
    <th>性別：</th>
    <td><label>
		<input name="sex" type="radio" value="男" checked="checked" />男
        </label>
        <label>
		<input type="radio" value="女" name="sex" />女
        </label>
	</td>
  </tr>
  <tr>
    <th>出生年月日：</th>
    <td>
	<input name="age" class="w_in10" type="text" id="date" size="20" onClick="J.calendar.get({dir:'right'});"/>
	</td>
  </tr>
  <tr>
    <th><span>*</span>行動電話：</th>
    <td>
	<input name="Mobile" class="w_in10" class="input" id="Mobile" size="18" maxlength="30" />
	<p>行動電話號碼請填寫 例:0988123456</p>
	</td>
  </tr>
  <tr>
    <th>聯絡地址：</th>
    <td>
	<input name="work" class="w_in10" class="input" id="work" size="18" maxlength="30" />
	</td>
  </tr>
  <tr>
    <th><span>*</span>電子信箱：</th>
    <td>
	<input name="email" class="w_in10" class="input" id="email" size="30" />
	</td>
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
					
					

              


