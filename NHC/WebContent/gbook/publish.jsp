<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<body bgcolor="#FFFFFF">
<jsp:include page="../sub/top.jsp"></jsp:include>
<%
if(session.getAttribute("adminname")==null)
{ response.sendRedirect("login.jsp");}
%>
<%
Connection conn=db.getConn();
Statement stmt=conn.createStatement();
String sql="select * from system";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
%>
<table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#A3B2CC">
    <td><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
      <tbody>
        <tr>
          <td valign="center" align="left" width="70%">&nbsp;<img alt=""
      src="image/closedfold.gif" border="0" /><font color="#0E5FA7"><b>高雄榮民總醫院&gt;&gt;真情留言&gt;&gt; 公告修改</b></td>
          <td valign="bottom" align="right" width="30%">&nbsp;&nbsp;<a href="admin.jsp"><img src="image/t_new5.gif" border="0" /></a>&nbsp;&nbsp;<a href="index.jsp"><img src="image/t_new3.gif" border="0" /></a></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td><form action="publish_pro.jsp" method="post" name="form1" id="form1">
      <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
        <tbody>
          <tr>
            <td><table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#666666">
                <tbody>
                  <tr align="middle" bgcolor="#ebeff5" height="22">
                    <td background="image/bbs"><font color="#0E5FA7"><b>公告修改</b> </td>
                  </tr>
                  <tr valign="center" bgcolor="#ffffff"  align="center">
                    <td height="200"><textarea name="news" cols="80" rows="12" id="news" style="border:1px double rgb(187,185,185);font:9pt"><%=rs.getString("news")%></textarea>                    </td>
                  </tr>
                  <tr valign="center" align="center" bgcolor="#ffffff">
                    <td bgcolor="#ffffff" align="center"><input name="submit" type="submit" class="button" style="border:1 solid #BBB9B9;background:#ffffff" value="更改" />
                    </td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
      <table cellspacing="0" cellpadding="0" width="35%" align="center" border="0">
        <tbody>
          <tr> </tr>
        </tbody>
      </table>
      </form></td>
  </tr>
</table>

	
	  <br>
	<div align="center">
<jsp:include page="sub/foot.jsp"></jsp:include></div>
</BODY></HTML>
<%

conn.close();
stmt.close();
%>