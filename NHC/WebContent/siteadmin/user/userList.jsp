<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.web.database.*" %>
<%@ page import="java.util.*"%>
<%@ include file="../permission.jsp" %>
<%@ include file="../permission/permission8.jsp" %>
　　

<html>
<head>

<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin1.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.style1 {color: #FF0000}
.STYLE2 {color: #51CC5A}
-->
</style>
</head>
 <%
Operation op = new Operation();
ResultSet rs = null;

int id = 0;
String type0 =  "無!";
String name0 = "";
String url0 = "http://";
String logo0 = "http://";
String introduce0 = "無!";
String commend0 = "無!";
String check0 =  "無!";


if(request.getParameter("cid")!=null){
	id = Integer.parseInt(request.getParameter("cid"));
	rs = op.query("SELECT * from user_man order by user_man_id desc");
	rs.next();
	type0 = rs.getString("user_man_id");
	name0 = rs.getString("user_man_loginname");
	url0 = rs.getString("user_man_name");
	logo0 = rs.getString("user_man_mobile");
	introduce0 = rs.getString("user_man_email");
	commend0 = rs.getString("user_man_flag");
	//check0 = rs.getString("user_tel");
	
	op.closestmt();
}
%>
<body>
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
	rs = op.query("SELECT COUNT(*) AS total from user_man");
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
	
	rs = op.query("SELECT * from user_man order by user_man_id desc ," + pageSize);
  %>
<form name=form1 action="UserList" method="post">
  <br>
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="11" align="center" height="30" background="../images/tablebg.gif"><b>會員基本訊息</b></td>
  </tr>
  <tr> 
    
    <td width="9%" height="25" align="center">&nbsp;ID號</td>
	<td width="10%" align="center"><strong>選擇</strong></td>
    <td width="10%" align="center"><strong>帳號</strong></td>
    <td width="8%" align="center"><strong>手機</strong></td>
    <td width="25%" align="center"><strong>電子郵箱</strong></td>
    <td width="25%" align="center"><strong>審核</strong></td>
	 <td width="13%"  align="center"><strong>管理</strong></td>
  </tr>
  <%
  int j = 0;
  while(rs.next()){
	  String id1 = rs.getString("user_man_id");
	  String type1 = rs.getString("user_man_id");
	  String name1 = rs.getString("user_man_loginname");
	  String url1 = rs.getString("user_man_name");
	  String logo = rs.getString("user_man_mobile");
	  String introduce = rs.getString("user_man_email");
	  String commend = rs.getString("user_man_flag");
	
	  j++;
  %>    
 
 
  <tr>
    <td height="25" align="center">&nbsp;<%=id1%></td>
	 <td height="25" align="center"><input name="id" type="checkbox" id="id" value="<%=id1%>"></td>
    <td height="25" align="center">&nbsp;<a href=showUser.jsp?id=<%=id1%> title="點擊這裡檢視會員詳細訊息" class="blue"><%=name1%></a>&nbsp;</td>
    <td height="25" align="center">&nbsp;<%=logo%></td>
    <td height="25" align="center">&nbsp;<%=introduce%>&nbsp;&nbsp;</td>
    <td height="25" align="center" >
    <%if(commend.equals("1"))
		{
	%>
    <a href=UserList?flag=<%=commend%>&id=<%=id1%> class="green">通過</a>
    <%
    	}
    	else
    	{
    %>
    <a href=UserList?flag=<%=commend%>&id=<%=id1%> class="red">未通過</a>
    <%
    	}
    %></td>
	<td  align="center"><a href="DelUserManServlet?id=<%=id1%>" class="red_link">刪除</a>
	<a href="mailInput1.jsp?to=<%=introduce%>" class="red_link">發信</a></td>
  </tr>
<%
  }
  %>
<tr> 
    <td height="25" colspan="7" align="center"><div align="left"><strong>操作︰</strong>      
      <input name="checkall" type="checkbox" id="checkall" value="checkbox" onClick="javascript:CheckAll(this.form)">
</strong>全部選擇&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
<a href="ptexecel.jsp" class="red_link">匯出EXCEL</a>
&nbsp;&nbsp;&nbsp;
 
<input name="del" type="submit" id="del" onClick="{if(confirm('確定刪除選定的目錄嗎?')){action='DelUserManServlet';submit();return true;}return false;}" value="刪 除">
  </div></td>
  </tr>
  <tr>
    <td height="25" colspan="7" align="right">
    <%=navigator%>
    </td>
  </tr>
</table>
</form>
<br>
</body>
</html>