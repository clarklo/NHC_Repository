<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%@ page errorPage="index_error.jsp" %>
<%@ page import="com.msg.bean.info" %>
<html>
<head>
<title>
send_pro
</title>
</head>
<body bgcolor="#ffffff">
<h1>
JBuilder Generated JSP
</h1>
<%!
public String codeString(String s){
	String str=s;
        try{
        	byte b[]=str.getBytes("ISO-8859-1");
                str=new String(b);
                return str;
        }
        catch(Exception e){
        	return str;
        }
}
%>
<jsp:useBean id="sendmsg" scope="request" class="com.msg.bean.info">
</jsp:useBean>
<%
	String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String email=request.getParameter("email");
        String qq=request.getParameter("qq");
        String http=request.getParameter("http");
        String content=request.getParameter("content");
        String ip=request.getRemoteAddr();
%>
<jsp:setProperty name="sendmsg" property="name" value="<%=name%>"/>
<jsp:setProperty name="sendmsg" property="sex" value="<%=sex%>"/>
<jsp:setProperty name="sendmsg" property="email" value="<%=email%>"/>
<jsp:setProperty name="sendmsg" property="qq" value="<%=qq%>"/>
<jsp:setProperty name="sendmsg" property="http" value="<%=http%>"/>
<jsp:setProperty name="sendmsg" property="content" value="<%=content%>"/>
<jsp:setProperty name="sendmsg" property="ip" value="<%=ip%>"/>
<%
 	sendmsg.addItem();
        response.sendRedirect("index.jsp");
%>

</body>
</html>
