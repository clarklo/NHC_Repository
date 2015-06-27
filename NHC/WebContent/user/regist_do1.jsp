<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.util.*" %>
<%@ page import="com.web.www.ProcessUserMan" %>
<%@ page import="com.web.www.Userman" %>
<%@ page import="com.web.util.MD5" %>

<%@ page import="java.sql.*"%> 
<%
String name0 = "";
name0=request.getParameter("loginname");
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();  
//String url="jdbc:db2://localhost:50000/WSUDB"; 
String url ="jdbc:db2:WSUDB";
String user="apnhc01"; 
String password="ihaoyu@8"; 
Connection conn= DriverManager.getConnection(url,user,password); 

Statement stmt = conn.createStatement();
stmt.execute ("SET CURRENT_SCHEMA=NHC");
String sql="select * from USER_MAN where USER_MAN_LOGINNAME='"+name0+"' "; 
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next()) {%> 
A：<%=rs.getString(1)%> 
B：<%=rs.getString(2)%> 
<%}%> 
 <script>
    	alert("TW 帳號已存在,請重新輸入");
		history.go(-1);
    </script>
<%rs.close(); 
stmt.execute ("SET CURRENT_SCHEMA=NHCCN");
String sqlcn="select * from USER_MAN where USER_MAN_LOGINNAME='"+name0+"' "; 
ResultSet rs1=stmt.executeQuery(sqlcn); 
while(rs1.next()) {%> 
A：<%=rs1.getString(1)%> 
B：<%=rs1.getString(2)%> 
<%}%> 
<script>
    	alert("CN 帳號已存在,請重新輸入");
		history.go(-1);
    </script>
<%rs1.close(); 
stmt.execute ("SET CURRENT_SCHEMA=NHCEN");
String sqlen="select * from USER_MAN where USER_MAN_LOGINNAME='"+name0+"' "; 
ResultSet rs2=stmt.executeQuery(sqlen); 
while(rs2.next()) {%> 
A：<%=rs2.getString(1)%> 
B：<%=rs2.getString(2)%> 
<%}%> 
<script>
    	alert("EN 帳號已存在,請重新輸入");
		history.go(-1);
    </script>
<%rs2.close(); 
stmt.close(); 
conn.close(); 	
	
	
	ProcessUserMan pu=new ProcessUserMan();
	Userman um=new Userman();
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
	pu.addUserMan();
	
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
    	alert("註冊成功﹗請耐心等待我們的審核");
    	location.href="../index.jsp";
    </script>
<%

	}
 %>