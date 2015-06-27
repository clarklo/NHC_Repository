<%
	//session.removeAttribute("id");
	session.removeAttribute("loginname");
	String type=request.getParameter("type");
	if("relogin".equals(type)) response.sendRedirect("login.jsp");
	else response.sendRedirect("../index.jsp");
%>
