<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../permission.jsp"%>
<%@include file="../permission/permission5.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
BODY{
BACKGROUND-COLOR: #E1F4EE;
font-size:9pt
}
.tx1 { height: 20px;font-size: 9pt; border: 1px solid; border-color: #000000; color: #0000FF}
-->
</style>

<SCRIPT language=javascript>
<!--
function check() 
{
	var strFileName=form1.FileName.value;
	var FileType;
	var ImgWH;
	if (strFileName=="")
	{
    	alert("請選擇要上傳的圖片檔案,格式為jpg、gif、bmp、png類型的!");
    	return false;
  	}
  	else
  	{
		FileType=strFileName.substr(strFileName.length-3)
		FileType=FileType.toLowerCase();
		if(FileType=="jpg" || FileType=="bmp" || FileType=="gif" || FileType=="png" )
		{
			ImgWH=prompt("請輸入圖片的寬度和高度，中間用英文的逗號隔開︰\n如果不輸入或者點"取消"按鈕，將使用圖片的實際大小。","320,240""); 
			if (ImgWH!=null)
			{
				document.form1.ImgWidth.value=ImgWH.substr(0,ImgWH.indexOf(","));
				document.form1.ImgHeight.value=ImgWH.substr(ImgWH.indexOf(",")+1);
			}
			else
			{
				document.form1.ImgWidth.value=0
				document.form1.ImgHeight.value=0
			}
		}
		else if(FileType=="swf")
		{
			ImgWH=prompt("請輸入FLASH檔案的寬度和高度，中間用英文的逗號隔開︰","320,240"); 
			if (ImgWH==null)
			{
				document.form1.ImgWidth.value=0
				document.form1.ImgHeight.value=0
				return false;
			}
			else
			{
				document.form1.ImgWidth.value=ImgWH.substr(0,ImgWH.indexOf(","));
				document.form1.ImgHeight.value=ImgWH.substr(ImgWH.indexOf(",")+1);
			}
		}
		else{
			alert("不能上傳這種類型的檔案!");
			return false;
		}
  	}
}
-->
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0">
<form action="processupload.jsp" method="post" name="form1" onSubmit="return check()" enctype="multipart/form-data">
  <input name="FileName" type="FILE" class="tx1" size="16"> 
  <input type="submit" name="Submit" value="上傳" style="border:1px double rgb(88,88,88);font:9pt">
  <input name="ImgWidth" type="hidden" id="ImgWidth" value="320">
  <input name="ImgHeight" type="hidden" id="ImgHeight" value="240">
</form>
</body>
</html>
