<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission2.jsp"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmPassword");
String name = request.getParameter("name");
//獲得權限
int funcNum = Integer.parseInt(request.getParameter("funcNum"));
int isAdmin = 0;
if(request.getParameter("systemAdmin")!=null){
	isAdmin = Integer.parseInt(request.getParameter("systemAdmin"));
}
String perm = "";
String p[] = new String[funcNum];
for(int i = 0; i < funcNum; i ++){
	p[i] = request.getParameter("permission" + (i +1));
	if(p[i] != null){
		perm += "Y";
	}
	else{
		perm += "N";
	}
}

if(username == null || username.equals("")){
	out.println("<script language=javascript> alert('用戶名不能為空,請輸入您的用戶名!'); location.href='manager.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(username)){
	out.println("<script language=javascript> alert('用戶名中含有非法字元串!'); location.href='manager.jsp';</script>");
}
else if(password == null || password.equals("")){
	out.println("<script language=javascript> alert('密碼不能為空,請輸入您的密碼!'); location.href='manager.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(password)){
	out.println("<script language=javascript> alert('密碼中含有非法字元串!'); location.href='manager.jsp';</script>");
}
else if(!password.equals(confirmPassword)){
	out.println("<script language=javascript> alert('前後兩次輸入的密碼不一致,請重新輸入您的密碼!'); location.href='manager.jsp';</script>");
}
else if(name == null || name.equals("")){
	out.println("<script language=javascript> alert('姓名不能為空,請輸入您的姓名!'); location.href='manager.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(name)){
	out.println("<script language=javascript> alert('姓名中含有非法字元串!'); location.href='manager.jsp';</script>");
}
else{
	Admin manager = new Admin();
	manager.setUsername(username);
	manager.setName(name);
	manager.setPassword(password);
	manager.setPermission(perm);
	manager.setIsAdmin(isAdmin);
	
	ProcessAdmin processAdmin = new ProcessAdmin();
	processAdmin.setAdmin(manager);
	
	processAdmin.add();
	
	if(processAdmin.isStatus()){		
		response.sendRedirect("manager.jsp");
	}
	else{
		out.println("<script language=javascript> alert('"+ processAdmin.getMsg() + "'); location.href='manager.jsp';</script>");	
	}
}
%>