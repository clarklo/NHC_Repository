<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自我推薦</title>
<style type="text/css">
<!--
@import url("../css.css");
.STYLE1 {color: #999999}
-->
</style>
<script language="javascript">
function chkfrm(lzh)
{
	if((lzh.u_name.value == "")||(lzh.u_age.value == "")||
		(lzh.u_marriage.value == "")||(lzh.u_sch_age.value == "")||
		(lzh.u_speciality.value == "")||(lzh.u_school.value == "")||(lzh.u_exper.value == "") ||(lzh.u_story.value == "")
		||(lzh.u_relation.value == "")||(lzh.u_tel.value == "") ||(lzh.u_mobile.value == "")||(lzh.u_oicq.value == "")
		||(lzh.u_addr.value == ""))
	{
		alert("你還有內容沒有填﹗");
		lzh.u_name.focus();
		return false;
	} 
	var right_phone = /^[0-9\-]+([0-9])+[0-9]{6,10}$/;
    if(!right_phone.exec(lzh.u_tel.value)){
		alert("請輸入正確的電話號碼格式，如:02-28562888");
		lzh.u_tel.focus();
		return false;
	}
	if(lzh.u_age.value.indexOf("-")<=-1)
	{
	  alert("請輸入正確的生日格式，如:1982-08-22");
	  lzh.u_age.focus;
	  return false;
	}
	if(isNaN(lzh.u_exper.value)||isNaN(lzh.u_mobile.value)||isNaN(lzh.u_oicq.value))
	{
	  alert("工作經驗、手機號碼都應該為數字﹗");
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
                        <td width="28%" height="31"><img src="../images/oo43_r2_c2.jpg" width="132" height="26"></td>
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
                    <table width="80%" border="0" cellpadding="0" cellspacing="1">
					<form name="add" method="post" action="addlance.jsp" onSubmit="return chkfrm(this);" >
					<input type="hidden" name="act" value="add"/>
                      <tr>
                        <td height="25" colspan="4" align="center" bgcolor="#FFFFFF"><STRONG>=== 個人基本資料 === </STRONG></td>
                      </tr>
                      <tr>
                        <td width="22%" height="25" align="center" bgcolor="#FAFAFA">真實姓名︰</td>
                        <td colspan="3" bgcolor="#FAFAFA"><input type="text" name="u_name" id="u_name" class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">性 　&nbsp;&nbsp; 別︰</td>
                        <td colspan="3" bgcolor="#F0F0F0"><select name="u_sex" id="u_sex">
                          <option value="0">男</option>
                          <option value="1">女</option>
                        </select>
                        </td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA">出生年月︰</td>
                        <td colspan="3" bgcolor="#FAFAFA"><input type="text" name="u_age" id="u_age" class="input">&nbsp;&nbsp;(如︰1982-08-22格式)</td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">身分證號︰</td>
                        <td colspan="3" bgcolor="#F0F0F0"><input type="text" name="u_ic"  id="u_ic"class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA">國　　家︰</td>
                        <td colspan="3" bgcolor="#FAFAFA"><input type="text" name="u_pepole" id="u_pepole" class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">婚姻狀況︰</td>
                        <td colspan="3" bgcolor="#F0F0F0"><select name="u_marriage" id="u_marriage">
                          <option value="已婚">已婚</option>
                          <option value="未婚">未婚</option>
                                                </select></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA">您最高的教育程度︰</td>
                        <td colspan="3" bgcolor="#FAFAFA"><select name="u_sch_age">
                          <option value="博士">博士</option>
						  <option value="碩士">碩士</option>
                          <option value="本科">本科</option>
                          <option value="大專">大專</option>
						  <option value="中專">中專</option>
						  <option value="高中">高中</option>
                                                </select></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">專 　&nbsp;&nbsp; 業︰</td>
                        <td colspan="3" bgcolor="#F0F0F0" class="hanggao21"><input type="text" name="u_speciality" id="u_speciality"  class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA">畢業院校︰</td>
                        <td colspan="3" bgcolor="#FAFAFA"><input type="text" name="u_school" id="u_school" class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" colspan="4" align="center" bgcolor="#FFFFFF"><p><STRONG>=== 相關工作經歷 === </STRONG></p></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">工作經驗︰</td>
                        <td colspan="3" bgcolor="#F0F0F0">至今相關工作經驗共有
                          <INPUT id="u_exper"  name="u_exper" size="2" >
年</td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA">詳細工作經歷︰</td>
                        <td height="150" colspan="3" bgcolor="#FAFAFA">按照格式{始(年.月) 至(年.月) 職務名稱 公司名稱}填寫<br>
                        <textarea name="u_story"  id="u_story"cols="50" rows="8"></textarea></td>
                      </tr>
                      <tr>
                        <td height="25" colspan="4" align="center" bgcolor="#FFFFFF"><p><STRONG>=== 聯絡訊息 === </STRONG></p></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">聯  絡 人︰</td>
                        <td width="34%" bgcolor="#F0F0F0"><input type="text" name="u_relation" id="u_relation" class="input"></td>
                        <td width="14%" bgcolor="#F0F0F0">聯絡電話︰</td>
                        <td width="30%" bgcolor="#F0F0F0"><input type="text" name="u_tel" id="u_tel" class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA">手機號碼︰</td>
                        <td bgcolor="#FAFAFA"><input type="text" name="u_mobile" id="u_mobile" class="input"></td>
                        <td bgcolor="#FAFAFA">個人主頁︰</td>
                        <td bgcolor="#FAFAFA"><input type="text" name="u_index" id="u_index" class="input"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center" bgcolor="#F0F0F0">社群︰</td>
                        <td bgcolor="#F0F0F0"><input type="text" name="u_oicq" id="u_oicq" class="input"></td>
                        <td bgcolor="#F0F0F0">聯絡位址︰</td>
                        <td bgcolor="#F0F0F0"><input type="text" name="u_addr" id="u_addr" class="input"></td>
                      </tr>
					   <tr>
                        <td height="25" align="center" bgcolor="#FAFAFA" colspan="4"><input type="submit" name="Submit" value="確認">&nbsp;&nbsp;&nbsp;<input type="reset" name="Reset" value="清除"></td> 
                      </tr>
					  </form>
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
      <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="60"><div align="center"><span class="baise">網站地圖</span><span class="hanggao22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                </span><span class="baise">高雄榮總國際醫療中心</span><span class="hanggao22"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="baise">版權所有</span><span class="hanggao22"><br>
                </span><span class="baise">地址：81362高雄市左營區大中一路386號 電話：07-3422121 傳真：07-3422288</span><span class="hanggao22"><br>
            </span></div></td>
          </tr>
      </table></td>
  </tr>
</table>
</body>
</html>