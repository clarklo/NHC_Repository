<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission2.jsp"%>
<%
Operation op = new Operation();
ResultSet rs = null;

int id = 0;
String username0 = "";
String password0 = "";
String name0 = "";
String permission0 = "";
int isAdmin0 = 0;
if(request.getParameter("id")!=null){
	id = Integer.parseInt(request.getParameter("id"));
	rs = op.query("SELECT * FROM cms_admin WHERE cms_admin_id="+id);
	rs.next();
	username0 = rs.getString("cms_admin_id");
	password0 = rs.getString("cms_admin_psw");
	name0 = rs.getString("cms_admin_name");
	permission0 = rs.getString("cms_admin_auth");
	isAdmin0 = rs.getInt("cms_admin_system");
	
	op.closestmt();
}
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script language="javascript1.2">
<!--
function check(){
	if(manager.username.value == ""){
		alert("用戶名不能為空,請輸入您的用戶名!");
		manager.username.focus();
		return false;
	}
	if(manager.password.value == ""){
		alert("密碼不能為空,請輸入您的密碼!");
		
		manager.password.focus();
		return false;
	}
	if(manager.confirmPassword.value != manager.password.value){
		alert("前後兩次輸入的密碼不一致，請重新輸入密碼﹗");
		return false;
	}
	if(manager.name.value == ""){
		alert("姓名不能為空,請輸入您的姓名!");
		manager.name.focus();
		return false;
	}
	return true;
}
function del_check(id,p)
{
	var ok;
	ok=confirm("您是確定要刪除【"+p+"】嗎？");
	if(ok)
	{
		self.location.href="delmanager.jsp?id="+id;
	}
}
function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'checkall')
       e.checked = form.checkall.checked;
    }
}

