<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>徵人訊息</title>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
</head>

<body>
   <jsp:include page="../sub/top.jsp"/>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> <form name=job action="CommList" method="post">
            <td valign="top" bgcolor="#FFFFFF"><table width="980" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="236" align="center" valign="top" background="../images/oo2_r1_c2.jpg" bgcolor="#FFFFFF"><table width="236" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="236" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img src="../images/bb7.jpg" width="236" height="75"></td>
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
                                        <td height="7" background="../images/qiyezongshu_r10_c5.jpg"><jsp:include page="left.jsp" flush="true"/></td>
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
                        <td width="28%" height="31"><img src="../images/oo42_r2_c2.jpg" width="132" height="26"></td>
                        <td width="72%" align="right" valign="bottom">&nbsp;</td>
                      </tr>
                    </table>
                      <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="13" background="../images/p_r12_c18.jpg"></td>
                        </tr>
                      </table>
                    <table width="87%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                    </table>
<%
	Vector v=(Vector)(Object)request.getAttribute("Info");
          request.removeAttribute("Info");
          
          if (v!=null){
                Enumeration e=v.elements();
				while(e.hasMoreElements()){
					Object[] obj=(Object[])e.nextElement();	   			
%>
                    <table width="80%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="20"><img src="../images/announce.gif" width="13" height="13">&nbsp;&nbsp;<span class="cuhei">徵人職位︰<%=obj[1]%>&nbsp;(<%=obj[4]
                        %>個)</span></td>
                      </tr>
                    </table>
                    <table width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="#1E6AA4">
                      <tr>
                        <td width="13%" height="25" align="center" bgcolor="#F0F0F0">學&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;歷︰</td>
                        <td width="35%" bgcolor="#FFFFFF"><%=obj[5]%></td>
                        <td width="13%" align="center" bgcolor="#F0F0F0">專&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;業︰</td>
                        <td width="39%" bgcolor="#FFFFFF"><%=obj[6]%></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;別︰</td>
                        <td bgcolor="#FFFFFF"><%="0".equals((String)obj[7])?"男":"女"%> </td>
                        <td align="center" bgcolor="#F0F0F0">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;齡︰ </td>
                        <td bgcolor="#FFFFFF"><%=obj[8]%>歲以上</td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">工作經驗︰</td>
                        <td bgcolor="#FFFFFF">&nbsp;<%=obj[9]%></td>
                        <td align="center" bgcolor="#F0F0F0">期限︰</td>
                        <td bgcolor="#FFFFFF"><%=obj[10]%></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">工作地點︰</td>
                        <td bgcolor="#FFFFFF"><%=obj[11]%></td>
                        <td align="center" bgcolor="#F0F0F0">工作待遇︰ </td>
                        <td bgcolor="#FFFFFF"><%=obj[12]%></td>
                      </tr>
                      <tr>
                        <td height="70" align="center" bgcolor="#F0F0F0">需求專業︰</td>
                        <td colspan="3" bgcolor="#FFFFFF" class="hanggao21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=obj[12]%></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">聯絡方式︰</td>
                        <td colspan="3" bgcolor="#FFFFFF"><%=obj[13]%></td>
                      </tr>
       
	   
	    <%
	}//end of while

            v.clear();
		}	
%>
 
	   </table>
	         <table width="87%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="30" align="center">&nbsp;<%
        String curpage=(String)(Object)request.getAttribute("Curpage");
        request.removeAttribute("Curpage"); 
        String maxpagenum=(String)(Object)request.getAttribute("Maxpage");
        request.removeAttribute("Maxpage");
     
        int MaxPagenum=Integer.parseInt(maxpagenum); 
   	    int curpageNum=Integer.parseInt(curpage);      
        %>
         共<span class="red_font"><%=MaxPagenum%></span>頁 第
        <span class="red_font"><%=curpageNum%></span>頁 共
        <span class="red_font"><%=(String)request.getAttribute("Counts")%>條</span>
        
        <%
        if(curpageNum==1){
            out.print("【最前頁】【上一頁】");
        }else{
        %>
            <a href="#" onClick="change(1)"  class="blue">【最前頁】</a>
            <a href="#" onClick="change(<%=curpageNum-1%>)"  class="blue">【上一頁】</a>
        <%
        }
        %>
        <%
        if(curpageNum>=MaxPagenum){
            out.print("【下一頁】【最後頁】");
        }else{
        %>
        <a href="#" onClick="change(<%=curpageNum+1%>)"  class="blue">【下一頁】</a>
        <a href="#" onClick="change(<%=MaxPagenum%>)"  class="blue">【最後頁】</a>
        <%
        }
        %>
        第&nbsp;<input type="text" name="page"　id="page" size=2 maxLength=3>
       &nbsp;頁 <a href="#" onClick="check1()"  class="blue">【轉到】</a> <input type="hidden" name="pgnum" value="1">   </td>
                        </tr>
                    </table>
	   </td>
                </tr>
            </table></td></form>
          </tr>
        </table>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="60"><div align="center"><span class="baise">網站地圖</span><span class="hanggao22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                </span><span class="baise">高雄榮總國際醫療中心</span><span class="hanggao22"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="baise">版權所有</span><span class="hanggao22"><br>
                </span><span class="baise">地址：81362高雄市左營區大中一路386號 電話：07-3422121 傳真：07-3422288</span><span class="hanggao22"><br>
            </span></div></td>
          </tr>
      </table>
     </td>
    </tr>
</table>
 <script>
function change(num){
	document.job.pgnum.value=num;
	document.job.submit();
}
function check1(){	
var pg=document.job.page.value;
if (isNaN(pg)){
	alert("請正確填寫轉到頁數﹗");
}
else if (pg=="") {
	alert("請輸入轉到頁數﹗");
}
else　if(pg><%=MaxPagenum%>){
	alert("請輸入小於最大頁數的數字");
}
else{
	change(pg);
}
}
function checkthis(field){
	var k = 0;
	for(i=0;i<field.length;i++){
		if(field[i].checked){
			k++;
		}
	}
	document.job.action="JobList?act=del";
	var flag=false;
	if(field.checked){
		flag=true;
	}
	if(flag){
		return confirm('確定要刪除選擇項嗎?');
	}
	else if(k<=0){ 
		alert("請選擇內容");
		return false;
	}
	else return confirm('確定要刪除選擇項嗎?');
}		
</script>
</body>
</html>