<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*,com.web.database.*" errorPage="error/error.jsp" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String input = request.getParameter("checkcode");
String system = (String)session.getAttribute("checkcode");

if(username == null || username.equals("")){
	out.println("<script language=javascript> alert('用戶名不能為空,請輸入您的用戶名!'); location.href='index.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(username)){
	out.println("<script language=javascript> alert('用戶名中含有非法字元串!'); location.href='index.jsp';</script>");
}
else if(password == null || password.equals("")){
	session.setAttribute("username", username);
	out.println("<script language=javascript> alert('密碼不能為空,請輸入您的密碼!'); location.href='index.jsp';</script>");
}
else if(com.web.util.SpecialStringFilter.check(password)){
	session.setAttribute("username", username);
	out.println("<script language=javascript> alert('密碼中含有非法字元串!'); location.href='index.jsp';</script>");
}
else if(!input.equals(system)){
	session.setAttribute("username", username);
	out.println("<script language=javascript> alert('你輸入的驗証碼不正確,請重新輸入!'); location.href='index.jsp';</script>");	
}
else{
	session.setAttribute("username", username);
	
	Admin admin = new Admin();
	admin.setUsername(username);
	admin.setPassword(password);
	
	ProcessAdmin processAdmin = new ProcessAdmin();
	processAdmin.setAdmin(admin);
	processAdmin.checkLogin();
	
	if(processAdmin.isStatus()){
		session.setAttribute("admin", processAdmin.getAdmin());
		//生成欄目權限編號清單
		if((processAdmin.getAdmin()).getIsAdmin() != 1){
			Operation op = new Operation();
			
			int totalRecord = 0;
			ResultSet rs = op.query("SELECT COUNT(*) AS total FROM cms_class");
			ResultSet rs1 = null;
			while(rs.next()){
				totalRecord = rs.getInt("total");
			}
			op.closestmt();
			
			int permissionId[] = new int[totalRecord];
			int i = 0;
			for(i=0;i<totalRecord;i++)permissionId[i] = 0;
			rs = op.query("SELECT * FROM cms_permision WHERE cms_permision_aid="+(processAdmin.getAdmin()).getId());
			i = 0;
			while(rs.next()){
				int cid = rs.getInt("cms_class_id");
				permissionId[i++] = cid;
				rs1 = op.query("SELECT * FROM cms_class WHERE cms_class_pathid LIKE '%::"+cid+"::%'");
				while(rs1.next()){
					cid = rs1.getInt("cms_class_id");
					permissionId[i++] = cid;
				}
			}
			op.closestmt();
			op.closeconn();
			
			session.setAttribute("permissionId",permissionId);
		}
		response.sendRedirect("main.jsp");
	}
	else{
		out.println("<script language=javascript> alert('"+ processAdmin.getMsg() + "'); location.href='index.jsp';</script>");	
	}
}
%>