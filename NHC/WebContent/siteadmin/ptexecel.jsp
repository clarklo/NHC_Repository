<%@ page contentType="application/msexcel" %>
<%@ page language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%@ page import="java.util.*"%>
<%
   response.setHeader("Content-disposition","inline; filename=con-nor.xls");
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
	rs = op.query("SELECT * FROM leaveword order by l_id desc");
	
	rs.next();
	type0 = rs.getString("l_time");
	name0 = rs.getString("l_user");
	url0 = rs.getString("l_content");
	//logo0 = rs.getString("cms_link_logo");
	introduce0 = rs.getString("l_title");
	commend0 = rs.getString("user_company");
	check0 = rs.getString("user_tel");
	
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
    
    <td width="10%" height="25" align="center" background="images/tablebg.gif"><strong>留言人</strong></td>
    <td width="20%" align="center" background="images/tablebg.gif"><strong>留言時間</strong></td>
    <td width="45%" align="center" background="images/tablebg.gif"><strong>預約內容</strong></td>
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
	rs = op.query("SELECT COUNT(*) AS total FROM leaveword");
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
 	rs = op.query("SELECT * FROM leaveword ORDER BY l_id DESC ," + pageSize);
  %>
  <form name="form1" method="post" action="delselectedfriendsite.jsp?ps=<%=pageSize%>">
  <%
  int j = 0;
  while(rs.next()){
  	  int id1 = rs.getInt("l_id");
	  String type1 = rs.getString("l_time");
	  String name1 = rs.getString("l_user");
	  String url1 = rs.getString("l_content");
	  String introduce1 = rs.getString("l_title");
	  String commend1 = rs.getString("user_company");
	  String check1 = rs.getString("user_tel");
	  String username1 = rs.getString("l_email");
	  
	  j++;
  %>
  <tr>
   
    <td height="10" align="center"><div align="left"><%=name1%></div></td>
    <td height="20" align="center"><div align="left"><%=type1%></div></td>
    <td height="45" align="center"><%=url1%></td>
    <td height="15" align="center"><%=username1%></td>
    <td height="10" align="center"><%=check1%></td>
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