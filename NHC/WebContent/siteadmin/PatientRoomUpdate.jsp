
<%@page import="java.nio.charset.Charset"%>
<%@page import="com.web.database.Operation"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.jspsmart.upload.*" %>


<%

    String RoomID=request.getParameter("roomID");
    String RoomName=request.getParameter("txtRoomName") ;
    String RoomDesc=request.getParameter("txtRoomDesc");
    String RoomPay=request.getParameter("txtRoomPay");

    Operation op = new Operation();
    String sSql ="";
    sSql="Update PAYROOM SET ROOM_NAME='" + RoomName + "'" ;
    sSql+=",ROOM_DESC='" + RoomDesc + "'" ;
    sSql+=",ROOM_PAY='" + RoomPay + "'" ;
    sSql+=" where ROOM_ID=" + RoomID + " " ;
    op.update(sSql);
    op.closestmt();
     
%> 
<script language="javascript">
<!-- 
    alert("ÐÞ¸Ä³É¹¦");
    window.location.replace("PatientRoomAdmin.jsp");
-->
</script>
 
