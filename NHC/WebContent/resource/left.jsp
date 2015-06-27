<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'left.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
  </head>
  
  <body>
    
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("164");
	if(list.size()>0)
	{
	  for(int i=0;i<list.size();i++)
	  {
		Classify classify=(Classify)list.get(i);
%>
  <tr>
    <td width="22%" height="28" align="center"><img src="../images/qiyezongshu_r14_c8.jpg" width="6" height="4" /></td>
    <td width="78%"><a href="index.jsp?id=<%=classify.getId()%>" class="red_link15"><%=classify.getName()%></a></td>
  </tr>
   <tr align="center">
       <td height="1" colspan="2" background="../images/qiyezongshu_r12_c6.jpg"></td>
   </tr>
  <%
  	}
  }else
  {
  %>
   <tr align="center">
       <td height="1" colspan="2">暫時無訊息</td>
   </tr>
  <%}%>
  <tr>
    <td height="28" align="center"><img src="../images/qiyezongshu_r14_c8.jpg" width="6" height="4" /></td>
    <td><a href="OnlineQuestion" class="red_hong15">真情留言</a></td>
  </tr>
</table>
  </body>
</html>