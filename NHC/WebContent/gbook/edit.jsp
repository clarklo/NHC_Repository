<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<body bgcolor="#FFFFFF">
<jsp:include page="../sub/top.jsp"></jsp:include>


<!----Navigation Bar End----->

<%

if(session.getAttribute("adminname")==null)
{response.sendRedirect("login.jsp");}
%>
<%
Connection conn=db.getConn();
Statement stmt=conn.createStatement();
String idz = new String(request.getParameter("id").getBytes("iso-8859-1"));
int id = Integer.parseInt(idz);
String condition="select * from message where id="+id;
ResultSet rs=stmt.executeQuery(condition);
rs.next();
%>
<table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#A3B2CC">
    <td><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
      <tbody>
        <tr>
          <td valign="center" align="left" width="70%">&nbsp;<img alt=""
      src="image/closedfold.gif" border="0" /><font color="#0E5FA7"><b>高雄榮民總醫院
            &gt;&gt;真情留言&gt;&gt; 編輯回複留言</b></td>
          <td width="30%" height="30" align="right" valign="bottom"><a href="index.jsp"><img src="image/t_new3.gif" border="0" /></a></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td><form action="edit_pro.jsp?id=<%=rs.getInt("id")%>" method="post" name="form1" id="form1">
      <table cellspacing="0" cellpadding="0" width="990" align="center" border="0">
        <tbody>
          <tr>
            <td><table width="60%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#666666">
                <tbody>
                  <tr align="middle" bgcolor="#ebeff5" height="22">
                    <td colspan="2" background="image/bbs"><font color="#0E5FA7"><b>編輯回複留言</b> </td>
                  </tr>
                  <tr valign="center" bgcolor="#ffffff"  align="center">
                    <td width="83"><font color="#666666"> <span class="font0">姓名︰</span></td>
                    <td width="191" bgcolor="#ffffff" align="center"><input name="name" type="text" value="<%=rs.getString("name")%>" size="70" style="border:1px double rgb(187,185,185);font:9pt" />
                    </td>
                  </tr>
                  <tr valign="center" align="center" bgcolor="#ffffff">
                    <td width="83"><font color="#666666"> <span class="font0">留言︰</span> </td>
                    <td bgcolor="#ffffff" align="center" width="191"><textarea name="content" cols="70" rows="5" style="border:1px double rgb(187,185,185);font:9pt"><%=rs.getString("content")%></textarea>
                    </td>
                  </tr>
                  <tr valign="center" align="center" bgcolor="#ffffff">
                    <td width="83"><font color="#666666"> <span class="font0">回複︰</span></td>
                    <td bgcolor="#ffffff" align="center" width="191"><textarea name="recontent" cols="70" rows="5" style="border:1px double rgb(187,185,185);font:9pt"><%=rs.getString("recontent")%></textarea>
                    </td>
                  </tr>
                  <tr valign="center" align="center" bgcolor="#ffffff">
                    <td bgcolor="#ffffff" align="center" colspan="2"><input type="submit" name="Submit" value="提交" style="border:1 solid #BBB9B9;background:#ffffff" class="button" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="reset" name="Submit2" value="取消" style="border:1 solid #BBB9B9;background:#ffffff" class="button" />
                    </td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
      <table cellspacing="0" cellpadding="0" width="55%" align="center" border="0">
        <tbody>
          <tr> </tr>
        </tbody>
      </table>
      </form></td>
  </tr>
</table>
<div align="center">
<jsp:include page="sub/foot.jsp"></jsp:include></div>
</BODY></HTML>
<%
conn.close();
stmt.close();
%>