
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.util.*" %>
<%@ page import="com.web.www.ProcessUserMan" %>
<%@ page import="com.web.www.Userman" %>
<%@ page import="com.web.util.MD5" %>
<%
	
	ProcessUserMan pu=new ProcessUserMan();
	Userman um=new Userman();
	um.setUserManId(request.getParameter("mid"));
	//AGE作為生日用
	um.setUserManAge(request.getParameter("age"));
	//病歷號碼
	um.setUserManBankcard(request.getParameter("bankcard"));
	um.setUserManEmail(request.getParameter("email"));
	um.setUserManLoginName(request.getParameter("loginname"));
	//um.setUserMantel(request.getParameter("tel"));
	//行動電話
	um.setUserManMobile(request.getParameter("Mobile"));
	um.setUserManName(request.getParameter("name"));
	//um.setUserManNickname(request.getParameter("nickname"));
	um.setUserManPassword(MD5.toMD5(request.getParameter("password")));
	um.setUserManSex(request.getParameter("sex"));
	//地址
	um.setUserManWork(request.getParameter("work"));
	//um.setUserManNote(request.getParameter("note"));
	pu.setUserman(um);
	pu.updateUserMan();
	
if(!pu.isStatus())
	{
%>
    <script>
    	alert("<%=pu.getMsg()%>");
    	history.go(-1);
    </script>
 <%
 	}
 	else
	{
	%>
	 <script>
    	alert("已成功修改個人資訊﹗");
    	location.href="../index.jsp";
    </script>
<%

	}
 %>