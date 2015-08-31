<%@page import="www.ProcessPayCont"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission6.jsp"%>

<%
 
    String delID = request.getParameter("id");
    String delType = request.getParameter("type");
    String url ="";
     String sSql="";
    if ("1".equals(delType)){
        sSql ="Delete from LEAVEWORD where L_ID=" + delID ;
        url="wordList1.jsp";
    }
    else {
        sSql ="Delete from LEAVEWORD1 where L_ID=" + delID ;
        url="wordList2.jsp";
    }
    
    Operation op = new Operation();
    op.update(sSql);
    op.closestmt();
  
    
 
%> 
<script language="javascript">
<!-- 
    alert("更新成功");
    window.location.replace("<%=url%>");
-->
</script>
 
