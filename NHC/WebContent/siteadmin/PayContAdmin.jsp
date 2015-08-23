<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>

<%
Operation op = new Operation();
ResultSet rs = null;
ResultSet rs1 = null;
int updPAY_ID = 0;
String updPAY_TYPE_name = "";
int updPAY_XCODE = 0;
int updPAY_LOGS=0;
String updPAY_001 = "";
String updPAY_002 = "";
String updPAY_003 = "";
String updPAY_004 = "";
String updPAY_005 = "";
String updPAY_006 = "";
String updPAY_007 = "";
String ProessName="新 增" ;


if(request.getParameter("UpdateID")!=null){
	updPAY_ID = Integer.parseInt(request.getParameter("UpdateID"));
	rs = op.query("SELECT * FROM PAYCONT WHERE PAY_ID ="+updPAY_ID);
	rs.next();
	updPAY_TYPE_name = rs.getString("PAY_TYPE_CHT");
	updPAY_XCODE = rs.getInt("PAY_XCODE");
	updPAY_LOGS = rs.getInt("PAY_LOGS");
	updPAY_001 = rs.getString("PAY_001");
        updPAY_002 = rs.getString("PAY_002");
        updPAY_003 = rs.getString("PAY_003");
        updPAY_004 = rs.getString("PAY_004");
        updPAY_005 = rs.getString("PAY_005");
        updPAY_006 = rs.getString("PAY_006");
        updPAY_007 = rs.getString("PAY_007");
        op.closestmt();
        ProessName="修 改" ;
}
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
function checker(){
//        if(PayCont.updPAY_ID.value == 0){
//		alert("請先選擇修改項目!");
//		return false;
//	}
	if(PayCont.PAY_TYPE_name.value == ""){
		alert("項目名稱不能為空,請輸入項目名稱!");
		PayCont.PAY_TYPE_name.focus();
		return false;
	}
	if(PayCont.PAY_XCODE.value == ""){
		alert("住院天數不能為空,請輸入住院天數!");
		PayCont.PAY_XCODE.focus();
		return false;
	}
	if(PayCont.PAY_LOGS.value == ""){
		alert("住院天數不能為空,請輸入住院天數!");
		PayCont.PAY_LOGS.focus();
		return false;
	}
	if(PayCont.PAY_001.value == ""){
		alert("共同診療項目費用不能為空,請輸入共同診療項目費用!");
		PayCont.PAY_001.focus();
		return false;
	}
	if(PayCont.PAY_002.value == ""){
		alert("共同診療項目費用不能為空,請輸入共同診療項目費用!");
		PayCont.PAY_002.focus();
		return false;
	}      
	if(PayCont.PAY_003.value == ""){
		alert("共同診療項目費用加乘不能為空,請輸入共同診療項目費用加乘!");
		PayCont.PAY_003.focus();
		return false;
	}              
	if(PayCont.PAY_004.value == ""){
		alert("疼痛控制(術後止痛)不能為空,請輸入疼痛控制(術後止痛)!");
		PayCont.PAY_004.focus();
		return false;
	}        
 	if(PayCont.PAY_005.value == ""){
		alert("疼痛控制(術後止痛)不能為空,請輸入疼痛控制(術後止痛)!");
		PayCont.PAY_005.focus();
		return false;
	}
	if(PayCont.PAY_006.value == ""){
		alert("特殊材料費_骨材不能為空,請輸入特殊材料費_骨材!");
		PayCont.PAY_006.focus();
		return false;
	}        
 	if(PayCont.PAY_007.value == ""){
		alert("特殊材料費_骨材不能為空,請輸入特殊材料費_骨材!");
		PayCont.PAY_007.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_XCODE.value)){
		alert("住院天數需為數字,請輸入數字!");
		PayCont.PAY_XCODE.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_LOGS.value)){
		alert("住院天數需為數字,請輸入數字!");
		PayCont.PAY_LOGS.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_001.value)){
		alert("共同診療項目費用需為數字,請輸入數字!");
		PayCont.PAY_001.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_002.value)){
		alert("共同診療項目費用需為數字,請輸入數字!");
		PayCont.PAY_002.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_003.value)){
		alert("共同診療項目費用加乘需為數字,請輸入數字!");
		PayCont.PAY_003.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_004.value)){
		alert("疼痛控制(術後止痛)需為數字,請輸入數字!");
		PayCont.PAY_004.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_005.value)){
		alert("疼痛控制(術後止痛)需為數字,請輸入數字!");
		PayCont.PAY_005.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_006.value)){
		alert("特殊材料費_骨材需為數字,請輸入數字!");
		PayCont.PAY_006.focus();
		return false;
	}        
        if(isNaN(PayCont.PAY_007.value)){
		alert("特殊材料費_骨材需為數字,請輸入數字!");
		PayCont.PAY_007.focus();
		return false;
	}        
        
        return true;
}
 function del_check(id,p,payType)
{
	var ok;
	ok=confirm("您是確定要刪除【"+p+"】嗎？");
	if(ok)
	{
		self.location.href="delPayCont.jsp?updPAY_ID="+id + "&PAY_CONT_TYPE=" + payType ;
	}
}
 function resetClick()
{
    self.location.href="PayContAdmin.jsp" ;
}
function selected(){
	PayCont.PAY_TYPE_name.focus();
}
-->
</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body onLoad="selected();">
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="7" align="center" height="30" background="images/tablebg.gif"><b>收費標準-骨科醫療</b></td>
  </tr>
  <form name="PayCont" method="post" action="PayContUpdate.jsp" onSubmit="return checker();">
  <tr> 
    <td width="19%" height="25" align="center"><div align="right">項目名稱</div></td>
    <td width="81%" align="center"><div align="left">
     <input name="PAY_TYPE_name" type="text" id="PAY_TYPE_name" size="30" maxlength="50" value="<%=updPAY_TYPE_name%>">
     <span class="style1">*</span></div></td>
  </tr>
  <tr>
    <td height="24" align="center">      <p align="right">住院天數</p></td>
    <td height="24" align="center"><div align="left">
      <input name="PAY_XCODE" type="text" id="PAY_XCODE" size="30" maxlength="3" value="<%=updPAY_XCODE%>"> ~
      <input name="PAY_LOGS" type="text" id="PAY_LOGS" size="30" maxlength="3" value="<%=updPAY_LOGS%>">
      <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">共同診療項目費用</div></td>
    <td height="25" align="center"><div align="left">
      <input name="PAY_001" type="text" id="PAY_001" size="40" maxlength="10" value="<%=updPAY_001%>"> ~
       <input name="PAY_002" type="text" id="PAY_002" size="40" maxlength="10" value="<%=updPAY_002%>">
      <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">共同診療項目費用加乘</div></td>
    <td height="25" align="center"><div align="left">
      <input name="PAY_003" type="text" id="PAY_003" size="40" maxlength="3" value="<%=updPAY_003%>">
    <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">疼痛控制(術後止痛)</div></td>
    <td height="25" align="center"><div align="left">
      <input name="PAY_004" type="text" id="PAY_004" size="40" maxlength="10" value="<%=updPAY_004%>"> ~
       <input name="PAY_005" type="text" id="PAY_005" size="40" maxlength="10" value="<%=updPAY_005%>">
    <span class="style1">*</span></div></td>
  </tr>
   <tr> 
    <td height="25" align="center"><div align="right">特殊材料費_骨材</div></td>
    <td height="25" align="center"><div align="left">
      <input name="PAY_006" type="text" id="PAY_006" size="40" maxlength="10" value="<%=updPAY_006%>"> ~
       <input name="PAY_007" type="text" id="PAY_007" size="40" maxlength="10" value="<%=updPAY_007%>">
    <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" colspan="2" align="center"><div align="center">
      <input name="PAY_008" type="hidden" id="PAY_008" value="0" >
      <input name="PAY_CONT_TYPE" type="hidden" id="PAY_CONT_TYPE" value="A" >
      <input name="updPAY_ID" type="hidden" id="updPAY_ID" value="<%=updPAY_ID%>" >
      <input type="submit" name="Submit" value="<%=ProessName%>"> 
       <input name="Reset" type="button" id="Reset" value="重 置" onClick="javascript:resetClick()" >
    </div></td>
  </tr>
  </form>
