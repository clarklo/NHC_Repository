<%@page import="java.nio.charset.Charset"%>
<%@page import="com.web.database.Operation"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%
 
    String updRoom_ID = request.getParameter("Room_ID");


    String sSql ="Delete from PAYROOM where ROOM_ID=" + updRoom_ID ;
    Operation op = new Operation();
    
    op.update(sSql);
    op.closestmt();
    String url ="";
    url="PatientRoomAdmin.jsp";
 
%> 
<script language="javascript">
<!-- 
    alert("更新成功");
    window.location.replace("<%=url%>");
-->
</script>
 
