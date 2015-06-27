<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission9.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
int type = Integer.parseInt(request.getParameter("type"));
String name = request.getParameter("name");
String url = request.getParameter("url");
String logo = request.getParameter("logo");
String introduce = request.getParameter("introduce");
//int commend = Integer.parseInt(request.getParameter("commend"));
//int check = Integer.parseInt(request.getParameter("check"));
String username = admin.getUsername();

if(name == null || name.equals("")){
	out.println("<script language=javascript> alert('網站名稱不能為空,請輸入您的網站名稱!'); location.href='friendsite.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(name)){
	out.println("<script language=javascript> alert('網站名稱中含有非法字元串!'); location.href='friendsite.jsp';</script>");
}
else if(url == null || url.equals("")){
	out.println("<script language=javascript> alert('網站位址不能為空,請輸入您的網站位址!'); location.href='friendsite.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(url)){
	out.println("<script language=javascript> alert('網站位址中含有非法字元串!'); location.href='friendsite.jsp';</script>");
}
else if((type == 1) && (logo==null || logo.equals(""))){
	out.println("<script language=javascript> alert('如果cms_link_type是logo類型的,則網站logo不能為空!'); location.href='friendsite.jsp';</script>");	
}
else{
	FriendSite friendSite = new FriendSite();
	friendSite.setId(id);
	friendSite.setType(type);
	friendSite.setName(name);
	friendSite.setUrl(url);
	friendSite.setLogo(logo);
	friendSite.setIntroduce(introduce);
	//friendSite.setCommend(commend);
	//friendSite.setCheck(check);
	friendSite.setUsername(username);
	
	ProcessFriendSite processFriendSite = new ProcessFriendSite();	
	processFriendSite.setFriendSite(friendSite);
	processFriendSite.mod();
	
	if(processFriendSite.isStatus()){		
		response.sendRedirect("friendsite.jsp");
	}
	else{
		out.println("<script language=javascript> alert('"+ processFriendSite.getMsg() + "'); location.href='friendsite.jsp';</script>");	
	}
}
%>