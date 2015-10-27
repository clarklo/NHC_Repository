<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

int id = admin.getId();

if(oldPassword == null || oldPassword.equals("")){
	out.println("<script language=javascript> alert('舊密碼不能為空,請輸入您的舊密碼!'); location.href='modpass.jsp';</script>");
}
else if(util.SpecialStringFilter.check(oldPassword)){
	out.println("<script language=javascript> alert('舊密碼中含有非法字元串!'); location.href='modpass.jsp';</script>");
}
else if(newPassword == null || newPassword.equals("")){
	out.println("<script language=javascript> alert('新密碼不能為空,請輸入您的新密碼!'); location.href='modpass.jsp';</script>");
}
else if(util.SpecialStringFilter.check(newPassword)){
	out.println("<script language=javascript> alert('新密碼中含有非法字元串!'); location.href='modpass.jsp';</script>");
}
else if(!newPassword.equals(confirmPassword)){
	out.println("<script language=javascript> alert('前後兩次輸入的密碼不一致,請重新輸入您的密碼!'); location.href='modpass.jsp';</script>");
}
else{
	ProcessAdmin processAdmin = new ProcessAdmin();
	
	processAdmin.modPassword(id, oldPassword, newPassword);
	
	if(processAdmin.isStatus()){		
            
 
		out.println("<script language=javascript> alert('修改成功'); location.href='modpass.jsp';</script>");
	}
	else{
		out.println("<script language=javascript> alert('"+ processAdmin.getMsg() + "'); location.href='modpass.jsp';</script>");	
	}
}
%>