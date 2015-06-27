<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.sql.*"  %>
<%@ page import="com.web.www.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<link href="../css.css" rel="stylesheet" type="text/css" />

<table width="1001" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="../image/gaikuang1_r5_c2.jpg"><table width="1001" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="104">&nbsp;</td>
          <td background="../image/gaikuang1_r5_c2.jpg"><img src="../image/gaikuang1_r5_c5.jpg" width="891" height="18"></td>
        </tr>
      </table>
        <table width="1001" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="104">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="173"><img src="../image/kehu2_r2_c2_r2_c2_r2_c2.jpg" width="173" height="50" /></td>
                  <td width="380" align="right" bgcolor="#FFFFFF"><img src="../image/gaikuang1_r7_c11.jpg" width="332" height="45"></td>
                  <td width="242" align="right" valign="bottom" bgcolor="#FFFFFF">您現下所處的位置︰首頁 &gt;客戶回饋&nbsp;&nbsp;&nbsp;</td>
                </tr>
              </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="173"><img src="../image/gaikuang1_r10_c5.jpg" width="173" height="422"></td>
                    <td align="center" valign="top" bgcolor="#FFFFFF"><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="30" background="../image/gaikuang1_r9_c8.jpg">&nbsp;</td>
                        </tr>
                      </table>
                        <table width="97%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
                      <table width="97%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td align="center"><table id="table8" cellspacing="0" cellpadding="0" width="562" border="0">
                                <tbody>
                                  <tr>
                                    <td width="562" height="380" align="center" valign="top" 
                background="../image/kffk-bank.gif">
				
				
				<table id="table9" cellspacing="1" cellpadding="0" width="90%" 
                  border="0">
                                        <tbody>
                                          <tr>
                                            <td height="10" colspan="3">&nbsp;</td>
                                          </tr>
                                        </tbody>
                                       <form name="quetion" method="post" action="add_do.jsp?type=add"  onSubmit="return checkthis();" >
                                          <tr>
                                            <td width="14%" height="25" align="right">&nbsp;</td>
                                            <td width="43%" height="25">&nbsp;</td>
                                            <td width="43%" height="25" rowspan="5" align="center"><img src="../image/bi.jpg" width="157" height="118" 
                        border="0" /></td>
                                          </tr>
                                          <tr>
                                            <td height="25" colspan="2" align="center" class="cu">請你留言</td>
                                          </tr>
                                          <tr>
                                            <td height="25" align="right">類&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;別︰</td>
                                            <td height="25">
											<select name="classid" class="input" id="classid">
	  										<option >請選擇</option>
	  			<%
	     ProcessLeaveWordClass plwc = new ProcessLeaveWordClass();
	     List li = new ArrayList();
	     li=plwc.qurAllLeaveWordClass();   
	     if(li.size()>0)
	     {
	        for(int i=0;i<li.size();i++)
	        {
	          LeaveWordClass lwc= (LeaveWordClass)li.get(i);
	          out.print("<option value='"+lwc.getL_class_id()+"'");
			  //if(lwc.getL_class_id().equals(classid))
	          //   out.print("  selected");
	          out.print(">"+lwc.getL_class_name()+"</option>");
	        }
	     }
	  %>
        </select>
											<font 
                        color="#ff0000">*</font></td>
                                            </tr>
                                          <tr>
                                            <td height="25" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名︰</td>
                                            <td height="25"><input name="user" class="input" id="user" size="28" />
                                                <font 
                        color="#ff0000">*</font></td>
                                            </tr>
                                          <tr>
                                            <td height="25" align="right">電子郵箱︰</td>
                                            <td height="25"><input name="email" class="input" id="email" size="28" />
                                            <font 
                        color="#ff0000">*</font> </td>
                                            </tr>


                                          <tr>
                                            <td width="14%" height="25" align="right">回饋主題︰</td>
                                            <td height="25" colspan="2"><input 
                        name="title" class="input" id="title" size="55" />
                                            <font 
                        color="#ff0000">*</font> </td>
                                          </tr>
                                          <tr>
                                            <td width="14%" height="30" align="right" valign="top">回饋訊息︰</td>
                                            <td height="30" colspan="2" valign="top"><textarea name="content" cols="53" rows="5" class="input" id="content"></textarea>
                                            <font 
                        color="#ff0000">*</font></td>
                                          </tr>
                                          <tr>
                                            <td height="30" colspan="3" align="center" valign="middle"><input type="image" 
                        height="20" width="47" src="../image/quedin.gif" border="0" 
                        name="I1" /></td>
                                          </tr>
                                          <tr>
                                            <td height="30" colspan="3" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../image/13_r7_c3.png" height="15" />&nbsp;&nbsp;<a href="view.jsp?type=class&amp;classid=" class="red_hongse">檢視己回複留言</a></td>
                                          </tr>
                                        </form>
                                    </table>
									
									</td>
                                  </tr>
                                </tbody>
                            </table></td>
                          </tr>
                      </table></td>
                  </tr>
                </table>
				<!--<jsp:include page="../bottom_in.jsp"/>-->
			</td>
            <td width="102">&nbsp;</td>
          </tr>
      </table></td>
  </tr>
</table>
<script>
function checkthis()
{
   var classid=document.getElementById("classid")
   var user=document.getElementById("user")
   var email=document.getElementById("email")
   var content=document.getElementById("content")
   var title=document.getElementById("title")
   var isValid=1;
   
   if(classid.value=="0")
   {
     alert("請選擇留言訊息所屬類別﹗");
	 return false;
   }
   if(user.value==""||user.value==null)
   {
     alert("請輸入您的稱呼﹗");
	 return false;
   }
   
   if(email.value==null||email.value=="")
   {
     alert("請輸入您的電子郵箱﹗");
	 return false;
   }else  if(email.value.indexOf("@")==-1)
      {isValid=0; }
   else if(email.value.indexOf(".")==-1)
      {isValid=0;}
   if(isValid==0)
   {
     alert("您輸入的郵箱不合法，請重新輸入﹗");
	 return false;
   }
   
   if(title.value==""||title.value==null)
   {
      alert("請輸入問題的標題﹗");
	  return false;
   }
   if(content.value==""||content.value==null)
   {
     alert("請輸入問題的內容﹗");
	 return false;
   }
}
</script>