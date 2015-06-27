<%@ page contentType="text/html; charset=big5" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<HTML><HEAD><TITLE>精品學習網留言</TITLE>
<STYLE>
.gray {
	FILTER: gray; CURSOR: hand
}
</STYLE>

<STYLE type=text/css>P {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: tahoma
}
INPUT {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: tahoma
}
SELECT {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: tahoma
}
TABLE {
	BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 2px
}
TD {
	BORDER-RIGHT: 1px; BORDER-TOP: 0px; FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: tahoma
}
A {
	COLOR: #142f50; TEXT-DECORATION: none
}
A:hover {
	TEXT-DECORATION: none
}
BODY {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: tahoma
}
TEXTAREA {
	FONT-SIZE: 9pt; FONT-FAMILY: tahoma
}
.menu {
	BORDER-RIGHT: #500000 1px; BORDER-TOP: #500000 1px; Z-INDEX: 1; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); VISIBILITY: hidden; BORDER-LEFT: #500000 1px; BORDER-BOTTOM: #500000 1px; POSITION: absolute; HEIGHT: 20px; BACKGROUND-COLOR: #fefeff; layer-background-color: #FEFEFF
}
.title {

}
.cau {

}
BODY {
	SCROLLBAR-ARROW-COLOR: #005fba; SCROLLBAR-BASE-COLOR: #ffffff
}
.btable {
	BORDER-RIGHT: #005fba 1px solid; BORDER-TOP: #005fba 1px solid; BACKGROUND-IMAGE: url(images/bmb2004/middle2.gif); BORDER-LEFT: #005fba 1px solid; BORDER-BOTTOM: #005fba 1px solid
}
.btablelow {
	BORDER-RIGHT: #005fba 1px solid; BORDER-TOP: #005fba 1px solid; BACKGROUND-IMAGE: url(images/bmb2004/middle2.gif); BORDER-LEFT: #005fba 1px solid; BORDER-BOTTOM: 1px
}
.bot {
	BORDER-RIGHT: rgb(0,0,0) 1px solid; BORDER-TOP: rgb(0,0,0) 1px solid; BORDER-LEFT: rgb(0,0,0) 1px solid
}
.bot2 {
	BORDER-RIGHT: #000000 1px solid; BORDER-TOP: black 0px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid
}
.bot4 {
	BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid
}
.bot3 {
	BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-BOTTOM-COLOR: black; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM-STYLE: solid
}
</STYLE>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</HEAD>
<BODY leftMargin=0 topMargin=0 bgcolor="ffffff">
<TABLE cellSpacing="0" cellPadding="0" width="778" align="center" border="0">
  
  <TR>
  <td height="130">
  <object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="obj1" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="778" height="160">
	<param name="movie" value="image/Flash/flash1.swf">
	<param name="quality" value="High">
	<embed src="image/Flash/flash1.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="obj1" width="778" height="160"></object>
  </td>
    </TR></TABLE>
<TABLE cellSpacing=0 cellPadding=10 width="80%" align=center border=0>
  <TBODY>
  <TR>
    <TD>歡迎您，<B>客人</B></TD>
    <TD align=right></TD></TR></TBODY></TABLE><BR>
<TABLE cellSpacing=1 cellPadding=1 width="75%" align=center>
  <TBODY>
  <TR align=middle>
    <TD align=middle width=34><IMG src="image/gb.gif" width=18 border=0></TD>
    <TD align=middle width=*>
      <SCRIPT language=JavaScript src="image/fader.js"
      type=text/javascript></SCRIPT>
     <marquee  height=20 hspace=5 loop=100 scrollamount=2
      scrolldelay=10 width=100% on="left" DIRECTI
      align="center">
<%
Connection conn1=db.getConn();
Statement stmt1=conn1.createStatement();
String s="select news from system";
ResultSet rs0=stmt1.executeQuery(s);
if(rs0.next()){
%>
              <span class="style9"><%=rs0.getString("news")%>
              </span>
<%
}
rs0.close();
stmt1.close();
conn1.close();
%>
        </marquee>
</TD></TR></TBODY></TABLE>