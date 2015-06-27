<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@ page import="java.util.*"%>
<%@include file="permission.jsp"%>
<%@include file="permission/permission3.jsp"%>
<%
int pid = 0;
int no = 0;
String currPathId = "0::";
String currPathName = "::";
String cpid[] = null;
String cpname[] = null;
Operation op = new Operation();
ResultSet rs = null,rs1=null;
if(request.getParameter("pid")!=null){
	pid = Integer.parseInt(request.getParameter("pid"));
	if(pid != 0){
		rs = op.query("SELECT * FROM cms_class WHERE cms_class_id="+pid + " ORDER BY cms_class_orderid ASC");	
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
String root[] =null;
String tmp = "0::";
if(pid != 0){
	session.setAttribute("no", request.getParameter("no"));
	no = Integer.parseInt(String.valueOf(session.getAttribute("no")));
	tmp = (String)session.getAttribute("cid"+no);
}

if(tmp != null){
	root = tmp.split("::");
}
cpid = currPathId.split("::");
cpname = currPathName.split("::");
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script language = "JavaScript">
<!--
function del_checkarticle(id,p)
{
	var ok;
	ok=confirm("您是確定要刪除【"+p+"】嗎？");
	if(ok)
	{
		self.location.href="delarticle.jsp?cid=<%=pid%>&no=<%=no%>&id="+id;
	}
}
function del_checkfile(id,p)
{
	var ok;
	ok=confirm("您是確定要刪除【"+p+"】嗎？");
	if(ok)
	{
		self.location.href="delfile.jsp?cid=<%=pid%>&no=<%=no%>&id="+id;
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
//-->
</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="7" align="center" height="30" background="images/tablebg.gif"><b>信 息 管 理</b></td>
  </tr>
  <tr> 
    <td width="13%" height="25" align="center"><div align="right"><strong>工 具 欄: </strong></div></td>
    <td width="87%" align="center"><div align="left">NEWS管理</div></td>
  </tr>
  
 
</table>
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="12" align="center" height="30" background="images/tablebg.gif"><b>信 息 瀏 覽</b></td>
  </tr>
  <tr> 
    <td width="10%" height="25" align="center"><strong>選擇</strong></td>
    <td width="32%" align="center"><strong>訊息名稱</strong></td>
    <td width="11%" align="center"><strong>類型</strong></td>
    <td width="11%" align="center"><strong>下架管理</strong></td>
    <td width="14%" align="center"><strong>發布時間</strong></td>
    <td width="9%" align="center"><strong>發布人</strong></td>
    <td width="13%" align="center"><strong>管理</strong></td>
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
	if(admin.getIsAdmin()==1){
		rs = op.query("SELECT COUNT(*) AS total FROM cms_infodata WHERE cms_infodata_class="+pid);
	}
	else{
		rs = op.query("SELECT COUNT(*) AS total FROM cms_infodata WHERE cms_infodata_class="+pid+" AND cms_infodata_releaseman='"+admin.getUsername()+"'");
	}
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
	if(admin.getIsAdmin()==1){
		//rs = op.query("SELECT top " + pageSize + " * FROM cms_infodata where cms_infodata_class=" + pid + " AND cms_infodata_id NOT IN (SELECT TOP " + ((currPage - 1) * pageSize)+ " cms_infodata_id from cms_infodata where cms_infodata_class=" + pid + " ORDER BY cms_infodata_id DESC) ORDER BY cms_infodata_id DESC");
		//####rs = op.query("SELECT * FROM cms_infodata where cms_infodata_class=" + pid + " ORDER BY cms_infodata_id DESC limit "+((currPage - 1) * pageSize)+"," + (pageSize));
	rs = op.query("SELECT * FROM cms_infodata where cms_infodata_class=" + pid + " ORDER BY cms_infodata_id DESC ," + (pageSize));	
		
	}
	else{
		//rs = op.query("SELECT top " + pageSize + " * FROM cms_infodata where cms_infodata_releaseman='"+admin.getUsername()+"' AND cms_infodata_class=" + pid + " AND cms_infodata_id NOT IN (SELECT TOP " + ((currPage - 1) * pageSize)+ " cms_infodata_id from cms_infodata where cms_infodata_releaseman='"+admin.getUsername()+"' AND cms_infodata_class=" + pid + " ORDER BY cms_infodata_id DESC) ORDER BY cms_infodata_id DESC");
		//####rs = op.query("SELECT * FROM cms_infodata where cms_infodata_releaseman='"+admin.getUsername()+"' AND cms_infodata_class=" + pid + " ORDER BY cms_infodata_id DESC limit "+((currPage - 1) * pageSize)+"," + (pageSize));
	rs = op.query("SELECT * FROM cms_infodata where cms_infodata_releaseman='"+admin.getUsername()+"' AND cms_infodata_class=" + pid + " ORDER BY cms_infodata_id DESC ," + (pageSize));	
	}	
  %>
  <form name="form1" method="post" action="delselecteddata.jsp?ps=<%=pageSize%>&cid=<%=pid%>&no=<%=no%>">
  <%
  int k = 0;
  while(rs.next()){
  	  String id1 = rs.getString("cms_infodata_id");
	  String title1 = rs.getString("cms_infodata_name");
	  int type1 = rs.getInt("cms_infodata_type");	 
	  String time1 = rs.getString("cms_infodata_releasetime");
	  String username1 = rs.getString("cms_infodata_releaseman");	
	  String cms_infodata_iscoment = rs.getString("cms_infodata_iscoment");
	  k++;  	
 
 
  %> 
  <tr>
    <td height="25" align="center"><div align="left">
      <p align="center">
        <input type="checkbox" name="id<%=k%>" value="<%=id1%>">
      </p>
    </div></td>
    <td height="25" align="center"><div align="left"><%=title1%></div></td>
    <td height="25" align="center"><%if(type1==1){%>文章<%}else if(type1==2){%>檔案<%}%></td>
    <td height="25" align="center"><span class="style1">
	</span>
	<%if(cms_infodata_iscoment.equals("1"))
		{
	%>
    <a href=modadmin1.jsp?cid=124&no=8&flag=<%=cms_infodata_iscoment%>&id=<%=id1%> class="green">下架</a>
    <%
    	}
    	else
    	{
    %>
    <a href=modadmin1.jsp?cid=124&no=8&flag=<%=cms_infodata_iscoment%>&id=<%=id1%> class="red">上架</a>
    <%
    	}
				//'}//end of while

	           // v.clear();
			//}	
    %>
	</td>
    <td height="25" align="center"><%=time1.substring(0,10)%></td>
    <td height="25" align="center"><%=username1%></td>
    <td height="25" align="center"><a onClick="javascript:<%if(type1==1){%>del_checkarticle(<%=id1%>,'<%=title1%>')<%}else if(type1 == 2){%>del_checkfile(<%=id1%>,'<%=title1%>')<%}%>" class="A">刪除</a></td>
  </tr>
  <%
  }//end of while

 
  %> 
 <tr>
    <td height="25" colspan="7" align="center"><div align="left"><strong>操作:<input name="checkall" type="checkbox" id="checkall" value="checkbox" onClick="javascript:CheckAll(this.form)">
</strong>全部選擇 
<input name="del" type="submit" id="del" onClick="{if(confirm('確定刪除選定的目錄嗎?')){submit();return true;}return false;}" value="刪 除">
</strong></div></td>
  </tr>
</form>  
  <tr>
    <td height="25" colspan="7" align="center"><div align="right"><%=navigator%></div></td>
  </tr>
</table>
</body>
</html>
<%
  
op.closestmt();
op.closeconn();
%>