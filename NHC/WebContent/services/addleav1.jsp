<%@page import="util.DealString"%>
﻿<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" %>
<%@ page import="com.web.www.LeaveWord1"%>
<%@ page import="com.web.www.ProcessLeaveWord1"%>
<%@page import="www.LeaveWord"%>
<%@ page import="org.apache.commons.mail.DefaultAuthenticator" %>
<%@ page import="org.apache.commons.mail.Email" %>
<%@ page import="org.apache.commons.mail.EmailException" %>
<%@ page import="org.apache.commons.mail.HtmlEmail" %>
<%@ page import="com.web.database.*" %>
<%@ page import="www.ProcessDocDown" %>
<%@ page import="java.util.List" %>
<%@ page import="www.DocDown" %>
<%@ page import="www.ProcessClassify" %>
<%@ page import="java.text.*" %>
<%
   String l_user=request.getParameter("l_user");
   String user_company=request.getParameter("user_company");
   String user_sex=request.getParameter("user_sex");
   //String user_addr=request.getParameter("user_addr");
   String user_tel=request.getParameter("user_tel");
   String l_email =request.getParameter("l_email");
   String l_content=request.getParameter("l_content");
   String l_title=request.getParameter("l_title");
   //String l_class_id=request.getParameter("l_class_id");
   
   if("".equals(l_user)||l_user==null)
   {
     out.println("<script language=javascript> alert('請輸入您的姓名!'); history.go(-1);</script>");
     return;
   }
    if("".equals(user_company)||user_company==null)
   {
     out.println("<script language=javascript> alert('請選擇您所要預約的時間!'); history.go(-1);</script>");
     return;
   }
    if("".equals(user_sex)||user_sex==null)
   {
     out.println("<script language=javascript> alert('請選擇您的性別!'); history.go(-1);</script>");
     return;
   }
   if(l_content.length()>120)
   {
     out.println("<script language=javascript> alert('詢問內容請勿超過120個字(含換行及標點符號)!'); history.go(-1);</script>");
     return;
   }
 
   DealString ds = new DealString();
   ProcessLeaveWord1 plw = new ProcessLeaveWord1();
   LeaveWord1 lw = new LeaveWord1();
   lw.setL_content(ds.toString(l_content));
   lw.setL_email(ds.toString(l_email));
   lw.setL_user(ds.toString(l_user));
   //lw.setUser_addr(ds.toString(user_addr));
   lw.setUser_company(ds.toString(user_company));
   lw.setUser_sex(ds.toString(user_sex));
   lw.setUser_tel(ds.toString(user_tel));
   lw.setL_title(ds.toString(l_title));
   //lw.setL_class_id(ds.toString(l_class_id)); 
   
   plw.setLeaveword(lw);
   plw.addLeaveWord();
   String subject="高雄榮總國際醫療中心_美容預約(TW)";
   String message =null;
   

   message="有一筆新美容中心預約:\n項目:"+
	l_title+
	"\n諮詢內容:"+
	l_content+
	"\n基本資料:\n姓名:"+
	l_user+
	"\n性別:"+
	user_sex+
	"\n電子郵件:"+
	l_email+
	"\n電話:"+
	user_tel+
	"\n預約時間:"+
	user_company;

  if(plw.isStatus()){		  
	 Operation op = new Operation();
	 ResultSet rs = null;
	 String type0 =  "";
	 rs = op.query("SELECT * from cms_config where cms_config_id=1 ");
     rs.next();
     type0 = rs.getString("cms_config_url");
	 op.closestmt();		
    
    Email email = new HtmlEmail(); 
	String authuser = "nhcadmin@vghks.gov.tw";
	String authpwd = "";
	email.setHostName("isca.vghks.gov.tw");	
	email.setDebug(true);
	email.setCharset("UTF-8");
	email.setSubject(subject);
	try {
	    email.setFrom("nhcadmin@vghks.gov.tw", "醫療客服中心");
	    email.setMsg(message); 
	    email.addTo(type0, "親愛的預約管理者");
	    email.send();
	out.println("留言成功"); 
	} catch (EmailException e) {
	    e.printStackTrace();
	    out.println("郵件發送失敗!");
	}	
            out.println("<script language=javascript>alert('預約成功﹗請耐心等待回覆');location.href='../index.jsp';</script>");
	}
	else{
		out.println("<script language=javascript> alert('"+ plw.getMsg() + "'); history.go(-1);</script>");	
	}
%>