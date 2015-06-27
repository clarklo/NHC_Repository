<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%request.setCharacterEncoding("utf-8");%>

<%@include file="permission.jsp"%>
<%@include file="permission/permission1.jsp"%>
<%
int pid = 0;
String currPathId = "0::";
String currPathName = "::";
String cpid[] = null;
String cpname[] = null;
Operation op = new Operation();
ResultSet rs = null;
if(request.getParameter("pid")!=null){
	pid = Integer.parseInt(request.getParameter("pid"));
	if(pid != 0){
		rs = op.query("SELECT * FROM cms_class WHERE cms_class_id="+pid);
		rs.next();
		String name = rs.getString("cms_class_name");
		String pathId = rs.getString("cms_class_pathid");
		String pathName = rs.getString("cms_class_pathname");
		currPathId = pathId  + pid + "::";
		currPathName = pathName + name + "::";
	
		op.closestmt();
	}
}
else{
	pid = 0;
}
cpid = currPathId.split("::");
cpname = currPathName.split("::");

int id = 0;
String name0 = "";
int num0 = 1;
String externURL0 = "";
int commend0 = 0;
int outputrss0 = 0;
if(request.getParameter("id")!=null){
	id = Integer.parseInt(request.getParameter("id"));
	rs = op.query("SELECT * FROM cms_class WHERE cms_class_id="+id);
	rs.next();
	name0 = rs.getString("cms_class_name");
	num0 = rs.getInt("cms_class_orderid");
	externURL0 = rs.getString("cms_class_href");
	commend0 = rs.getInt("cms_class_isremoute");
	outputrss0 = rs.getInt("cms_class_isout");
	
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
function check(){
	if(add.name.value == ""){
		alert("類別名稱不能為空,請輸入類別名稱!");
		add.name.focus();
		return false;
	}
	if(add.num.value == ""){
		alert("類別序號不能為空,請輸入類別序號!");
		add.num.focus();
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
		self.location.href="delclassify.jsp?pid=<%=pid%>&id="+id;
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
	add.name.focus();
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
    <td colspan="11" align="center" height="30" background="images/tablebg.gif"><b>信 息 分 類</b></td>
  </tr>
  <tr> 
    <td height="25" colspan="6" align="center"><div align="left"><strong>當前路徑︰</strong> 【<a href="classify.jsp">ROOT</a><%for(int i=1;i<cpname.length;i++){ if(i != cpname.length-1){%>/<a href="classify.jsp?pid=<%=cpid[i]%>"><%=cpname[i]%></a><%}else{%>/<%=cpname[i]%><%}}%>】
</div></td>
  </tr>
  <form name="add" method="post" action="<%if(id==0){%>addclassify.jsp?pid=<%=pid%><%}else{%>modclassify.jsp?pid=<%=pid%>&id=<%=id%><%}%>" onSubmit="return check();">
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">類別名稱︰
          <input name="name" type="text" id="name" size="35" maxlength="255"  value="<%if(id!=0){%><%=name0%><%}%>">
          <span class="style1">*</span> 類別序號︰
          <input name="num" type="text" id="num" value="<%=num0%>" size="5" maxlength="5">
	  <input name="currPathId" type="hidden" id="currPathId" value="<%=currPathId%>">
	  <input name="currPathName" type="hidden" id="currPathName" value="<%=currPathName%>">
      <span class="style1">*</span> </div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">外部鏈接︰
        <input name="externURL" type="text" id="externURL" value="<%=externURL0%>" size="20" maxlength="255">
(<span class="style1">將欄目鏈接到外部位址，請輸入URL位址，否則為空</span>)</div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">
推薦欄目︰ 
    <input name="commend" type="checkbox" id="commend" value="1" <%if(commend0 == 1){%>checked<%}%>>
    (<span class="style1">推薦欄目將在首頁及此欄目的父欄目上顯示文章清單</span>)</div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><div align="left">輸出RSS ︰
      <input type="radio" name="outputrss" value="1" <%if(outputrss0==1){%>checked<%}%>> 
      是 
      <input name="outputrss" type="radio" value="0" <%if(outputrss0==0){%>checked<%}%>>
      否
    </div></td>
  </tr>
  <tr>
    <td height="25" colspan="6" align="center"><input type="submit" name="Submit" value="<%if(id==0){%>新 建<%}else{%>修 改<%}%>"> <input name="Reset" type="reset" id="Reset" value="重 置"></td>
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
	rs = op.query("SELECT COUNT(*) AS total FROM cms_class WHERE cms_class_fatid="+pid+"");
	
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
	//rs = op.query("SELECT top " + pageSize + " * FROM cms_class where cms_class_id="+pid+" AND cms_class_id NOT IN (SELECT TOP " + ((currPage - 1) * pageSize)+ " cms_class_id from cms_class WHERE cms_class_fatid="+pid+" ORDER BY cms_class_id DESC) ORDER BY cms_class_id DESC");
  	rs = op.query("SELECT * FROM cms_class where cms_class_fatid="+pid+" ORDER BY cms_class_id DESC limit "+((currPage - 1) * pageSize)+"," +pageSize);
  
  %>
  <tr> 
    <td width="10%" height="25" align="center"><div align="center"><strong>編 號</strong></div></td>
    <td width="9%" align="center"><div align="center"><strong>選 擇</strong></div></td>
    <td width="26%" align="center"><div align="center"><strong>類別名稱</strong></div></td>
    <td width="8%" align="center"><strong>推 荐</strong></td>
    <td width="15%" align="center"><div align="center"><strong>序 號</strong></div></td>
    <td width="32%" align="center"><div align="center"><strong>管 理</strong></div></td>
  </tr>
  <form name="form3" method="post" action="delselectedclassify.jsp?pid=<%=pid%>&ps=<%=pageSize%>">
  <%
  int i = 0;
  while(rs.next()){
  	  int id1 = rs.getInt("cms_class_id");
	  String name1 = rs.getString("cms_class_name");
	  int num1 = rs.getInt("cms_class_orderid");
	  int outputrss1 = rs.getInt("cms_class_isremoute");
	  i++;
	  System.out.println(name1);
  %>
  <tr> 
    <td height="25" align="center"><div align="center"><%=id1%></div></td>
    <td height="25" align="center"><input name="id<%=i%>" type="checkbox" id="id" value="<%=id1%>"></td>
    <td height="25" align="center"><div align="left"><a href=classify.jsp?pid=<%=id1%>><%=name1%></a></div></td>
    <td height="25" align="center"><%if(outputrss1 == 1){%><span class="style1">√</span>
    <%}else{%>&nbsp;<%}%></td>
    <td height="25" align="center"><%=num1%></td>
    <td height="25" align="center"> <a href="classify.jsp?pid=<%=pid%>&id=<%=id1%>">修 改</a> | <a onClick="javascript:del_check(<%=id1%>,'<%=name1%>')" class=A>刪 除</a> </td>
  </tr>
  <%
  }
  %>
  <tr> 
    <td height="25" colspan="6" align="center"><div align="left"><strong>操作︰</strong>      
      <input name="checkall" type="checkbox" id="checkall" value="checkbox" onClick="javascript:CheckAll(this.form)">
</strong>全部選擇 
<input name="del" type="submit" id="del" onClick="{if(confirm('確定刪除選定的目錄嗎?')){submit();return true;}return false;}" value="刪 除"> 
<span class="style1">說明</span>︰不能刪除非空欄目，即欄目中還有文章或檔案不能刪除﹗</div></td>
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