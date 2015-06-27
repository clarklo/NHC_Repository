<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<jsp:useBean id="link" scope="request" class="com.msg.bean.Link">
</jsp:useBean>
<jsp:include page="inc/head.jsp"></jsp:include>
<%
if(session.getAttribute("adminname")==null)
{ response.sendRedirect("login.jsp");}
%>
<SCRIPT language=javascript>
function ConfirmDel()
{
   if(confirm("確定要刪除選中的留言嗎？一旦刪除將不能恢復﹗"))
     return true;
   else
     return false;

}
</SCRIPT><body bgcolor="ffffff">
<BR><!----Navigation Bar Begin---->
<TABLE cellSpacing=0 cellPadding=0 width="75%" align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=center align=left width="70%"><IMG alt=""
      src="image/closedfold.gif" border=0><font color="#0E5FA7"><b>網址&gt;&gt; 友情連接添加</b></TD>
    <TD vAlign=bottom align=right width="30%"><a href="publish.jsp"><img src="image/t_new4.gif" border="0"></a>&nbsp;&nbsp;<a href="admin.jsp"><img src="image/t_new5.gif" border="0"></a>&nbsp;&nbsp;<a href="index.jsp"><img src="image/t_new3.gif" border="0"></a></TD>
  </TR></TBODY></TABLE><!----Navigation Bar End-----><BR>
<form action="addLink_pro.jsp" method="post">

<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE width="40%" border=0 align="center" cellPadding=5 cellSpacing=1 bgColor="#666666">
	  <TBODY>


        <TR align=middle bgColor="#ebeff5" height=22>
          <TD colspan="2" background=image/bbs>
		<font color="#0E5FA7"><b>友情連接添加</b>
		  </TD>
          </TR>
        <TR vAlign=center bgColor=#ffffff  align="center">
          <TD width="83">
            <span class="font0"><font color="#666666">連接介紹︰</span></TD>
          <TD width="191" bgColor=#ffffff align="center"><input name="intro" type="text" style="border:1px double rgb(187,185,185);font:9pt" size="40">
		  </TD>
        </TR>
        <TR vAlign=center align="center" bgColor=#ffffff>
          <TD width="83"><span class="font0"><font color="#666666">連接位址︰</span></TD>
          <TD bgColor=#ffffff align="center" width="191">
<input name="www" type="text"  value="http://" style="border:1px double rgb(187,185,185);font:9pt" size="40">
		  </TD>
        </TR>
        <TR vAlign=center align="center" bgColor=#ffffff>
          <TD width="83">
		  <span class="font0"><font color="#666666">連接圖片︰</span>
		  </TD>
          <TD bgColor=#ffffff align="center" width="191"><input name="img" type="text" style="border:1px double rgb(187,185,185);font:9pt" size="40"></TD>
        </TR>
		<TR vAlign=center align="center" bgColor=#ffffff>
          <TD bgColor=#ffffff align="center" colspan="2">
 <input type="submit" name="Submit" value="添加聯盟" style="border:1 solid #BBB9B9;background:#ffffff" class="button">
		  </TD>
        </TR>
<%
	Connection con=db.getConn();
	Statement stmt=con.createStatement();
	String sql="select * from link";
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next()){
%>
		<TR vAlign=center align="center" bgColor=#ffffff>
          <TD bgColor=#ffffff align="center">
<a href="delLink_pro.jsp?id=<%=rs.getString("id")%>" onClick="return ConfirmDel();"><img src="image/icon_delete_reply.gif" alt="刪除該連接。" width="16" height="16" border="0"></a>
		  </TD>
          <TD bgColor=#ffffff align="center">
            <a href="<%=rs.getString("www")%>" target="_blank"ss><img src="<%=rs.getString("img")%>" alt="<%=rs.getString("intro")%>" border="0"></a>
		  </TD>
        </TR>
<%
}
rs.close();
stmt.close();
con.close();
%>
       </TBODY></TABLE></TD></TR></TBODY></TABLE>
	   <TABLE cellSpacing=0 cellPadding=0 width="35%" align=center border=0>
  <TBODY>
  <TR>
  </TR></TBODY></TABLE>
<TABLE height=10 cellSpacing=0 cellPadding=0 width=10 border=0>
  <TBODY>
  <TR>
    <TD width="10"></TD></TR></TBODY></TABLE></form>
<br>
<div align="center">
<jsp:include page="inc/link.jsp"></jsp:include>
<jsp:include page="inc/footer.jsp"></jsp:include></div>

</BODY></HTML>
 </form>