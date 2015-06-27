<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.util.*" %>
<%@ page import="com.web.www.ProcessUserMan" %>
<%@ page import="com.web.www.Userman" %>
<%@ page import="com.web.util.MD5" %>

<%@ page import="java.sql.*"%>
<%
String name0 = "";
name0=request.getParameter("loginname");
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();  
String url = "jdbc:db2:WSUDB"; 
String user="apnhc01"; 
String password="ihaoyu@8"; 
Connection conn1= DriverManager.getConnection(url,user,password);

Statement stmt1 = conn1.createStatement();  
stmt1=conn1.createStatement();
stmt1.execute ("SET CURRENT_SCHEMA=NHCCN");
String sqlcn="select * from USER_MAN where USER_MAN_LOGINNAME='"+name0+"' "; 
   ResultSet rs1=stmt1.executeQuery(sqlcn); 
   if(rs1.next())
   {
    %>  
   <script>
    	alert("CN帳號已存在,請重新輸入");
		location.href="regist.jsp";
    </script>
   <%
   rs1.close();
   stmt1.close();
   }
   else
   {
               Statement stmt2 = conn1.createStatement();  
               stmt2.execute ("SET CURRENT_SCHEMA=NHCEN");
               String sqlen="select * from USER_MAN where USER_MAN_LOGINNAME='"+name0+"' "; 
               ResultSet rs2=stmt2.executeQuery(sqlen); 
               if(rs2.next())
               {
                %>  
                <script>
    	        alert("EN帳號已存在,請重新輸入");
		        location.href="regist.jsp";
                </script>
                <%
                rs2.close(); 
                stmt2.close(); 
				conn1.close();
				}
                else
                {
                ////////////////////          
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
				/////////////////////////
                 }
   }
   %>