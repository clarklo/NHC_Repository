<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission7.jsp"%>
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
	rs = op.query("SELECT * FROM leaveword WHERE l_id="+id);
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
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
function checker(){
	if(Link.name.value == ""){
		alert("名稱不能為空,請輸入網站名稱!");
		Link.name.focus();
		return false;
	}
	if(Link.url.value == ""){
		alert("內容不能為空,請輸入內容!");
		Link.url.focus();
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
		self.location.href="delLeaveWord.jsp?id="+id + "&type=1";

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
	
}
-->
</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body onLoad="selected();">

<table width="95%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr>
    <td width="6%" align="center" background="images/tablebg.gif"><strong>選擇</strong></td>
    <td width="10%" height="25" align="center" background="images/tablebg.gif"><strong>留言人</strong></td>
    <td width="20%" align="center" background="images/tablebg.gif"><strong>留言時間</strong></td>
    <td width="37%" align="center" background="images/tablebg.gif"><strong>預約內容</strong></td>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>EMAIL</strong></td>
    <td width="7%" align="center" background="images/tablebg.gif"><strong>聯絡電話</strong></td>
   <td width="17%" height="25" align="center" background="images/tablebg.gif"><strong>管 理</strong></td>
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
 	//##mysql##rs = op.query("SELECT * FROM leaveword ORDER BY l_id DESC limit "+((currPage - 1) * pageSize)+"," + pageSize);
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
    <td height="25" align="center"><input type="checkbox" name="id<%=j%>" value="<%=id1%>"></td>
    <td height="25" align="center"><a href=leavewordReply.jsp?id=<%=id1%> title="點擊這裡檢視此留言" class="blue"><div align="left"><%=name1%></div></td>
    <td height="25" align="center"><div align="left"><%=type1%></div></td>
    <td height="25" align="center"><%=url1%></td>
    <td height="25" align="center"><%=username1%></td>
    <td height="25" align="center"><%=check1%></td>
    <td align="center" height="25"> <a onClick="javascript:del_check(<%=id1%>,'<%=name1%>')" class="A">刪 除</a></td>
  </tr>
  <%
  }
  %>
  <tr>
    <td height="25" colspan="8" align="center"><div align="left"><strong>操作:<input name="checkall" type="checkbox" id="checkall" value="checkbox" onClick="javascript:CheckAll(this.form)">
</strong>全部選擇 
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
<a href="ptexecel.jsp" class="red_link">匯出EXCEL</a>
&nbsp;&nbsp;&nbsp;
<!-- <input name="del" type="submit" id="del" onClick="{if(confirm('確定刪除選定的目錄嗎?')){submit();return true;}return false;}" value="刪 除"> -->
</strong></div></td>
  </tr>
</form>  
  <tr>
    <td height="25" colspan="8" align="center"><div align="right"><%=navigator%></div></td>
  </tr>

</table>
</body>
</html>
<%
op.closestmt();
op.closeconn();
%>