<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%
   String classid=(String)request.getAttribute("classid");
%>
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
                        <table width="97%" border="0" cellspacing="1" cellpadding="0" id="openrow">
                        <tr>
                          <td width="10%" height="25" align="center" bgcolor="#F2F2F2" class="cubai">編號</td>
                          <td width="41%" align="center" bgcolor="#F2F2F2" class="cubai">標題</td>
                          <td width="22%" align="center" bgcolor="#F2F2F2" class="cubai">留言者</td>
                          <td width="27%" align="center" bgcolor="#F2F2F2" class="cubai">回覆時間</td>
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
                          <td height="25" align="center" bgcolor="#FFFFFF"><%=obj[0]%></td>
                          <td align="center" bgcolor="#FFFFFF"><span style="cursor:hand"  onclick="showhidetr('<%=obj[0]%>');" title="點擊這裡檢視回複訊息"><%=subTitle%></span></td>
                          <td align="center" bgcolor="#FFFFFF"><%=obj[2]%></td>
                          <td align="center" bgcolor="#FFFFFF"><%=obj[3]%></td>
                        </tr>
                        <tr  id="<%=obj[0]%>" style="display:none;">
                          <td height="25" colspan="4" align="center"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#74A8E7">
                              <tr>
                                <td height="80" bgcolor="#FFFFFF" ><table width="100%" height="80" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td width="14%" align="center" bgcolor="#F2F2F2" class="cuhei">留言回複</td>
                                      <td width="86%" bgcolor="#FFFFFF">&nbsp;&nbsp;<%=obj[4]%></td>
                                    </tr>
                                    <tr align="center" bgcolor="#FFFFFF">
                                      <td height="1" colspan="2" bgcolor="#FFFFFF"></td>
                                    </tr>
                                    <tr>
                                      <td align="center" bgcolor="#F2F2F2" class="cuhei">回複訊息</td>
                                      <td bgcolor="#FFFFFF">&nbsp;&nbsp;<%=(!"".equals(reply)&&reply!=null)? reply:"暫無回複"%></td>
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
                          <td height="25" colspan="4" align="center" bgcolor="#F2F2F2"><%
        String curpage=(String)(Object)request.getAttribute("Curpage");
        request.removeAttribute("Curpage"); 
        String maxpagenum=(String)(Object)request.getAttribute("Maxpage");
        request.removeAttribute("Maxpage");
     
        int MaxPagenum=Integer.parseInt(maxpagenum); 
   	    int curpageNum=Integer.parseInt(curpage);      
        %>
                            共<span class="red_font"><%=MaxPagenum%></span>頁 第 <span class="red_font"><%=curpageNum%></span>頁 共有 <span class="red_font"><%=(String)request.getAttribute("Counts")%>則</span>
                            <%
        if(curpageNum==1){
            out.print("【最前頁】【上一頁】");
        }else{
        %>
                            <a href="../server/OnlineQuestion?pgnum=1&amp;type=class&amp;classid=<%=classid%>"   class="link1">【最前頁】</a> <a href="../server/OnlineQuestion?pgnum=<%=curpageNum-1%>&amp;type=class&amp;classid=<%=classid%>"  class="link1">【上一頁】</a>
                            <%
        }
        %>
                            <%
        if(curpageNum>=MaxPagenum){
            out.print("【下一頁】【最後頁】");
        }else{
        %>
                            <a href="../server/OnlineQuestion?pgnum=<%=curpageNum+1%>&amp;type=class&amp;classid=<%=classid%>"   class="link1">【下一頁】</a> <a href="../server/OnlineQuestion?pgnum=<%=MaxPagenum%>&amp;type=class&amp;classid=<%=classid%>"  class="link1">【最後頁】</a>
                          <%
        }
        %></td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
				<jsp:include page="../bottom_in.jsp"/>
			</td>
            <td width="102">&nbsp;</td>
          </tr>
      </table></td>
  </tr>
</table>
<script>
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



</script>
