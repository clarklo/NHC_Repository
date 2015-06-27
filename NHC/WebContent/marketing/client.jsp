<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import="com.web.www.ProcessFriendSite" %>
<%@ page import="com.web.www.FriendSite" %>
<%@ page import="com.web.util.DealString" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>典型客戶</title>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
</head>
<body>
<jsp:include page="../sub/top.jsp" flush="true"/>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" bgcolor="#FFFFFF"><table width="980" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="236" align="center" valign="top" background="../images/oo2_r1_c2.jpg" bgcolor="#FFFFFF"><table width="236" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="236" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img src="../images/bb5.jpg" width="236" height="75"></td>
                            </tr>
                          </table>
                            <table width="236" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td>&nbsp;</td>
                                    </tr>
                                  </table>
                                    <table width="211" border="0" align="center" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td height="7"><img src="../images/oo3_r2_c2.jpg" width="211" height="7"></td>
                                      </tr>
                                    </table>
                                  <table width="211" border="0" align="center" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td height="7" background="../images/qiyezongshu_r10_c5.jpg"><table width="211" border="0" align="center" cellpadding="0" cellspacing="0">
                                          <tr>
                                            <td height="7" background="../images/qiyezongshu_r10_c5.jpg"><jsp:include page="left.jsp" flush="true"/></td>
                                          </tr>
                                        </table></td>
                                      </tr>
                                    </table>
                                  <table width="211" border="0" align="center" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td height="7"><img src="../images/oo3_r4_c2.jpg" width="211" height="7"></td>
                                      </tr>
                                  </table></td>
                              </tr>
                          </table></td>
                      </tr>
                  </table></td>
                  <td width="4" background="../images/qiyezongshu_r4_c11.jpg">&nbsp;</td>
                  <td height="300" align="center" valign="top" bgcolor="#FFFFFF"><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="28%" height="31"><img src="../images/oo32_r2_c2.jpg" width="129" height="26"></td>
                        <td width="72%" align="right" valign="bottom">&nbsp;</td>
                      </tr>
                    </table>
                      <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="13" background="../images/p_r12_c18.jpg"></td>
                        </tr>
                      </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                       <tr>
                       <%
					      ProcessFriendSite pfs = new ProcessFriendSite();
					      FriendSite fs = new FriendSite();
						  List list = new ArrayList();
						  list = pfs.qurAllFriendSite(0);
						  String sitename="";
						  String url ="";
						  if(list.size()>0)
						  { 
						     int i=0;
						     while(i<list.size())
						     {
						        fs = (FriendSite)list.get(i);
						        sitename=fs.getName();
						        url=fs.getUrl();
					   %>
					    
                          <td width="3%" height="25" align="center"><img src="../images/11_r2_c2.jpg" width="3" height="3"></td>
                          <td width="55%">
                               <%if("http://".equals(url)||"".equals(url)){%><%=sitename%>
                               <%}else{%>
                                <A href="<%=url%>" class="red_link"><%=sitename%></A></td>
                         <%     }
                                i++;
                                if(i%2==0)
                                  out.print("</tr><tr>");
                             }  
                           %>
                      </tr>
                        <% }else
                           {%>
                           <tr>
                              <td colspan="2" align="center">暫時沒有訊息﹗</td>
                           </tr>
                          <%}%>
                    </table>
                  </td>
                </tr>
            </table></td>
          </tr>
        </table>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td>&nbsp;</td>
          </tr>
</table>
      <jsp:include page="../sub/foot.jsp" flush="true"/></td>
  </tr>
</table>
</body>
</html>