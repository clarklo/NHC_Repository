<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<body bgcolor="#FFFFFF">
<jsp:include page="../sub/top.jsp"></jsp:include>
<table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#A3B2CC">
    <td height="30" align="left"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
      <tbody>
        <tr>
          <td valign="center" align="left" >&nbsp;<img alt=""
      src="image/closedfold.gif" border="0" /><font color="#0E5FA7"><b>高雄榮民總醫院
            &gt;&gt; 真情留言&gt;&gt;管理員登錄</b></td>
          <td valign="bottom" align="right" width="30%"><a href="index.jsp"><img src="image/t_new3.gif" border="0" /></a></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr><form action="login_pro.jsp" method="post">
    <td valign="top"><table cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
      <tbody>
        <tr>
          <td height="200"><table width="40%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#666666">
              <tbody>
                <tr align="middle" bgcolor="#ebeff5" height="22">
                  <td colspan="2" background="image/bbs"><font color="#0E5FA7"><b>管理員登錄 </b> </td>
                </tr>
                <tr valign="center" bgcolor="#ffffff"  align="center">
                  <td width="83"><span class="font0"><font color="#666666">用戶名︰</span></td>
                  <td width="191" bgcolor="#ffffff" align="center"><input type="text" name="adminname" style="border:1px double rgb(187,185,185);font:9pt" />                  </td>
                </tr>
                <tr valign="center" align="center" bgcolor="#ffffff">
                  <td width="83"><span class="font0"><font color="#666666">密碼︰</span> </td>
                  <td bgcolor="#ffffff" align="center" width="191"><input type="password" name="adminpassword" style="border:1px double rgb(187,185,185);font:9pt" /></td>
                </tr>
                <tr valign="center" align="center" bgcolor="#ffffff">
                  <td bgcolor="#ffffff" align="center" colspan="2"><input type="submit" name="Submit" value="登錄" style="border:1 solid #BBB9B9;background:#ffffff" class="button" />
                    
                    <input type="submit" name="Submit2" value="取消" style="border:1 solid #BBB9B9;background:#ffffff" class="button" />                  </td>
                </tr>
              </tbody>
          </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </tbody>
    </table></td></form>
  </tr>
</table>

<!----Navigation Bar End----->
<BR>
<br>
<div align="center">
<jsp:include page="sub/foot.jsp"></jsp:include></div>

</BODY></HTML>
 </form>