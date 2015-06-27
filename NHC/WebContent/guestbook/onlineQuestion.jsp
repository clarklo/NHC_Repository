<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>

<%@ page import="com.web.www.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<head>
<title>OQ</title>
<%
   String classid=(String)request.getAttribute("classid");
%>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #013B88}
.STYLE2 {color: #0065AD}
.STYLE4 {color: #E1F2FF}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function showhidetr(id){

var mytable=document.getElementById("openrow");

	for(i=1;i<mytable.rows.length;i++){
	
		if(mytable.rows(i).id!=""){
		if(mytable.rows(i).id==id){
			
			if(mytable.rows(i).style.display=="none"){
				mytable.rows(i).style.display="";
			}else{
				mytable.rows(i).style.display="none";
			}
		}else{
			mytable.rows(i).style.display="none";
		}
	}
	}
}
function resetBtn(fm){
   　　 fm.reset();
    　　return false;
　　}


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
//-->
</script>
</head>
<body >
<jsp:include page="../sub/top.jsp" flush="true"/>
        
        <table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" valign="top"><img src="../image/i.jpg" width="867" height="7"></td>
              </tr>
              <tr>
                <td align="right"><jsp:include page="../sub/sub_middle.jsp" flush="true"/></td>
              </tr>
              <tr>
                <td align="right" valign="top"><table width="850" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="6" bgcolor="#FFFEFF"></td>
                    <td width="838"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="4" bgcolor="#FFFFFF"></td>
                      </tr>
                      <tr>
                        <td height="84"><table width="850" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="6" bgcolor="#FFFEFF"></td>
                            <td width="838"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="4" bgcolor="#FFFFFF"></td>
                                </tr>
                                <tr>
                                  <td height="84"><img src="../image/qq_r2_c2.jpg" width="837" height="84"></td>
                                </tr>
                                <tr>
                                  <td height="4" bgcolor="#FFFFFF"></td>
                                </tr>
                            </table></td>
                            <td width="6" bgcolor="#FFFFFF"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="4" bgcolor="#FFFFFF"></td>
                      </tr>
                    </table></td>
                    <td width="6" bgcolor="#FFFFFF"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="right" valign="top"><table width="850" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                  <tr>
                    <td width="4" bgcolor="#FFFFFF"></td>
                    <td width="582" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                          <tr>
                            <td height="10" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#015CCB">
                                <tr bgcolor="#15C1EC">
                                  <td bgcolor="#FFFFFF">
								  <table width="100%" border="0" cellspacing="1" cellpadding="0" id="openrow">
                                    <tr>
                                      <td width="10%" height="25" align="center" bgcolor="#015CCB" class="cubai">編號</td>
                                      <td width="41%" align="center" bgcolor="#015CCB" class="cubai">標題</td>
                                      <td width="22%" align="center" bgcolor="#015CCB" class="cubai">留言者</td>
                                      <td width="27%" align="center" bgcolor="#015CCB" class="cubai">回複時間</td>
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
											String reply=(String)obj[5];
                                    		String subTitle=title;
                                    		if(subTitle.length()>21)
                                    			subTitle=subTitle.substring(0,21);
								%>			
								   
								    <tr>
                                      <td height="25" align="center" bgcolor="#EBFAFC"><%=obj[0]%></td>
                                      <td align="center" bgcolor="#EBFAFC"><SPAN style="cursor:hand"  onClick="showhidetr('<%=obj[0]%>');" title="點擊這裡檢視回複訊息"><%=subTitle%></SPAN></td>
                                      <td align="center" bgcolor="#EBFAFC"><%=obj[2]%></td>
                                      <td align="center" bgcolor="#EBFAFC"><%=obj[3]%></td>
                                    </tr>
                                    <tr  id="<%=obj[0]%>" style="display:none;">
                                      <td height="25" colspan="4" align="center"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#74A8E7">
                                        <tr>
                                          <td height="80" bgcolor="#FFFFFF" ><table width="100%" height="80" border="0" cellpadding="0" cellspacing="0">
                                              <tr>
                                                <td width="14%" align="center" bgcolor="#A3CBFE" class="cuhei">留言回複</td>
                                                <td width="86%">&nbsp;&nbsp;<%=obj[4]%></td>
                                              </tr>
                                              <tr align="center" bgcolor="#A3CBFE">
                                                <td height="1" colspan="2" bgcolor="#6BADFE"></td>
                                              </tr>
                                              <tr>
                                                <td align="center" bgcolor="#A3CBFE" class="cuhei">回複訊息</td>
                                                <td>&nbsp;&nbsp;<%=(!"".equals(reply)&&reply!=null)? reply:"暫無回複"%></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                      </table></td>
                                      </tr>
									    <%
                              		}
                              		v.clear();
                              	}
                              	
                              %>
									 
                                    <tr>
                                      <td height="25" colspan="4" align="center" bgcolor="#B1EBF3"><%
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
            <a href="../server/OnlineQuestion?pgnum=1&type=class&classid=<%=classid%>"   class="link1">【最前頁】</a>
            <a href="../server/OnlineQuestion?pgnum=<%=curpageNum-1%>&type=class&classid=<%=classid%>"  class="link1">【上一頁】</a>
        <%
        }
        %>
        <%
        if(curpageNum>=MaxPagenum){
            out.print("【下一頁】【最後頁】");
        }else{
        %>
        <a href="../server/OnlineQuestion?pgnum=<%=curpageNum+1%>&type=class&classid=<%=classid%>"   class="link1">【下一頁】</a>
        <a href="../server/OnlineQuestion?pgnum=<%=MaxPagenum%>&type=class&classid=<%=classid%>"  class="link1">【最後頁】</a>
        <%
        }
        %></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td>&nbsp;</td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#DCF7FA">
							  <form name="quetion" method="post" action="../server/OnlineQuestion?type=add"  onSubmit="return checkthis();" >
                                <tr>
                                  <td height="30" bgcolor="#B1EBF3">&nbsp; 問題類別︰ </td>
                                  <td bgcolor="#FFFFFF"><select name="classid" class="input" id="classid">
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
			  if(lwc.getL_class_id().equals(classid))
	             out.print("  selected");
	          out.print(">"+lwc.getL_class_name()+"</option>");
	        }
	     }
	  %>
        </select> </td>
                                </tr>
                                <tr>
                                  <td width="20%" height="30" bgcolor="#B1EBF3">&nbsp;&nbsp;留言者:</td>
                                  <td width="80%" bgcolor="#FFFFFF"><input name="user"type="text" class="input"  id="user" size="30">
                                    <span class="zihongse">*</span></td>
                                </tr>
                                <tr>
                                  <td height="30" bgcolor="#B1EBF3">&nbsp;&nbsp;Email:</td>
                                  <td bgcolor="#FFFFFF"><input name="email" id="email" type="text"class="input" size="30">
                                    <span class="zihongse">*</span></td>
                                </tr>
                                <tr>
                                  <td height="30" bgcolor="#B1EBF3">&nbsp;&nbsp;留言標題:</td>
                                  <td bgcolor="#FFFFFF"><input name="title"  id="title"type="text" class="input" size="30">
                                    <span class="zihongse">*</span></td>
                                </tr>
                                <tr>
                                  <td height="130" bgcolor="#B1EBF3">&nbsp;&nbsp;留言內容:</td>
                                  <td bgcolor="#FFFFFF"><textarea name="content" id="content" class="input1" cols="30" rows="9"></textarea>
                                    <span class="zihongse">*</span></td>
                                </tr>
                                <tr>
                                  <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><input name="Submit"  src="../image/a_r2_c2.jpg"type="image" width="50" height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../image/a_r2_c4.jpg" width="50" onClick="reset();" height="22"></td>
                                </tr>
                             </form> </table></td>
                          </tr>
                      </table></td>
                    <td width="4" bgcolor="#FFFFFF"></td>
                    <td valign="top" bgcolor="#DCF7FA"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                        <tr>
                          <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td height="42"><img src="../image/qq_r4_c3.jpg" width="230" height="37"></td>
                                  </tr>
                                  <tr>
                                    <td height="1" bgcolor="#21B7D1"></td>
                                  </tr>
                                </table>
                                  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td height="3"></td>
                                    </tr>
                                  </table>
                                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
								  
								  <%
								      ProcessLeaveWordClass plwc1 = new ProcessLeaveWordClass();
	     List lit = new ArrayList();
	     lit=plwc1.qurAllLeaveWordClass();  
	     if(li.size()>0)
	     {
	        for(int i=0;i<lit.size();i++)
	        {
	          LeaveWordClass lwc1= (LeaveWordClass)lit.get(i);
	         				  
								  %>
                                    <tr>
                                      <td width="35" height="25" align="center" bgcolor="#DCF7FA">&nbsp;<img src="../image/lastpost.gif" width="11" height="10"></td>
                                      <td width="1" bgcolor="#FFFFFF"></td>
                                      <td width="205" bgcolor="#DCF7FA">&nbsp;&nbsp;&nbsp;<a href="../server/OnlineQuestion?type=class&classid=<%=lwc1.getL_class_id()%>" class="red_link"><%=lwc1.getL_class_name()%></a></td>
                                    </tr>
	<%      }
	     }
	%>
                                    <tr>
                                      <td height="1" colspan="3" bgcolor="#FFFFFF"></td>
                                    </tr>
                                  </table></td>
                              </tr>
                          </table></td>
                        </tr>
                        
                        
                        
                        
                        
                        
                    </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="533" align="center" valign="bottom"><img src="../image/c_r2_c2.jpg" width="229" height="190"></td>
                        </tr>
                      </table></td>
                    <td width="4" bgcolor="#FFFFFF"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="right" valign="top"><jsp:include page="../sub/foot.jsp"/></td>
              </tr>
              
              
              
            </table></td>
            <td width="70">&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</body>
</html>