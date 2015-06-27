<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*,com.web.www.*"%>
<%
//管理員權限控制
com.web.www.Admin admin = (com.web.www.Admin)session.getAttribute("admin");
String permission = admin.getPermission();
//非系統管理員
if(admin.getIsAdmin()==0){
	if(permission.charAt(6) == 'N'){
		out.println("<script language=javascript> alert('你沒有流量統計的管理權限,要開通此功能,請與系統管理員聯繫!'); location.href='function.jsp';</script>");	
	}
}
%>