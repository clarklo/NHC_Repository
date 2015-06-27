
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
  String to = request.getParameter("to");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Mail Input</title>
</head>
<style type="text/css">
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
	margin:0;
	padding: 0;
}
table {
	border-collapse:collapse;
	border-spacing:0;
	font-family: "新細明體";
}
fieldset, img {
	border:0;
}
address, caption, cite, code, dfn, em, strong, th, var {
	font-style:normal;
	font-weight:normal;
}
ol, ul {
	list-style:none;
}
caption, th {
	text-align:left;
}
/*h1, h2, h3, h4, h5, h6 {
	font-size:100%;
	font-weight:normal;
}*/
q:before, q:after {
	content:'';
}
abbr, acronym {
	border:0;
}
.clear{
	clear:both;}
.mail_bg{
	width:682px;
	height:420px;
	background-image:url(../images/mailTo.png);
	background-repeat:no-repeat;
	margin:15px;
	float:left;}
.mail_input{
	float:left;
	margin-left:250px;
	margin-top:100px;}
.mail_input li{
	font-size:17px;
	color:#333;
	margin-bottom:20px;}
.mail_input li .w_in10{
	padding:2px;
	margin-left:8px; 
  font-family: 'Helvetica Neue', Helvetica, Verdana, sans-serif;
  color: #7988a3;
  font-size:14px;
  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.8);
  background-color: #fff;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#edf3f9), to(#fff));
  background-image: -webkit-linear-gradient(top, #edf3f9, #fff);
  background-image: -moz-linear-gradient(top, #edf3f9, #fff);
  background-image: -ms-linear-gradient(top, #edf3f9, #fff);
  background-image: -o-linear-gradient(top, #edf3f9, #fff);
  background-image: linear-gradient(top, #edf3f9, #fff);
  border: 1px solid;
  border-color: #abbce8 #c3cae0 #b9c8ef;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -webkit-transition: all 0.25s linear;
  -moz-transition: all 0.25s linear;
  transition: all 0.25s linear;}
.mail_input li .w_in10:focus {
  outline: none;
  color: #525864;
  border-color: #84c0ee;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
}
.SUBMIT{
	width:380px;
	margin:0px auto;}
.SUBMIT ul{
	width:500px;
	text-align:center;}
.SUBMIT ul li{
	display:inline;
	margin-left:20px;}
.SUBMIT ul li .submit-button{
	display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 8px;
    border: 1px solid #4982a8;
    border-radius: 9px;
    background: #89d6fa;
    background: -webkit-gradient(linear, left top, left bottom, from(#89d6fa), to(#4a8cb8));
    background: -moz-linear-gradient(top, #89d6fa, #4a8cb8);
    background: linear-gradient(to bottom, #89d6fa, #4a8cb8);
    text-shadow: #345d78 1px 1px 1px;
    font: normal normal bold 16px arial;
    color: #ffffff;
    text-decoration: none;}

.SUBMIT ul li .submit-button:focus, .submit-button:hover{
    border: 1px solid #68b9f0;
    background: #a4ffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#a4ffff), to(#59a8dd));
    background: -moz-linear-gradient(top, #a4ffff, #59a8dd);
    background: linear-gradient(to bottom, #a4ffff, #59a8dd);
    color: #ffffff;
    text-decoration: none;
}
.SUBMIT ul li .submit-button:active {
    background: #528096;
    background: -webkit-gradient(linear, left top, left bottom, from(#528096), to(#4a8cb8));
    background: -moz-linear-gradient(top, #528096, #4a8cb8);
    background: linear-gradient(to bottom, #528096, #4a8cb8);
}
.SUBMIT ul li .submit-button_c{
	display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 8px 8px;
    border: 1px solid #52720e;
    border-radius: 9px;
    background: #86ba16;
    background: -webkit-gradient(linear, left top, left bottom, from(#86ba16), to(#52720e));
    background: -moz-linear-gradient(top, #86ba16, #52720e);
    background: linear-gradient(to bottom, #86ba16, #52720e);
    text-shadow: #344809 1px 1px 1px;
    font: normal normal bold 16px arial;
    color: #ffffff;
    text-decoration: none;}

.SUBMIT ul li .submit-button_c:focus, .submit-button_c:hover{
    border: 1px solid #678f11;
    background: #a1df1a;
    background: -webkit-gradient(linear, left top, left bottom, from(#a1df1a), to(#628911));
    background: -moz-linear-gradient(top, #a1df1a, #628911);
    background: linear-gradient(to bottom, #a1df1a, #628911);
    color: #ffffff;
    text-decoration: none;
}
.SUBMIT ul li .submit-button_c:active {
    background: #52720e;
    background: -webkit-gradient(linear, left top, left bottom, from(#52720e), to(#52720e));
    background: -moz-linear-gradient(top, #52720e, #52720e);
    background: linear-gradient(to bottom, #52720e, #52720e);
}
</style>



    <body>
    	<form method="post" action="sendGMail.jsp">
        <div class="mail_bg">
            <div class="mail_input">
                <ul>
                	<li>Subject:<input id="subject" class="w_in10" size="40" type="text" name="subject" value=" 國際醫療中心 "></li>
					
                    <li>mailTo:<input id="mailto" class="w_in10" type="text" size="40" name="to" value="<%=to%>"></li>
                    
                    <li><textarea cols="50" rows="5" class="w_in10" type="text" name="content">
                    　輸入你想要寫的內容...
                    </textarea></li>
                    
                    
                 </ul>
            </div>
            <div class="clear"></div>
            <div class="SUBMIT">
                 <ul>
                    <li><input class="submit-button_c" type="submit" value="確定" name="send"/></li>
                    <li><input class="submit-button" type="reset" value="重填"  name="reset"/></li>
                </ul>
            </div>
        </div>
        </form>
    </body>
 </html>
   