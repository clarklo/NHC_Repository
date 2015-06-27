<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission1.jsp"%>
<%
String name = request.getParameter("name");
String num = request.getParameter("num");
String currPathId = request.getParameter("currPathId");
String currPathName = request.getParameter("currPathName");
int pid = Integer.parseInt(request.getParameter("pid"));
String externURL = request.getParameter("externURL");
int outputrss = Integer.parseInt(request.getParameter("outputrss"));
int commend = 0;
if(request.getParameter("commend")!=null){
	commend = Integer.parseInt(request.getParameter("commend"));
}

if(name == null || name.equals("")){
	out.println("<script language=javascript> alert('類別名稱不能為空,請輸入類別名稱!'); location.href='classify.jsp?pid="+pid+"';</script>");
}
else if(com.web.util.SpecialStringFilter.check(name)){
	out.println("<script language=javascript> alert('類別名稱中含有非法字元串!'); location.href='classify.jsp?pid="+pid+"';</script>");
}
else if(num == null || num.equals("")){
	out.println("<script language=javascript> alert('類別序號不能為空,請輸入類別序號!'); location.href='classify.jsp?pid="+pid+"';</script>");
}
else{
	Classify classify = new Classify();
	classify.setName(name);
	classify.setNum(Integer.parseInt(num.trim()));
	classify.setPid(pid);
	classify.setExternURL(externURL);
	classify.setCommend(commend);
	classify.setIsOutputRSS(outputrss);
	
	ProcessClassify processClassify = new ProcessClassify();
	processClassify.setClassify(classify);
	processClassify.setCurrPathId(currPathId);
	processClassify.setCurrPathName(currPathName);
	
	processClassify.add();
	
	if(processClassify.isStatus()){		
		response.sendRedirect("classify.jsp?pid="+pid);
	}
	else{
		out.println("<script language=javascript> alert('"+ processClassify.getMsg() + "'); location.href='classify.jsp?pid="+pid+"';</script>");	
	}
}
%>