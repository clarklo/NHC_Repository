<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission1.jsp"%>
<%
Operation op = new Operation();
ResultSet rs = null;
ResultSet rs1 = null;
String path = "";
String id[] = null;
boolean isManager = false;
int cid = Integer.parseInt(request.getParameter("cid"));
rs = op.query("SELECT * FROM cms_class WHERE cms_class_id="+cid);
if(rs.next()){
	path = rs.getString("cms_class_pathid");
	id = path.split("::");
}
op.closestmt();

rs = op.query("SELECT * FROM cms_permision WHERE cms_permision_claass="+cid);
String perm = "::";
while(rs.next()){
	perm += String.valueOf(rs.getInt("cms_permision_aid")) + "::";
}
op.closestmt();
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="6" align="center" height="30" background="images/tablebg.gif"><b>設定管理員</b></td>
  </tr>
  <form name="form1" method="post" action="processsetmanager.jsp?pid=<%=request.getParameter("pid")%>&cid=<%=cid%>">
  <tr>
    <td height="25" align="center"><div align="left">1、要成為欄目管理員首先必須具備<span class="style1">訊息管理的權限</span>，才可以管理欄目。</div></td>
  </tr>
  <tr>
    <td height="25" align="center"><div align="left"><span class="tdbg">2、欄目管理員權限採用<span class="style1">欄目繼承制度</span>，即管理員成為某個欄目的管理員後,也同時能管理子欄目。</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center">
      <div align="left">管理人員︰
	  <%
	  rs = op.query("SELECT * FROM cms_admin WHERE cms_admin_system=0 ORDER BY cms_admin_id ASC");
	  int i = 0;
	  while(rs.next()){
	  	  int mid = rs.getInt("cms_admin_id");
		  String permit = rs.getString("cms_admin_auth");
		  if(permit.charAt(2)=='N')continue;
		  isManager = false;
		  for(int j=0;j<id.length;j++){
			rs1 = op.query("SELECT * FROM cms_permision WHERE cms_permision_claass="+id[j] +" AND cms_permision_aid="+mid);
			if(rs1.next()){
				isManager = true;
			}
		 }
		 if(isManager)continue;
	      i++;
	  %>
        <input type="checkbox" name="mid<%=i%>" <%if(perm.indexOf("::"+String.valueOf(mid)+"::") != -1){%>checked<%}%> value="<%=mid%>"><%=rs.getString("cms_permision_aid")%>
	  <%
	  }
	  %>
      </div>
	  <input type="hidden" name="ps" value="<%=i%>"></td>
  </tr>
  <tr> 
    <td height="25" align="center">
      <div align="center">
        <input type="submit" name="Submit" value="提 交">
        <input name="back" type="button" id="Reset" value="返 回" onClick="javascript:history.back();">
      </div></td>
  </tr>
  </form>
</table>
</body>
</html>
<%
op.closestmt();
op.closeconn();
%>