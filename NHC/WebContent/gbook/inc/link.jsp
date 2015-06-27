<%@ page contentType="text/html; charset=big5" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<TABLE cellSpacing=0 cellPadding=1 width="80%" bgColor=#005fba
        border=0>
            <TBODY>
          <TR>
            <TD  bgColor="#f5f6f6"
            height=22><b><FONT color=#666666>==&nbsp;Áp·ùºô¯¸&nbsp;==</FONT></b><jsp:include page="online.jsp"></jsp:include></TD></TR></TBODY>
          </TABLE>
          <TABLE cellSpacing=1 cellPadding=5 width="80%" bgColor="#666666"
        border=0>
          <TR>
            <TD align=middle width=26 bgColor=#ffffff><IMG
            src="image/shareforum.gif"></TD>
            <TD bgColor=#ffffff>
<%
	Connection con=db.getConn();
	Statement stmt=con.createStatement();
	String sql="select * from link";
	ResultSet rs=stmt.executeQuery(sql);
%>
<marquee scrollamount="2" scrolldelay="1" hspace="0" vspace="0" onmouseover="this.stop();" onmouseout="this.start();" class="content-bg">
<%
	while(rs.next()){
		String intro=rs.getString("intro");
		String www=rs.getString("www");
		String img=rs.getString("img");
		%>
		<a href="<%=www%>" target="_blank"><img src="<%=img%>" alt="<%=intro%>" width="88" height="31" border="0"></a>
		
		<%
	}
rs.close();
stmt.close();
con.close();
%>
</marquee>
 </TABLE>
     