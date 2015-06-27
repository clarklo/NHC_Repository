<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文檔</title>
</head>

<body>


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("111");
	if(list.size()>0)
	{
	  for(int i=0;i<list.size();i++)
	  {
		Classify cf=(Classify)list.get(i);
		
	
%>
  <tr>
    <td width="22%" height="28" align="center"><img src="../images/qiyezongshu_r14_c8.jpg" width="6" height="4" /></td>
    <td width="78%"><a href="../news/NewsList?cid=<%=cf.getId()%>" class="red_link15"><%=cf.getName()%></a></td>
  </tr>
  <%
  	}
  }else
   {
  %>
    <tr>
    <td height="28" align="center" colspan="2">暫時無訊息</td>
    
  </tr>
    
  <%}%>
</table>
</body>
</html>