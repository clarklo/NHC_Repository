<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>


<div class="content">


<form name="getpswForm" action="mod_psw.jsp" method="post"  onsubmit="return checkthis();">
 <div class="MEMBER">
    <div id="loginmodal">
	  <label for="username">輸入您的舊密碼:</label>
	  <input id="oldpassword" maxlength="20" class="txtfield" name="oldpassword" />
	  <label for="password">輸入您的新密碼:</label>
	  <input  id="newpassword" maxlength="100" class="txtfield" name="newpassword" />
	  <div class="center">
		<input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="OK" tabindex="3">
	  </div>
	</div>
 </div>
	</form>
</div>
<script language="javascript1.2">
function  checkthis(){
  var name=document.getElementById("oldpassword").value;
  var email=document.getElementById("newpassword").value;
  
   if(name==null||name=="")
   {
     alert("請輸入舊有密碼﹗");
     return false;
   }
   if(email==null||email=="")
   {
     alert("請輸入您的新密碼﹗");
  // }
  //  else if(email.indexOf("@")<=-1)
  //  {
  //    alert("您輸入的E-MAIL格式不正確，請重新輸入﹗");
  //	 return false;
  //  }
  // else if(email.indexOf(".")<=-1)
  // {
  //   alert("您輸入的E-MAIL格式不正確，請重新輸入﹗");
   return false;
   }
   else 
     return true;
}
</script>





