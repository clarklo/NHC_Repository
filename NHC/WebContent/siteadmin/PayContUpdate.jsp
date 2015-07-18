<%@page import="java.nio.charset.Charset"%>
<%@page import="com.web.database.Operation"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.jspsmart.upload.*" %>


<%
 
    String updPAY_ID = request.getParameter("updPAY_ID");
    String PAY_CONT_TYPE = request.getParameter("PAY_CONT_TYPE");
    String PAY_TYPE_CHT = request.getParameter("PAY_TYPE_name");
    String updPAY_XCODE = request.getParameter("PAY_XCODE");
    String updPAY_LOGS=request.getParameter("PAY_LOGS");
    String updPAY_001 = request.getParameter("PAY_001");
    String updPAY_002 = request.getParameter("PAY_002");
    String updPAY_003 = request.getParameter("PAY_003");
    String updPAY_004 = request.getParameter("PAY_004");
    String updPAY_005 = request.getParameter("PAY_005");
    String updPAY_006 = request.getParameter("PAY_006");
    String updPAY_007 = request.getParameter("PAY_007");
    String updPAY_008 = request.getParameter("PAY_008");
    java.util.Date now = new java.util.Date(); 
    Operation op = new Operation();
    String sSql ="";
    sSql="Update PAYCONT SET PAY_TYPE_CHT='" + PAY_TYPE_CHT + "'" ;
    sSql+=",PAY_XCODE='" + updPAY_XCODE + "'" ;
    sSql+=",PAY_LOGS='" + updPAY_LOGS + "'" ;
    sSql+=",PAY_001='" + updPAY_001 + "'" ;
    sSql+=",PAY_002='" + updPAY_002 + "'" ;
    sSql+=",PAY_003='" + updPAY_003 + "'" ;
    sSql+=",PAY_004='" + updPAY_004 + "'" ;
    sSql+=",PAY_005='" + updPAY_005 + "'" ;
    sSql+=",PAY_006='" + updPAY_006 + "'" ;
    sSql+=",PAY_007='" + updPAY_007 + "'" ;
    sSql+=",PAY_008='" + updPAY_008 + "'" ;
    sSql+=",PAY_009='" + session.getAttribute("username") + "'" ;
    sSql+=",PAY_DATETIME='" + new java.text.SimpleDateFormat().format(now) + "'" ;
    sSql+=" where PAY_ID=" + updPAY_ID + " " ;
    
            
    op.update(sSql);
    op.closestmt();
    String url ="";
    if (PAY_CONT_TYPE.equals("A")) {
        url="PayContAdmin.jsp";
    }
    if (PAY_CONT_TYPE.equals("B")) {
        url="PayContAdmin2.jsp";
    }
    if (PAY_CONT_TYPE.equals("C")) {
        url="PayContAdmin3.jsp";
    }
    
%> 
<script language="javascript">
<!-- 
    alert("ÐÞ¸Ä³É¹¦");
    window.location.replace("<%=url%>");
-->
</script>
 
