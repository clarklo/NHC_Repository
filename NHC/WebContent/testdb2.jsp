<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%> 
<html> 
<body> 
<%
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();  
String url="jdbc:db2://db2v901t:50000/WSUDB"; 
String user="APNHC01"; 
String password="ihaoyu@8"; 
Connection conn= DriverManager.getConnection(url,user,password); 

Statement stmt = conn.createStatement();
stmt.execute ("SET CURRENT_SCHEMA=NHC");

String sql="select * from CMS_LINK"; 
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next()) {%> 
A：<%=rs.getString(1)%> 
B：<%=rs.getString(2)%> 
<%}%> 
<%out.print("OK");%> 
<%rs.close(); 
stmt.close(); 
conn.close(); 
%>

</body> 
</html> 