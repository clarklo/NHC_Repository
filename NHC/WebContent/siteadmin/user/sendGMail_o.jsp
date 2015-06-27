<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.mail.DefaultAuthenticator" %>
<%@ page import="org.apache.commons.mail.Email" %>
<%@ page import="org.apache.commons.mail.EmailException" %>
<%@ page import="org.apache.commons.mail.HtmlEmail" %>
<%
    
  String to               = request.getParameter("to");
  String content     = request.getParameter("content");
	
	String subject="高雄榮總國際醫療中心";
    String message = content; 

    Email email = new HtmlEmail(); 
	String authuser = "ihaoyu.gvkhs@gmail.com"; 
	String authpwd = "igvkhs0603";
	email.setHostName("smtp.gmail.com");
	email.setSmtpPort(465); 
	email.setAuthenticator(new DefaultAuthenticator(authuser,authpwd));
	email.setDebug(true);
	email.setSSL(true);
	email.setSslSmtpPort("465");
	email.setCharset("UTF-8");
	email.setSubject(subject);
	try {
	    email.setFrom("ihaoyu.gvkhs@gmail.com", "網站客服中心");
	    email.setMsg(message); 
	    email.addTo(to, "親愛的會員");
	    email.send();
	    out.println("郵件發送成功"); 
	} catch (EmailException e) {
	    e.printStackTrace();
	    out.println("郵件發送失敗.請先在WEB登入GMAIL");
	}	
%>