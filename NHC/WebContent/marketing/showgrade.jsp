<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" %>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.www.Article" %>

<html>
<head>
<title>高雄榮總國際醫療中心--</title>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
 <%	 String id=request.getParameter("id");
  	 String cid=request.getParameter("cid");
  	 ProcessArticle par = new ProcessArticle();
  	 List list = new ArrayList();
  	 Article ar = new Article();
  	 if("".equals(id)||id==null)
  	 {
  	    list=par.query(0,cid);
  	    Article ar1 = new Article();
  	    ar1 =(Article)list.get(0);
  	    id=ar1.getId();
  	 }
  	 par.getOnedate(id);
  	 ar=par.getArticle();
  	 String Title=ar.getTitle();
  	 String content =ar.getContent();
  %>
<body>
<jsp:include page="../sub/top.jsp" flush="true"/>
    <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" bgcolor="#FFFFFF"><table width="980" height="400" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="236" align="center" valign="top" bgcolor="#F6F6F6"><table width="224" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="../images/neiye_r4_c2.jpg" width="224" height="27"></td>
              </tr>
              <tr>
                <td align="center" valign="top" background="../images/pp99_r2_c2.jpg"><table width="100" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="10"></td>
                    </tr>
                </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="0">
                    <%     
	    ProcessArticle pa =  new ProcessArticle();
		Article  article = new Article();
	    List li = new ArrayList();
		li = pa.query(0,cid);
		if(li.size()>0)
		{
		   for(int i=0;i<li.size();i++)
		   {
		      article=(Article)li.get(i);
	 %>
                    <tr>
                      <td width="144"><table width="90" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td colspan="3"><img src="../images/neiye_r7_c31.jpg" width="208" height="4" /></td>
                        </tr>
                        <tr>
                          <td width="1" bgcolor="#D5D5D5"></td>
                          <td width="173" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="9%" align="center"><img src="../images/neiye_r12_c5.jpg" width="6" height="6" /></td>
                              <td width="91%"><A href="showgrade.jsp?cid=<%=cid%>&id=<%=article.getId()%>" class="red_link"><%=article.getTitle()%></A></td>
                            </tr>
                          </table></td>
                          <td width="1" bgcolor="#D5D5D5"></td>
                        </tr>
                        <tr>
                          <td colspan="3"><img src="../images/neiye_r16_c3.jpg" width="208" height="4" /></td>
                        </tr>
                      </table>
                        <table width="100" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="5"></td>
                            </tr>
                        </table></td>
                    </tr>
                    <%    }
      }else
      {
   %>
                    <tr><td align="center">暫時沒有訊息﹗</td></tr>
                    <%}%>
                    &nbsp;
                  </table>
                  
                </td>
              </tr>
              <tr>
                <td><img src="../images/neiye_r18_c2.jpg" width="224" height="9"></td>
              </tr>
            </table></td>
            <td width="4" background="../images/qiyezongshu_r4_c11.jpg">&nbsp;</td>
            <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
                </tr>
            </table>
              <table width="100" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td bgcolor="#F76A12"><img src="../images/neiye_r4_c12.jpg" width="743" height="48"></td>
                </tr>
                <tr>
                  <td height="25" align="center" background="../images/pp10.jpg" class="chengse"><%=Title%></td>
                </tr>
                <tr>
                  <td align="center" background="../images/pp10.jpg"><table width="94%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="4" background="../images/neiye_r15_c13.jpg"></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td background="../images/pp10.jpg"></td>
                </tr>
                <tr>
                  <td background="../images/pp10.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<%=content%></td>
                </tr>
                
              </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    <jsp:include page="../sub/foot.jsp" flush="true"/>
</body>
</html>
