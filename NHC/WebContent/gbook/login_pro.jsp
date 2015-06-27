<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<html>
<head>
<title>
login_pro      
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body bgcolor="#ffffff">
<%
  String adminname = new String(request.getParameter("adminname"));
  String adminpassword = new String(request.getParameter("adminpassword"));
  String  condition="select adminname,adminpassword from system";
  Connection con=db.getConn();
  Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(condition);
    rs.next();

	 if(rs.getString("adminname").equals(adminname)&&rs.getString("adminpassword").equals(adminpassword))
	    {
     session.setAttribute("adminname","adminname");
	 response.sendRedirect("index.jsp");
	    }
	 else
		   {

             out.print("用戶名或密碼錯誤﹗");%> <a href="login.jsp">返回</a><%

		   }
rs.close();
stmt.close();
con.close();
%>

</body>
</html>