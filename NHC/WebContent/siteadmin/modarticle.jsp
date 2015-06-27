<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.www.*,java.io.*,com.web.util.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission3.jsp"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
int no = Integer.parseInt(request.getParameter("no"));
String id = request.getParameter("id");

//欄目權限判斷
boolean hasPermission = false;
if(admin.getIsAdmin()==0){
	int permissionId[] = (int[])session.getAttribute("permissionId");						
	for(int i= 0;i<permissionId.length;i++){
		if(cid == permissionId[i]){
			hasPermission = true;
			break;
		}
	}
}
else if(admin.getIsAdmin()==1){
	//cms_admin_system
	hasPermission = true;
}

String title = request.getParameter("title");
String author = request.getParameter("author");
String date = request.getParameter("date");
String keyword = request.getParameter("keyword");
String summary = request.getParameter("summary");
String html = request.getParameter("html");
//String content = request.getParameter("Content");
String content = request.getParameter("content") != null ? request.getParameter("content") : "";
String indexImage = request.getParameter("indexImage");
int top = 0;
int scroll = 0;
int commend = 0;
if(request.getParameter("top")!=null){
	top = Integer.parseInt(request.getParameter("top"));
}
if(request.getParameter("scroll")!=null){
	scroll = Integer.parseInt(request.getParameter("scroll"));
}
int level = 0;
if(request.getParameter("commend")!=null){
	commend = Integer.parseInt(request.getParameter("commend"));
	level = Integer.parseInt(request.getParameter("level"));
}
int comment = Integer.parseInt(request.getParameter("comment"));
String username = admin.getUsername();
String imgfile = request.getParameter("imgfile");

if(!hasPermission){
	out.println("<script language=javascript> alert('您沒有修改此欄目的文章的權限,請與管理員聯繫!'); history.go(-1);</script>");
}
else if(title == null || title.equals("")){
	out.println("<script language=javascript> alert('文章標題不能為空,請輸入您的文章標題!');history.go(-1);</script>");
}
else if(keyword == null || keyword.equals("")){
	out.println("<script language=javascript> alert('關鍵字不能為空,請輸入文章的關鍵字!'); history.go(-1);</script>");
}
else if(summary == null || summary.equals("")){
	out.println("<script language=javascript> alert('摘要不能為空,請輸入文章的摘要!'); history.go(-1);</script>");
}
else if(content == null || content.equals("")){
	out.println("<script language=javascript> alert('文章內容不能為空,請輸入文章內容!'); history.go(-1);</script>");
}
else{
	//把'轉換成"	
	title = ReplaceAll.toSql(title);
	author = ReplaceAll.toSql(author);
	keyword = ReplaceAll.toSql(keyword);
	date = ReplaceAll.toSql(date);
	summary = ReplaceAll.toSql(summary);
	content = ReplaceAll.toSql(content);
	
	Article article = new Article();
	article.setId(id);
	article.setCid(cid);
	article.setTitle(title);
	article.setAuthor(author);
	article.setTime(date);
	article.setKeyword(keyword);
	article.setSummary(summary);
	article.setContent(content);
    article.setIndexImage(indexImage);
	article.setTop(top);
	article.setScroll(scroll);
	article.setCommend(commend);
	article.setLevel(level);
	article.setHtml(html);
	article.setComment(comment);
	article.setUsername(username);
	
	ProcessArticle processArticle = new ProcessArticle();
	ProcessPicture pp = new ProcessPicture();	
	processArticle.setArticle(article);
	processArticle.setCurrPath(request.getRealPath("/"));
	
	processArticle.mod(imgfile);
	
	if(processArticle.isStatus()){			
		out.println("<script language=javascript>location.href='admin.jsp?pid="+cid+"&no="+no+"';</script>");
	}
	else{
		out.println("<script language=javascript> alert('"+ processArticle.getMsg() + "'); history.go(-1);</script>");	
	}
}
%>