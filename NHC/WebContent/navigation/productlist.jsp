<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessDocDown" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.www.DocDown" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="java.util.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮總國際醫療中心</title>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
  </head>
<%
  	 String cid=(String)request.getAttribute("cid");
  %>
  <body>
   <jsp:include page="../sub/top.jsp"/>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" bgcolor="#FFFFFF"><table width="980" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="236" align="center" valign="top" background="../images/oo2_r1_c2.jpg" bgcolor="#FFFFFF">
                    <table width="236" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="236" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img  src="../images/bb6.jpg" width="236" height="75"></td>
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
                                        <td height="7" background="../images/qiyezongshu_r10_c5.jpg"></td>
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
                  <td align="center" valign="top" bgcolor="#FFFFFF"><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr><td width="3%" height="31"><img src="../images/g_r2_c2.jpg" width="20" height="20"></td>
                      <td width="26%">&nbsp;&nbsp;&nbsp;<span class="cuhei">產品展示</span></td>
                      <td width="70%" align="right" valign="bottom">&nbsp;</td>
                    </tr>
                    </table>
                      <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="13" background="../images/p_r12_c18.jpg"></td>
                        </tr>
                      </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                    </table>
                    <%
                    	ProcessClassify pc=new ProcessClassify();
                    	String classname=pc.queryNameByid(cid);
                    %>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E4E4E4">
                      <tr>
                        <td height="22" colspan="2" bgcolor="#FFFFFF">&nbsp;<span class="14cuhongse"><%=classname%></span></td>
                        <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
                      </tr>
                      <%
                            Vector v=(Vector)(Object)request.getAttribute("Info");
						          request.removeAttribute("Info");
						       
						          if (v!=null){
						                Enumeration e=v.elements();
										while(e.hasMoreElements())
										{
											Object[] obj=(Object[])e.nextElement();
                                    		String title=(String)obj[1];
                                    		String id=(String)obj[0];
                                    		String time=(String)obj[2];
                                    		time=time.substring(0,10);
                                    		String subTitle=title;
                                    		if(subTitle.length()>31)
                                    			subTitle=subTitle.substring(0,31);
					%>		
                      <tr>
                        <td width="4%" height="25" align="center" bgcolor="#FFFFFF"><img src="../images/sy10_r2_c2.jpg" width="3" height="3"></td>
                        <td width="78%" bgcolor="#FFFFFF">&nbsp;<span class="14hao"><a href="showproduct.jsp?id=<%=id%>" title=<%=title%> class="red_link15"><%=subTitle%></a></span></td>
                        <td width="18%" align="center" bgcolor="#FFFFFF" class="14hao">[<%=time%>]</td>
                      </tr>
                      
                      
                      <%
                              		}
                              		v.clear();
                              	}
                              	
                              %>
                            
                    </table>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="30" align="right"> <%
        String curpage=(String)(Object)request.getAttribute("Curpage");
        request.removeAttribute("Curpage"); 
        String maxpagenum=(String)(Object)request.getAttribute("Maxpage");
        request.removeAttribute("Maxpage");
     
        int MaxPagenum=Integer.parseInt(maxpagenum); 
   	    int curpageNum=Integer.parseInt(curpage);      
        %>
         共<span class="red_font"><%=MaxPagenum%></span>頁 第
        <span class="red_font"><%=curpageNum%></span>頁 共檢索到
        <span class="red_font"><%=(String)request.getAttribute("Counts")%>條</span>
        
        <%
        if(curpageNum==1){
            out.print("【最前頁】【上一頁】");
        }else{
        %>
            <a href="NewsList?pgnum=1&cid=<%=cid%>"   class="red_link15">【最前頁】</a>
            <a href="NewsList?pgnum=<%=curpageNum-1%>&cid=<%=cid%>"  class="red_link15">【上一頁】</a>
        <%
        }
        %>
        <%
        if(curpageNum>=MaxPagenum){
            out.print("【下一頁】【最後頁】");
        }else{
        %>
        <a href="NewsList?pgnum=<%=curpageNum+1%>&cid=<%=cid%>"   class="red_link15">【下一頁】</a>
        <a href="NewsList?pgnum=<%=MaxPagenum%>&cid=<%=cid%>"  class="red_link15">【最後頁】</a>
        <%
        }
        %></td>
                      </tr>
                    </table>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        
                      </tr>
                    </table></td>
                </tr>
            </table></td>
          </tr>
        </table>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
		<jsp:include page="../sub/foot.jsp"/></td>
  </tr>
</table>
  </body>
</html>