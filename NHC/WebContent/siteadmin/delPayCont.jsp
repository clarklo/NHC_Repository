<%@page import="java.nio.charset.Charset"%>
<%@page import="com.web.database.Operation"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%
 
    String updPAY_ID = request.getParameter("updPAY_ID");
    String PAY_CONT_TYPE = request.getParameter("PAY_CONT_TYPE");

    String sSql ="Delete from PAYCONT where PAY_ID=" + updPAY_ID ;
    java.util.Date now = new java.util.Date(); 
    Operation op = new Operation();
    
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
    alert("更新成功");
    window.location.replace("<%=url%>");
-->
</script>
 