function selected(){
	manager.username.focus();
}
-->
</script>
<style type="text/css">
<!--
.style1 {color: #F4EEE4}
.style2 {color: #FF0000}
-->
</style>
</head>

<body <%if(id==0){%>onLoad="selected();"<%}%>>
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="11" align="center" height="30" background="images/tablebg.gif"><b>管&nbsp;&nbsp;理&nbsp;&nbsp;員</b></td>
  </tr>
  <form name="manager" method="post" action="<%if(id==0){%>addmanager.jsp<%}else{%>modmanager.jsp?id=<%=id%><%}%>" onSubmit="return check();">
  <tr> 
    <td height="25" colspan="6" align="center"><div align="left">用 戶 名︰ 
          <input name="username" type="text" id="username" size="30" maxlength="255" <%if(id!=0){%>disabled<%}%> value="<%=username0%>">
          <span class="style2">*</span></div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">真實姓名︰
          <input name="name" type="text" id="name" size="30" maxlength="80" value="<%=name0%>">
          <span class="style2">*</span></div></td>
  </tr>  
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">密 <span class="style1">一</span> 碼︰ 
          <input name="password" type="password" id="password2" size="33" maxlength="255" value="<%=password0%>">
          <span class="style2">*</span></div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">確認密碼︰ 
          <input name="confirmPassword" type="password" id="confirmPassword" size="33" maxlength="255" value="<%=password0%>">
          <span class="style2">*</span></div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">管理權限︰
          <%
	rs = op.query("SELECT * FROM cms_fun where cms_fun_class='1' ORDER BY cms_fun_id ASC");
	int i = 0;
	while(rs.next()){
		i++;
	%>
          <input name="permission<%=i%>" type="checkbox" id="permission" <%if(id != 0){if(permission0.charAt(i-1) == 'Y'){%>checked<%}}%> <%if(isAdmin0 == 1){%>disabled<%}%> value="<%=rs.getInt("cms_fun_id")%>">
          <%=rs.getString("cms_fun_name")%>
          <%if(i==11) break;
	}
	%>
          <input type="hidden" name="funcNum" value="<%=i%>">
    </div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><input type="submit" name="Submit" value="<%if(id==0){%>添 加<%}else{%>修 改<%}%>"> <input name="Reset" type="reset" id="Reset" value="重 置"></td>
  </tr>
  </form>
    <%
  	//當前頁
	int currPage = 1;
	//每頁的記錄數
	int pageSize = 10;
	//總記錄數
	int totalRecord = 0;
	//總頁數 
	int pageCount = 0; 
	//獲得記錄總數
	rs = op.query("SELECT COUNT(*) AS total FROM cms_admin where cms_admin_id<>2");
	while(rs.next()){
		totalRecord = rs.getInt("total");
	}
	//獲得總頁數
	pageCount = ((totalRecord % pageSize) == 0)?(totalRecord/pageSize) : (totalRecord/pageSize) + 1;

	//獲得當前頁數
	String p = request.getParameter("page");
	if(p != null && p != ""){
		currPage = Integer.parseInt(p);
	}
	//獲得導航條
	String navigator = Pagable.navigator(currPage, pageSize, pageCount, totalRecord);

	//獲得當前頁的記錄集
	//rs = op.query("SELECT top " + pageSize + " * FROM cms_admin where cms_admin_id NOT IN (SELECT TOP " + ((currPage - 1) * pageSize)+ " cms_admin_id from cms_admin ORDER BY cms_admin_id DESC) ORDER BY cms_admin_id DESC");
 	//##mysql##rs = op.query("SELECT * FROM cms_admin ORDER BY cms_admin_id DESC  limit "+((currPage - 1) * pageSize)+"," + pageSize);
	rs = op.query("SELECT * FROM cms_admin where cms_admin_id<>2 ORDER BY cms_admin_id DESC ");
  %>
  <form name="form1" method="post" action="delselectedmanager.jsp?ps=<%=pageSize%>">
  <tr>
    <td width="8%" height="25" align="center"><div align="center"><strong>選 擇</strong></div></td>
    <td width="16%" align="center"><div align="center"><strong>用戶名</strong></div></td>
    <td width="19%" align="center"><div align="center"><strong>姓 名</strong></div></td>
    <td width="13%" align="center"><strong>登錄次數</strong></td>
    <td width="26%" align="center"><div align="center"><strong>上次登錄時間</strong></div></td>
    <td width="18%" align="center"><div align="center"><strong>管 理</strong></div></td>
  </tr>
  <%
  int j = 0;
  while(rs.next()){
  	  int id1 = rs.getInt("cms_admin_id");
	  String username1 = rs.getString("cms_admin_id");
	  j++;
  %>
  <tr> 
    <td height="25" align="center"><div align="center">
        <input type="checkbox" name="id<%=j%>" value="<%=id1%>"></div>
	</td>
    <td height="25" align="center"><div align="left"><%=username1%></div></td>
    <td height="25" align="center"><div align="left"><%=rs.getString("cms_admin_name")%></div></td>
    <td height="25" align="center"><%=rs.getInt("cms_admin_times")%></td>
    <td height="25" align="center"><%=rs.getString("cms_admin_lastlogon")%></td>
    <td height="25" align="center"><a href="manager.jsp?id=<%=id1%>">修 改</a> | <a onClick="javascript:del_check(<%=id1%>,'<%=username1%>')" class=A>刪 除</a></td>
  </tr>
  <%
  }
  %>
  <tr> 
    <td height="25" colspan="6" align="center"><div align="left"><strong>操作︰      <input name="checkall" type="checkbox" id="checkall" value="checkbox" onClick="javascript:CheckAll(this.form)">
</strong>全部選擇 
<input name="del" type="submit" id="del" onClick="{if(confirm('確定刪除選定的目錄嗎?')){submit();return true;}return false;}" value="刪 除"></strong></div></td>
  </tr>
  </form>
  <tr> 
    <td height="25" colspan="6" align="center"><div align="right"><%=navigator%></div></td>
  </tr>
</table>
</body>
</html>
<%
op.closestmt();
op.closeconn();
%>