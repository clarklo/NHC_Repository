<%@ page contentType="application/msexcel; charset=utf-8" %>
<%@ page language="java" import="java.sql.*,com.web.database.*"%>
<%@ page import="java.util.*"%>
<%
   response.setHeader("Content-disposition","inline; filename=user.xls");
%>
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

if(request.getParameter("id")!=null){
	id = Integer.parseInt(request.getParameter("id"));
	rs = op.query("SELECT * from user_man order by user_man_id desc");
	rs.next();
	type0 = rs.getString("user_man_id");
	name0 = rs.getString("user_man_loginname");
	url0 = rs.getString("user_man_email");
	//logo0 = rs.getString("user_man_lastlogin");
	introduce0 = rs.getString("user_man_age");
	commend0 = rs.getString("user_man_tel");
	check0 = rs.getString("user_man_sex");
	
	op.closestmt();
}
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body onLoad="selected();">

<table width="95%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr>
    <td width="10%" height="25" align="center">會員編號</td>
    <td width="10%" align="center"><strong>帳號</strong></td>
    <td width="15%" height="25" align="center" background="images/tablebg.gif"><strong>真實姓名</strong></td>
    <td width="15%" align="center" background="images/tablebg.gif"><strong>註冊時間</strong></td>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>性別</strong></td>
    <td width="15%" align="center" background="images/tablebg.gif"><strong>生日</strong></td>
    <td width="15%" align="center" background="images/tablebg.gif"><strong>EMAIL</strong></td>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>聯絡電話</strong></td>
  
  </tr>
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
	rs = op.query("SELECT COUNT(*) AS total FROM user_man");
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
	//rs = op.query("SELECT top " + pageSize + " * FROM cms_link where cms_link_id NOT IN (SELECT TOP " + ((currPage - 1) * pageSize)+ " cms_link_id from cms_link ORDER BY cms_link_id DESC) ORDER BY cms_link_id DESC");
	rs = op.query("SELECT * from user_man order by user_man_id desc ," + pageSize);
  %>
  <form name="form1" method="post" action="delselectedfriendsite.jsp?ps=<%=pageSize%>">
  <%
  int j = 0;
  while(rs.next()){
  	  int id1 = rs.getInt("user_man_id");
	  String type1 = rs.getString("user_man_id");
	  String name1 = rs.getString("user_man_loginname");
	  String url1 = rs.getString("user_man_email");
	  //String introduce1 = rs.getString("user_man_age");
	  String commend1 = rs.getString("user_man_tel");
	  String check1 = rs.getString("user_man_sex");
	  String username1 = rs.getString("user_man_name");
	  String logo1 = rs.getString("user_man_lastlogin");
	  j++;
  %>
  <tr>
   <td height="10" align="center"><div align="left"><%=type1%></div></td>
    <td height="10" align="center"><div align="left"><%=name1%></div></td>
    <td height="15" align="center"><%=username1%></td>
    <td height="15" align="center"><%=logo1%></td>
    <td height="10" align="center"><%=check1%></td>
   <td height="15" align="center"><%=commend1%></td>
    <td height="15" align="center"><%=url1%></td>
    <td height="10" align="center"><%=commend1%></td>
  </tr>
  <%
  }
  %>
  <tr>
   
  </tr>
</form>  
 

</table>
</body>
</html>
<%
op.closestmt();
op.closeconn();
%>