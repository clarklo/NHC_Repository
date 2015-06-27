<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission9.jsp"%>
<%
Operation op = new Operation();
ResultSet rs = null;

int id = 0;
int type0 = 0;
String name0 = "";
String url0 = "http://";
String logo0 = "http://";
String introduce0 = "無!";
int commend0 = 0;
int check0 = 0;

if(request.getParameter("id")!=null){
	id = Integer.parseInt(request.getParameter("id"));
	rs = op.query("SELECT * FROM cms_link WHERE cms_link_id ="+id);
	rs.next();
	type0 = rs.getInt("cms_link_type");
	name0 = rs.getString("cms_link_site");
	url0 = rs.getString("cms_link_url");
	logo0 = rs.getString("cms_link_logo");
	introduce0 = rs.getString("cms_link_info");
	commend0 = rs.getInt("cms_link_commendsite");
	check0 = rs.getInt("cms_link_check");
	
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
		alert("網站名稱不能為空,請輸入網站名稱!");
		Link.name.focus();
		return false;
	}
	if(Link.url.value == ""){
		alert("網站位址不能為空,請輸入網站位址!");
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
		self.location.href="delfriendsite.jsp?id="+id;
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
	Link.name.focus();
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
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="7" align="center" height="30" background="images/tablebg.gif"><b>客 戶</b></td>
  </tr>
  <form name="Link" method="post" action="<%if(id==0){%>addfriendsite.jsp<%}else{%>modfriendsite.jsp?id=<%=id%><%}%>" onSubmit="return checker();">
  <tr> 
    <td width="19%" height="25" align="center"><div align="right">鏈接類型</div></td>
    <td width="81%" align="center"><div align="left">
      <input type="radio" name="type" value="1" <%if(type0==1){%>checked<%}%>>
    Logo鏈接 
    <input name="type" type="radio" value="0"  <%if(type0==0){%>checked<%}%>>
    文字鏈接</div></td>
  </tr>
  <tr>
    <td height="24" align="center">      <p align="right">網站名稱</p></td>
    <td height="24" align="center"><div align="left">
      <input name="name" type="text" id="name" size="30" maxlength="255" value="<%=name0%>">
      <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">網站位址</div></td>
    <td height="25" align="center"><div align="left">
      <input name="url" type="text" id="url" size="40" maxlength="255" value="<%=url0%>">
      <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">網站logo</div></td>
    <td height="25" align="center"><div align="left">
      <input name="logo" type="text" id="logo" size="40" maxlength="255" value="<%=logo0%>">
    </div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">網站簡介</div></td>
    <td height="25" align="center"><div align="left">
      <textarea name="introduce" cols="50" rows="8" id="introduce"><%=introduce0%></textarea>
    </div></td>
  </tr>
  <!--<tr> 
    <td height="25" align="center"><div align="right">推薦站點</div></td>
    <td height="25" align="center"><div align="left">
      <input type="radio" name="commend" value="1" <%if(commend0==1){%>checked<%}%>>
    是 
    <input name="commend" type="radio" value="0" <%if(commend0==0){%>checked<%}%>>
    否</div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">審核透過</div></td>
    <td height="25" align="center"><div align="left">
      <input type="radio" name="check" value="1" <%if(check0==1){%>checked<%}%>>
    是 
    <input name="check" type="radio" value="0" <%if(check0==0){%>checked<%}%>>
    否</div></td>
  </tr>-->
  <tr> 
    <td height="25" colspan="2" align="center"><div align="center">
      <input type="submit" name="Submit" value="<%if(id==0){%>添 加<%}else{%>修 改<%}%>"> 
       <input name="Reset" type="reset" id="Reset" value="重 置">
    </div></td>
  </tr>
  </form>
</table>
<table width="95%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr>
    <td width="6%" align="center" background="images/tablebg.gif"><strong>選擇</strong></td>
    <td width="16%" height="25" align="center" background="images/tablebg.gif"><strong>網站名稱</strong></td>
    <td width="37%" align="center" background="images/tablebg.gif"><strong>網站簡介</strong></td>
    <td width="7%" align="center" background="images/tablebg.gif"><strong>類型</strong></td>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>審核人</strong></td>
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
	rs = op.query("SELECT COUNT(*) AS total FROM cms_link");
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
 	//####rs = op.query("SELECT * FROM cms_link ORDER BY cms_link_id DESC limit "+((currPage - 1) * pageSize)+"," + pageSize);
	rs = op.query("SELECT * FROM cms_link ORDER BY cms_link_id DESC ");
  %>
  <form name="form1" method="post" action="delselectedfriendsite.jsp?ps=<%=pageSize%>">
  <%
  int j = 0;
  while(rs.next()){
  	  int id1 = rs.getInt("cms_link_id");
	  int type1 = rs.getInt("cms_link_type");
	  String name1 = rs.getString("cms_link_site");
	  String url1 = rs.getString("cms_link_url");
	  String introduce1 = rs.getString("cms_link_info");
	  int commend1 = rs.getInt("cms_link_commendsite");
	  int check1 = rs.getInt("cms_link_check");
	  String username1 = rs.getString("cms_link_checkman");
	  
	  j++;
  %>
  <tr>
    <td height="25" align="center"><input type="checkbox" name="id<%=j%>" value="<%=id1%>"></td>
    <td height="25" align="center"><div align="left"><%=name1%></div></td>
    <td height="25" align="center"><div align="left"><%=introduce1%></div></td>
    <td height="25" align="center"><%=((type1==1)?"logo":"文字")%></td>
    <td height="25" align="center"><%=username1%></td>
    <td align="center" height="25"><a href="friendsite.jsp?id=<%=id1%>">修 改</a> | <a onClick="javascript:del_check(<%=id1%>,'<%=name1%>')" class="A">刪 除</a></td>
  </tr>
  <%
  }
  %>
  <tr>
    <td height="25" colspan="8" align="center"><div align="left"><strong>操作:<input name="checkall" type="checkbox" id="checkall" value="checkbox" onClick="javascript:CheckAll(this.form)">
</strong>全部選擇 
<input name="del" type="submit" id="del" onClick="{if(confirm('確定刪除選定的目錄嗎?')){submit();return true;}return false;}" value="刪 除">
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