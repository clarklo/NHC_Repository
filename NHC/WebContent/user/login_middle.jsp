<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="com.web.database.Operation" %>

<script language="javascript">
function loginChedk(){
	if(document.loginForm.loginname.value==""){
		alert("請輸入登入名");
		return false;
	}
	if(document.loginForm.password.value==""){
		alert("請輸入登入密碼");
		return false;
	}
	return true;
}
</script>

<div class="content">
    <form  name="loginForm" action="../user/login_do.jsp" method="post"  onsubmit="return loginChedk();"> 
    <div class="MEMBER">
    <div id="loginmodal">
    

      <label for="username">帳號:</label>
      <input name="loginname" type="text" class="txtfield" id="loginname" size="20" />
      
      <label for="password">密碼:</label>
      <input name="password" type="password"  id="password" size="20"  class="txtfield" />
      
      <div class="center">
	  <input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3"></div>

    <div class="Forget">
    <ul>
    <li class="JJ"><a href="regist.jsp">加入會員</a></li>
    </ul>
    </div>
  </div>
  
  
  
  
    </div>
    
  
        </form>        
    
    </div>
    