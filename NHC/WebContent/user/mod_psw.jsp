<%@ page pageEncoding="big5" contentType="text/html; charset=utf-8" language="java" import="java.util.*" %>
<%@ page import="com.web.www.ProcessUserMan" %>
<%
	String id=(String)session.getAttribute("id");
	ProcessUserMan pu=new ProcessUserMan();
	String oldPassword=request.getParameter("oldpassword");
	String password=request.getParameter("newpassword");
	pu.modPassword(id,oldPassword,password);
	if(!pu.isStatus())
	{
%>
<script type="text/javascript">
	alert("<%=pu.getMsg()%>");
	history.go(-1);
</script>
<%
		}
		else
		{
%>
<script type="text/javascript">
<!--
	alert("­×§ï±K½X¦¨¥\¡T");
	location.href="../index.jsp";
//-->
</script>
<%
	}
%>