<%@page import="com.web.database.Operation"%>
﻿<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/admin.css" rel="stylesheet" type="text/css">
<title>無標題文件</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<%
 String queryID=request.getParameter("id");
  Operation op = new Operation();
	 ResultSet rs = null;
	 rs = op.query("SELECT * from LEAVEWORD1 where L_ID=" + queryID );
     rs.next();
   String l_user=rs.getString("L_USER");
   String user_company=rs.getString("USER_COMPANY");
   String user_sex=rs.getString("USER_SEX");
   String l_class_id=rs.getString("L_CLASS_ID");
   String user_addr=rs.getString("USER_ADDR");
   String user_tel=rs.getString("USER_TEL");
   String l_email =rs.getString("L_EMAIL");
   String l_content=rs.getString("L_CONTENT");
   String l_title=rs.getString("L_TITLE");
   op.closestmt();		
%>    
    
    
        <table width="650" border="0" cellspacing="0" cellpadding="0" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC" >
     <tr  height="40"   >
       <th width="35%"><h2>美容預約管理明細</h2> </th>
    <td width="65%"> </td>
  </tr>
            <tr  height="40"   >
    <th width="35%">姓名<span class="smail">Name：</span></th>
    <td width="65%"><input type="text" class="w_in10" size="20" name="l_user" value="<%=l_user%>" /></td>
  </tr>
  <tr  height="40" >
    <th>諮詢的項目：</th>
    <td><%=l_title%>
	</td>
  </tr>
  <tr  height="40" >
    <th>諮詢內容：：</th>
    <td><textarea name="l_content" class="w_in10" cols="40" rows="6"><%=l_content%></textarea>
	</td>
  </tr>
  <tr  height="40" >
    <th>性別<span class="smail">Gender</span>：</th>
    <td><label>
        <% if (user_sex.equals("男")){ %>
      <input type="radio" name="user_sex" id="user_sex" value="0" checked="checked" />
   <% } else { %>
         <input type="radio" name="user_sex" id="user_sex" value="0"  />
   <%}%> 男</label>
        <label>
	        <%  if (user_sex.equals("女")){ %>
      <input type="radio" name="user_sex" id="user_sex" value="1" checked="checked" />
   <%   }           else {   %>
         <input type="radio" name="user_sex" id="user_sex" value="1"  />
   <%}%>        女</label>
	</td>
  </tr>
  <tr  height="40" >
    <th>方便聯絡時間：</th>
    <td><%=user_company%> </td>
  </tr>
  <tr  height="40" >
    <th>聯絡電話<span class="smail">TEL</span>：</th>
    <td><input id="user_tel" class="w_in10" type="text" maxlength="45" size="30" name="user_tel" value="<%=user_tel%>"  /></td>
  </tr>
  <tr  height="40" >
    <th>電子郵件<span class="smail">e-mail</span>：</th>
    <td><input type="text" class="w_in10" name="l_email" size="25"  value="<%=l_email%>"  /></td>
  </tr>

  
  <tr  height="40" >
    <td colspan="2" align="center" valign="middle"> <input class="submit-button" type="button" value="返回" onClick="javascript:history.go(-1)"/> </td>
    </tr>
</table>
    
    
    
    
    
<body>
</body>
</html>