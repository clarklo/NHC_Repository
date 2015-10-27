<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*,java.io.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission3.jsp"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
int no = Integer.parseInt(request.getParameter("no"));
String id = request.getParameter("id");
String path = request.getRealPath("/");	

//欄目權限判斷 //20150930 改為有作業權限就有權限。
boolean hasPermission = true;
//if(admin.getIsAdmin()==0){
//	int permissionId[] = (int[])session.getAttribute("permissionId");						
//	for(int i= 0;i<permissionId.length;i++){
//		if(cid == permissionId[i]){
//			hasPermission = true;
//			break;
//		}
//	}
//}
//else if(admin.getIsAdmin()==1){
//	//cms_admin_system
//	hasPermission = true;
//}
if(hasPermission){
	ProcessArticle processArticle = new ProcessArticle();
	processArticle.del(path, id);
	
	if(processArticle.isStatus()){	
		response.sendRedirect("admin.jsp?pid="+cid+"&no="+no+"");
	}
	else{
		out.println("<script language=javascript> alert('"+ processArticle.getMsg() + "'); location.href='admin.jsp?pid="+cid+"&no="+no+"';</script>");	
	}
}
else{
	out.println("<script language=javascript> alert('您沒有刪除此欄目的文章的權限,請與cms_admin聯繫!'); location.href='admin.jsp?pid="+cid+"&no="+no+"';</script>");
}
%>