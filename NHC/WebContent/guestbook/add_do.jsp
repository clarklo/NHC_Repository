<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<%
if(session.getAttribute("loginname")==null){
%>
<jsp:forward page="../user/login.jsp" >
<jsp:param name="msg" value="提示︰留言功能的使用需要登入﹗"/>
</jsp:forward>
<%
}else{
%>
<jsp:forward page="OnlineQuestion?type=add"/>
<%
}
%>