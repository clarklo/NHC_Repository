<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<jsp:useBean id="m_pages" scope="page" class="com.msg.bean.Pagination">
</jsp:useBean>
<html>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
<SCRIPT language="JavaScript">
function proadd()
{
    if (document.proaddform.name.value=="")
    {
		alert("請輸入您的姓名﹗");
		document.proaddform.name.focus();
		return false;
    }
    if (document.proaddform.qq.value=="")
    {
		alert("請輸入您的qq號碼﹗");
		document.proaddform.qq.focus();
		return false;
    }
    if (document.proaddform.email.value=="")
    {
		alert("請輸入您的email位址﹗");
		document.proaddform.email.focus();
		return false;
    }
    if (document.proaddform.http.value=="")
    {
		alert("請輸入您的個人主頁﹗");
		document.proaddform.http.focus();
		return false;
    }
    if (document.proaddform.content.value=="")
    {
		alert("請輸入您的留言﹗");
		document.proaddform.content.focus();
		return false;
    }
	
}
</script>
<body bgcolor="#FFFFFF">
<tr><td valign="top" background="../images/12-1_r1_c2.jpg"><jsp:include page="../sub/top.jsp"></jsp:include>
  <table width="990" height="378" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="31" bgcolor="#BAC5D9"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
      <tbody>
        <tr>
          <td width="100%" height="30" align="left" valign="center" bgcolor="#A3B2CC">&nbsp;<img alt=""
      src="image/closedfold.gif" border="0" /><font color="#0E5FA7"><b>高雄榮民總醫院&gt;&gt; 真情留言&gt;&gt;發表留言</b></td>
          <td width="30%" align="right" valign="bottom" bgcolor="#ACB9D1"><a href="index.jsp"><img src="image/t_new3.gif" border="0" /></a></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
      <table cellspacing="0" cellpadding="0" width="95%" align="center" border="0" >
      <tbody>
        <tr>
          <td><div align="center">
              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
                <tbody>
                  <tr align="middle" bgcolor="#ebeff5" height="22">
                    <td colspan="2" background="image/bbs"><div align="center"><font color="#0E5FA7"><b>用戶訊息</b></div></td>
                    <td width="378" background="image/bbs"><div align="center"><font color="#0E5FA7"><b>留言內容</b></div></td>
                  </tr>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td width="65" align="left"><font color="#0E5FA7">姓名︰</font></td>
                    <td width="120" align="center"><input name="name" type="text" id="name" style="border:1px double rgb(187,185,185);font:9pt" />
                    </td>
                    <td rowspan="4" align="center" valign="top" bgcolor="#ffffff"><font color="#000099"><span class="font0">
                      <textarea name="content" cols="80" rows="8" id="content" wrap="hard" style="border:1px double rgb(187,185,185);font:9pt"></textarea>
                    </span></font></td>
                  </tr>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td align="left"><font color="#0E5FA7">性別︰</font></td>
                    <td align="left"><font color="#666666">男
                      <input type="radio" name="sex" value="男" />
                      女
                      <input type="radio" name="sex" value="女" checked="checked" /></td>
                  </tr>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td align="left"><font color="#0E5FA7">QQ︰</font></td>
                    <td align="left"><input name="qq" type="text" id="qq" style="border:1px double rgb(187,185,185);font:9pt" /></td>
                  </tr>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td align="left"><font color="#0E5FA7">E-MAIL︰</font></td>
                    <td align="left"><input name="email" type="text" id="email" style="border:1px double rgb(187,185,185);font:9pt" /></td>
                  </tr>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td align="left"><font color="#0E5FA7">個人主頁︰</font></td>
                    <td align="left"><input name="http" type="text" id="http" style="border:1px double rgb(187,185,185);font:9pt" value="http://" /></td>
                    <td align="center" valign="top" bgcolor="#ffffff"><input type="submit" name="Submit" value="發表留言" style="border:1 solid #BBB9B9;background:#ffffff" class="button" />
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="reset" name="Submit2" value="重寫" style="border:1 solid #BBB9B9;background:#ffffff" class="button" />
                    </td>
                  </tr>
                </tbody>
              </table>
          </div></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>

      <TABLE cellSpacing=0 cellPadding=0 width="80%" align=center border=0>
  <TBODY>
  </TBODY></TABLE>
      <BR>
<div align="center">
<jsp:include page="sub/foot.jsp"></jsp:include></div>
</BODY></HTML>