</table>
<table width="95%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr>
    <td width="16%" align="center" background="images/tablebg.gif"><strong>項目名稱</strong></td>
    <td width="6%" align="center" background="images/tablebg.gif"><strong>住院天數(起)</strong></td>
    <td width="6%" align="center" background="images/tablebg.gif"><strong>住院天數(迄)</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>共同診療項目費用(起)</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>共同診療項目費用(迄)</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>共同診療項目費用加乘</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>疼痛控制(術後止痛)(起)</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>疼痛控制(術後止痛)(迄)</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>特殊材料費_骨材(起)</strong></td>
    <td width="4%" align="center" background="images/tablebg.gif"><strong>特殊材料費_骨材(迄)</strong></td>
    <td width="6%" align="center" background="images/tablebg.gif"><strong>更新帳號</strong></td>
    <td width="6%" align="center" background="images/tablebg.gif"><strong>更新時間</strong></td>
    <td width="17%" height="25" align="center" background="images/tablebg.gif"><strong>管 理</strong></td>
  </tr>
    <%
  	//當前頁
	int currPage = 1;
	//每頁的記錄數
	int pageSize = 10;
	//總記錄數
	int totalRecord = 0;
	//總頁數 
	int pageCount = 0; 
	//獲得記錄總數
	rs = op.query("SELECT COUNT(*) AS total FROM PAYCONT where PAY_CONT_TYPE='A' ");
	while(rs.next()){
		totalRecord = rs.getInt("total");
	}
	//獲得總頁數
	pageCount = ((totalRecord % pageSize) == 0)?(totalRecord/pageSize) : (totalRecord/pageSize) + 1;

	//獲得當前頁數
	String p = request.getParameter("page");
	if(p != null && p != ""){
		currPage = Integer.parseInt(p);
	}
	//獲得導航條
	String navigator = Pagable.navigator(currPage, pageSize, pageCount, totalRecord);
        int currRecordBegin = (currPage -1) * pageSize ;
        int currRecordEnd = currPage  * pageSize ;
	//獲得當前頁的記錄集
	//rs = op.query("SELECT top " + pageSize + " * FROM cms_link where cms_link_id NOT IN (SELECT TOP " + ((currPage - 1) * pageSize)+ " cms_link_id from cms_link ORDER BY cms_link_id DESC) ORDER BY cms_link_id DESC");
 	//####rs = op.query("SELECT * FROM cms_link ORDER BY cms_link_id DESC limit "+((currPage - 1) * pageSize)+"," + pageSize);
	
  %>
  <form name="form1" method="post" action="delselectedPayCont.jsp?ps=<%=pageSize%>">
  <%
  rs1 = op.query("SELECT row_number() over(order by pay_id) as rn,PAYCONT.* FROM PAYCONT  where PAY_CONT_TYPE='A'  order by PAY_id ");
  int j = 0;
  while(rs1.next()){
      int rn =rs1.getInt("rn");
      if (rn> currRecordBegin && rn <= currRecordEnd) {
          int PAY_id = rs1.getInt("PAY_id");
	  String PAY_CONT = rs1.getString("PAY_CONT");
	  String PAY_CONT_type = rs1.getString("PAY_CONT_type");
	  String PAY_TYPE_CHT = rs1.getString("PAY_TYPE_CHT");
	  int PAY_XCODE = rs1.getInt("PAY_XCODE");
	  int PAY_LOGS = rs1.getInt("PAY_LOGS");
	  String PAY_001 = rs1.getString("PAY_001");
	  String PAY_002 = rs1.getString("PAY_002");
	  String PAY_003 = rs1.getString("PAY_003");
	  String PAY_004 = rs1.getString("PAY_004");
	  String PAY_005 = rs1.getString("PAY_005");
	  String PAY_006 = rs1.getString("PAY_006");
	  String PAY_007 = rs1.getString("PAY_007");
	  String PAY_008 = rs1.getString("PAY_008");
	  String PAY_009 = rs1.getString("PAY_009");
	  String PAY_DATETIME = rs1.getString("PAY_DATETIME");
          j++;
  %>
  <tr>
    <td height="25" align="center"><div align="left"><%=PAY_TYPE_CHT%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_XCODE%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_LOGS%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_001%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_002%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_003%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_004%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_005%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_006%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_007%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_009%></div></td>
    <td height="25" align="center"><div align="left"><%=PAY_DATETIME%></div></td>
    <td align="center" height="25"><a href="PayContAdmin.jsp?UpdateID=<%=PAY_id%>">修 改</a>  | <a onClick="javascript:del_check(<%=PAY_id%>,'<%=PAY_TYPE_CHT%>','A')" class="A">刪 除</a> </td>
  </tr>
  <%
    }
  }
  %>
  
</form>  
  <tr>
    <td height="25" colspan="8" align="center"><div align="right"><%=navigator%></div></td>
  </tr>

</table>
</body>
</html>
<%
op.closestmt();
op.closeconn();
%>