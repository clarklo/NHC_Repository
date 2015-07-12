<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*" errorPage="error/error.jsp" %>

<%
Operation op = new Operation();
ResultSet rs = null;
ResultSet rs1 = null;

String update_ROOM_NAME ="";
String update_ROOM_DESC ="";
int update_ROOM_PAY =0;
int update_ROOM_ID =0;
if(request.getParameter("UpdateID")!=null){
	update_ROOM_ID = Integer.parseInt(request.getParameter("UpdateID"));
	rs1 = op.query("SELECT * FROM PAYROOM WHERE room_id ="+update_ROOM_ID);
	rs1.next();
	  update_ROOM_NAME = rs1.getString("ROOM_NAME");
	  update_ROOM_DESC = rs1.getString("ROOM_DESC");
          update_ROOM_PAY = rs1.getInt("ROOM_PAY");
          update_ROOM_ID = rs1.getInt("ROOM_ID");
	op.closestmt();
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
    	if(Link.txtRoomID.value == ""){
		alert("病房流水號不能為0,請按修改資料!");
		Link.txtRoomID.focus();
		return false;
	}
	if(Link.txtRoomName.value == ""){
		alert("病房名稱不能為空,請輸入病房名稱!");
		Link.txtRoomName.focus();
		return false;
	}
	if(Link.txtRoomDesc.value == ""){
		alert("病房描述不能為空,請輸入病房描述!");
		Link.txtRoomDesc.focus();
		return false;
	}
        if(Link.txtRoomPay.value == ""){
		alert("病房價格不能為空,請輸入病房價格!");
		Link.txtRoomPay.focus();
		return false;
	}
        
        if(isNaN(Link.txtRoomPay.value)){
		alert("病房價格需為數字,請輸入數字!");
		Link.txtRoomPay.focus();
		return false;
	}
 
	return true;
}

function checker2(){
    	if(Link.txtRoomID.value == ""){
		alert("病房流水號不能為0,請按修改資料!");
		Link.txtRoomID.focus();
		return false;
	}
	 
	return true;
}

function selected(){
	Link.name.focus();
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
    <form name="Link" method="post" action="PatientRoomUpdate.jsp" onSubmit="return checker();" >
  <tr> 
    <td colspan="7" align="center" height="30" background="images/tablebg.gif"><b>病房資料</b></td>
  </tr>
 <tr>
    <td height="24" align="center">      <p align="right">病房流水號</p></td>
    <td height="24" align="center"><div align="left">
            <input name="txtRoomID" type="text" id="txtRoomID" size="30" maxlength="255" value="<%=update_ROOM_ID%>" readonly="true"  disabled="true" >
            <input name="roomID" type="hidden" id="roomID" value="<%=update_ROOM_ID%>" >
      <span class="style1">*</span></div></td>
  </tr>
    <tr>
    <td height="24" align="center">      <p align="right">病房名稱</p></td>
    <td height="24" align="center"><div align="left">
      <input name="txtRoomName" type="text" id="txtRoomName" size="30" maxlength="255" value="<%=update_ROOM_NAME%>">
      <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right">病房描述</div></td>
    <td height="25" align="center"><div align="left">
      <input name="txtRoomDesc" type="text" id="txtRoomDesc" size="40" maxlength="255" value="<%=update_ROOM_DESC%>">
      <span class="style1">*</span></div></td>
  </tr>
    <tr> 
    <td height="25" align="center"><div align="right">病房價格</div></td>
    <td height="25" align="center"><div align="left">
      <input name="txtRoomPay" type="text" id="txtRoomPay" size="40" maxlength="255" value="<%=update_ROOM_PAY%>">
      <span class="style1">*</span></div></td>
  </tr>
  <tr> 
    <td height="25" colspan="2" align="center"><div align="center">
      <input type="submit" name="Submit" value="修 改"> 
    </div></td>
  </tr>
  </form>
      
   <form name="roomImage" method="post" action="PatientRoomUpload.jsp" encType=multipart/form-data onSubmit="return checker2();"   >
  <tr> 
    <td height="25" align="center"><div align="right">病房圖片</div></td>
    <td height="25" align="center"><div align="left">
    <input name="roomImgID" type="hidden" id="roomID" value="<%=update_ROOM_ID%>" >
     <INPUT  size=60 type=file  name="file"> <input type="submit" name="Submit" value="修改圖片" > (只限使用jpg檔)
    </div></td>
  </tr>
    </form>
  
</table>
<table width="95%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>病房名稱</strong></td>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>病房描述</strong></td>
    <td width="10%" align="center" background="images/tablebg.gif"><strong>病房價格</strong></td>
    <td width="55%" align="center" background="images/tablebg.gif"><strong>病房圖片</strong></td>
    <td width="10%" height="25" align="center" background="images/tablebg.gif"><strong>管 理</strong></td>
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
	rs = op.query("SELECT COUNT(*) AS total FROM PAYROOM");
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

  <%
  rs1 = op.query("SELECT row_number() over(order by room_id) as rn,PAYROOM.* FROM PAYROOM    order by room_id ");
  int j = 0;
  while(rs1.next()){
      int rn =rs1.getInt("rn");
      if (rn> currRecordBegin && rn <= currRecordEnd) {
           String ROOM_NAME = rs1.getString("ROOM_NAME");
	  String ROOM_DESC = rs1.getString("ROOM_DESC");
          int ROOM_PAY = rs1.getInt("ROOM_PAY");
          int ROOM_ID = rs1.getInt("ROOM_ID");
          j++;
  %>
  <tr>
    <td height="25" align="center"><div align="left"><%=ROOM_NAME%></div></td>
    <td height="25" align="center"><div align="left"><%=ROOM_DESC%></div></td>
    <td height="25" align="center"><div align="left"><%=ROOM_PAY%></div></td>
    <td height="25" align="center"><div align="left"><img src="../images/RoomImages/<%=ROOM_ID%>.jpg" width="149" height="109" alt="<%=ROOM_DESC%>" /></a></div></td>

    <td align="center" height="25"><a href="PatientRoomAdmin.jsp?UpdateID=<%=ROOM_ID%>">修 改</a> </td>
  </tr>
  <%
    }
  }
  %>
  <tr>
    <td height="25" colspan="8" align="center"></td>
  </tr>
 
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