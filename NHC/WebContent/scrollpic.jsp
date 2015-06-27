<%@ page pageEncoding="big5" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.util.DealString" %>
<%@ page import="java.util.List" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=big5">
<STYLE>
IMG {
	BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; BORDER-TOP-COLOR: #000000; BORDER-RIGHT-COLOR: #000000
}
A:visited {
	FONT-SIZE: 12px; COLOR: #006600; TEXT-DECORATION: none
}
A:link {
	FONT-SIZE: 12px; COLOR: #006600; TEXT-DECORATION: none
}
A:active {
	FONT-SIZE: 12px; COLOR: #ff6600; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: 12px; COLOR: #ff6600; TEXT-DECORATION: none
}
BODY {
	FONT-SIZE: 12px; FONT-FAMILY: 標楷體
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: 標楷體
}
TH {
	FONT-SIZE: 12px; FONT-FAMILY: 標楷體
}
BODY {
	MARGIN: 3px 0px 0px
}
.style1 {color: #006600}
</STYLE>

<META content="MSHTML 6.00.2800.1522" name=GENERATOR></HEAD>
<BODY>
<TABLE width=750 height="90" border=0 align=center cellPadding=0 cellSpacing=0>
  <TBODY>
  <TR>
    <TD>
      <DIV id=demo style="OVERFLOW: hidden; WIDTH: 750px; COLOR: #ffffff">
      <TABLE cellSpacing=0 cellPadding=0 align=left border=0 cellspace="0">
        <TBODY>
        <TR>
          <TD id=demo1 vAlign=top>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0 valign="top">
              <TBODY>
              <TR>
                <%
                	
                  	  DealString ds=new DealString();
                  	  ProcessArticle pa=new ProcessArticle();
                  	  List list=pa.query(4,"155");
                  	  for(int i=0;i<list.size();i++)
                  	  {
                  	  	Article article=(Article)list.get(i);
                  	  	String title=article.getTitle();
                  	  	String id=article.getId();
                  	  	String img=ds.toString(pa.queryArticleimgByid(id));
                  	  	if("".equals(img)) continue;
                  	  	
                %>
                <TD rowspan="2">
                  <TABLE cellSpacing=0 cellPadding=0 align=center border=0>
                    
                    <TR>
                                <TD><a href="navigation/showproduct.jsp?id=<%=id%>" class="red_link" target="_parent"><img src="upload/images/<%=img%>" width="128" height="110" border="0" ></a></TD>
                      <TD rowspan="2"><IMG height=6 src="goout.files/spacer.gif" width=6 
                        border=0></TD></TR>
                              <TR> 
                                <TD height="20" align="center"><font color="#006600"><a href="navigation/display.jsp?id=<%=id%>" class="red_link" target="_parent"><%=title%></a></font></TD>
                    </TR>
                    <TR>
                      <TD></TD></TR>
                   </TABLE></TD>
                   <%
                   		}
                   %>
				
               </TR>
              
              </TBODY></TABLE></TD>
          <TD id=demo2 vAlign=top>&nbsp;</TD></TR></TBODY></TABLE></DIV>
      <SCRIPT>
var speed3=20//速度數值越大速度越慢
demo2.innerHTML=demo1.innerHTML
function Marquee(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth
else{
demo.scrollLeft++
}
}
var MyMar=setInterval(Marquee,speed3)
demo.onmouseover=function() {clearInterval(MyMar)}
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed3)}
</SCRIPT>
    </TD></TR></TBODY></TABLE></BODY></HTML>