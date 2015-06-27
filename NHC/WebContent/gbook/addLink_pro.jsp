<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%@ page errorPage="index_error.jsp" %>
<%@ page import="com.msg.bean.Link" %>
<html>
<head>
<title>
addLink_pro
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
<jsp:useBean id="link" scope="request" class="com.msg.bean.Link">
</jsp:useBean>
<%
	String intro=request.getParameter("intro");
        intro=codeString(intro);
        String www=request.getParameter("www");
        www=codeString(www);
        String img=request.getParameter("img");
        img=codeString(img);
%>
<jsp:setProperty name="link" property="intro" value="<%=intro%>"/>
<jsp:setProperty name="link" property="www" value="<%=www%>"/>
<jsp:setProperty name="link" property="img" value="<%=img%>"/>
<%
 	link.addLink();
        response.sendRedirect("addLink.jsp");
%>

</body>
</html>
