<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>線上訂購</title>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
<script language="javascript">
function chkfrm(lzh)
{
	if((lzh.name.value == "")||(lzh.email.value == "")||
		(lzh.enterprise.value == "")||(lzh.addr.value == "")||
		(lzh.number.value == "")||(lzh.model.value == "")||(lzh.tel.value == "") ||(lzh.period.value == "")
		||(lzh.QUnit.value == "")||(lzh.PUnit.value == "") ||(lzh.detail.value == ""))
	{
		alert("你還有內容沒有填﹗");
		lzh.name.focus();
		return false;
	} 
	var right_phone = /^[0-9\-]+([0-9])+[0-9]{6,11}$/;
    if(!right_phone.exec(lzh.tel.value)){
		alert("請輸入正確的電話號碼格式，如:02-17888888");
		lzh.tel.focus();
		return false;
	}
	if((lzh.email.value.indexOf("@")<=-1)||(lzh.email.value.indexOf(".")<=-1))
	{
	  alert("請輸入正確的郵件格式，如:123@gmail.com");
	  lzh.email.focus;
	  return false;
	}
	if(isNaN(lzh.number.value))
	{
	  alert("商品數量應該為數字﹗");
	  return false;
	}
	else
	  lzh.submit();
}

</script>
</head>

<body>
   <jsp:include page="../sub/top.jsp"/>
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" bgcolor="#FFFFFF"><table width="980" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="236" align="center" valign="top" background="../images/oo2_r1_c2.jpg" bgcolor="#FFFFFF"><table width="236" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="236" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img src="../images/bb6.jpg" width="236" height="75"></td>
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
                        <td width="28%" height="31"><img src="../images/oo38_r2_c2.jpg" width="132" height="26"></td>
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
                    <TABLE cellSpacing=0 borderColorDark=#ffffff 
            cellPadding=0 width=640 align=center borderColorLight=#ccccff 
            border=0>
			<form name="add" method="post" action="addorder.jsp" onSubmit="return chkfrm(this);">
			<input type="hidden" name="act" value="add"/>
                      <TBODY>
                        <TR>
                          <TD bgColor=#EEEEEE colSpan=4 height=20 align="center">客 戶 信 息</TD>
                        </TR>
                        
                        <TR>
                          <TD width=85>聯絡人</TD>
                          <TD colspan="3">
                            <INPUT size=16  name=name class="input">
                         </TD>
                        </TR>
                        <TR>
                          <TD width=85>電子信箱</TD>
                          <TD colspan="3">
                            <INPUT size=40  name=email class="input"></TD>
                        </TR>
                        <TR>
                          <TD width=85>公司名稱</TD>
                          <TD colspan="3">
                            <INPUT size=64 name=enterprise class="input"></TD>
                        </TR>
                        <TR>
                          <TD width=85>聯繫位址</TD>
                          <TD colspan="3"><INPUT size=64 name=addr class="input">
                         </TD>
                        </TR>
                        <TR>
                          <TD width=85>電 話</TD>
                          <TD colspan="3">
                            <INPUT size=32 name=tel class="input">
                            傳 真
                              <INPUT size=24 name=fax class="input"> </TD>
                        </TR>
                        <TR>
                          <TD width=85>郵遞區號</TD>
                          <TD colspan="3">
                            <INPUT size=15 name=zip class="input">
                         </TD>
                        </TR>
                        <TR>
                          <TD bgColor=#EEEEEE colSpan=4 height=20 align="center">信 
                          息</TD>
                        </TR>
                        <TR>
                          <TD width=85>產品名稱</TD>
                          <TD colspan="3">
                            <INPUT size=42 name=model class="input">
                           </TD>
                        </TR>
                        <TR>
                          <TD width=85>數量</TD>
                          <TD colspan="3">
                            <INPUT size=16 name=number class="input">
                            期限 
                            <SELECT name=period>
                              <OPTION value=6 
                    selected>&lt;請選擇&gt;</OPTION>
                              <OPTION 
                    value=1>1個月</OPTION>
                              <OPTION value=2>2個月</OPTION>
                              <OPTION 
                    value=3>3個月</OPTION>
                              <OPTION value=4>4個月</OPTION>
                              <OPTION 
                    value=5>5個月</OPTION>
                              <OPTION value=6>6個月</OPTION>
                              <OPTION 
                    value=9>9個月</OPTION>
                              <OPTION value=12>12個月</OPTION>
                            </SELECT>                          </TD>
                        </TR>
                        <TR>
                          <TD width=85>流 量Q</TD>
                          <TD colspan="3">
                            <INPUT size=16 name=Q class="input">
                           
                            <select name=QUnit>
                              <option 
                    value=m^3/h>&lt;請選擇單位&gt;</option>
                              <option 
                    value=m^3/s>m^3/s</option>
                              <option 
                    value=m^3/min>m^3/min</option>
                              <option value=m^3/h 
                    selected>m^3/h</option>
                              <option 
                  value=cfm>cfm</option>
                            </select></TD>
                        </TR>
                        <TR>
                          <TD width=85>全 壓P</TD>
                          <TD colspan="3">
                            <INPUT size=16 name=P class="input">
                            <SELECT name=PUnit>
                              <OPTION 
                    value=Pa>&lt;請選擇單位&gt;</OPTION>
                              <OPTION value=Pa 
                    selected>Pa</OPTION>
                              <OPTION value=mmH2O>mmH2O</OPTION>
                              <OPTION value=mmHg>mmHg</OPTION>
                              <OPTION 
                    value=mBar>mBar</OPTION>
                              <OPTION value=hPa>hPa</OPTION>
                              <OPTION value=kPa>kPa</OPTION>
                              <OPTION 
                    value=inH2O>inH2O</OPTION>
                            </SELECT>
                            <SELECT name=PStatic>
                              <OPTION value=0 
                    selected>按全壓選型</OPTION>
                              <OPTION 
                  value=1>按靜壓選型</OPTION>
                            </SELECT>                          </TD>
                        </TR>
                        <TR>
                          <TD width=85>轉速</TD>
                          <TD colspan="3">
                            <INPUT size=16 name=Rpm class="input">
                            <SELECT name=RpmType>
                              <OPTION 
                    value=1>&lt;請選擇單位&gt;</OPTION>
                              <OPTION value="指定轉速">指定轉速</OPTION>
                              <OPTION value="系列轉速" selected>系列轉速</OPTION>
                              <OPTION 
                    value="高效轉速">高效轉速</OPTION>
                            </SELECT>                          </TD>
                        </TR>
                        <TR>
                          <TD width=85>最大直徑</TD>
                          <TD colspan="3">
                            <INPUT size=16 name=JhMax class="input">
                            <SELECT name=JhUnit>
                              <OPTION 
                    value=dm>&lt;請選擇單位&gt;</OPTION>
                              <OPTION value=m>米</OPTION>
                              <OPTION value=dm selected>分米(機號)</OPTION>
                              <OPTION 
                    value=cm>厘米</OPTION>
                              <OPTION value=mm>毫米</OPTION>
                              <OPTION 
                    value=in>in</OPTION>
                            </SELECT>(注: 
                              機號) </TD>
                        </TR>
                        <TR>
                          <TD bgColor=#EEEEEE colSpan=4 height=20 align="center"> 使用環境</TD>
                        </TR>
                        <TR>
                          <TD width=85>壓力Pin</TD>
                          <TD colspan="3">
                            <INPUT size=16 value=101325 name=Pin class="input">
                             
                            <SELECT name=PinUnit>
                              <OPTION 
                    value=Pa>&lt;請選擇單位&gt;</OPTION>
                              <OPTION value=Pa 
                    selected>Pa</OPTION>
                              <OPTION value=mmH2O>mmH2O</OPTION>
                              <OPTION value=mmHg>mmHg</OPTION>
                              <OPTION 
                    value=mBar>mBar</OPTION>
                              <OPTION value=hPa>hPa</OPTION>
                              <OPTION value=kPa>kPa</OPTION>
                              <OPTION 
                    value=inH2O>inH2O</OPTION>
                            </SELECT>
                    (如果是標準狀態)</TD>
                        </TR>
                        <TR>
                          <TD width=85>溫度tin</TD>
                          <TD colspan="3">
                            <INPUT size=16 value=20 name=Tin class="input">
                            <SELECT name=TinUnit>
                              <OPTION 
                    value=℃>&lt;請選擇單位&gt;</OPTION>
                              <OPTION value=K>K</OPTION>
                              <OPTION value=℃ selected>℃</OPTION>
                              <OPTION 
                    value=F>F</OPTION>
                            </SELECT>

                  (如果是標準狀態)</TD>
                        </TR>
                        <TR>
                          <TD>氣壓P（Pa）</TD>
                          <TD width="243">
                            <INPUT size=25 name=JhMax2 class="input">
                          </TD>
                          <TD width="67">成分︰</TD>
                          <TD width="245">
                            <INPUT size=16 name=JhMax3 class="input">
                          </TD>
                        </TR>
                        <TR>
                          <TD width=85>密度ρ</TD>
                          <TD colspan="3">
                            <INPUT size=16 value=1.2 name=Dens class="input">
                            
                              <SELECT name=DensUse>
                                <OPTION value="不使用指定密度" 
                    selected>不使用指定密度</OPTION>
                                <OPTION 
                  value="使用指定密度">使用指定密度</OPTION>
                              </SELECT>(如果是標準狀態)</TD>
                        </TR>
                        <TR>
                          <TD width=85>詳細要求</TD>
                          <TD colspan="3">
                            <TEXTAREA name=detail rows=8 cols=75 type="textfield"></TEXTAREA>
                          </TD>
                        </TR>
                        <TR>
                          <TD height="25" colspan="4" align="center">&nbsp;
                          <input type="submit" name="Submit" value="送出">&nbsp;&nbsp;<input type="reset" name="Reset" value="清除"></TD>
                        </TR>
                      </TBODY>
					  </form>
                    </TABLE></td>
                </tr>
            </table></td>
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
                </span><span class="baise">高雄榮總國際醫療中心</span><span class="hanggao22"><br>
            </span></div></td>
          </tr>
      </table></td>
  </tr>
</table>
</body>
</html>