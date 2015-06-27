<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>


<div class="content">


<form name="getpswForm" action="../EmailAction" method="post"  onsubmit="return checkthis();">
 <div class="MEMBER">
    <div id="loginmodal">
	  <label for="username">輸入您的帳號:</label>
	  <input id="loginname" maxlength="20" class="txtfield" name="loginname" />
	  <label for="password">輸入您的E-mail:</label>
	  <input  id="email" maxlength="100" class="txtfield" name="email" />
	  <div class="center">
		<input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3">
	  </div>
	</div>
 </div>
	</form>

</div>



<script language="javascript1.2">
function  checkthis(){
  var name=document.getElementById("loginname").value;
  var email=document.getElementById("email").value;
  
   if(name==null||name=="")
   {
     alert("請輸入帳號﹗");
     return false;
   }
   if(email==null||email=="")
   {
     alert("請輸入您的電子郵箱﹗");
   }
   else if(email.indexOf("@")<=-1)
   {
     alert("您輸入的E-MAIL格式不正確，請重新輸入﹗");
	 return false;
   }
   else if(email.indexOf(".")<=-1)
   {
     alert("您輸入的E-MAIL格式不正確，請重新輸入﹗");
	 return false;
   }
   else 
     return true;
 
}
</script>





