<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.jspsmart.upload.*,java.util.*,java.io.*"%>
<%@include file="../permission.jsp"%>
<%@include file="../permission/permission5.jsp"%>      
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%
int width = 320;
int height = 240;
if(request.getParameter("ImgWidth")!=null){
	width = Integer.parseInt(request.getParameter("ImgWidth"));
}
if(request.getParameter("ImgHeight")!=null){
	height = Integer.parseInt(request.getParameter("ImgHeight"));
}

// Variables
int count=0;        

// Initialization
mySmartUpload.initialize(pageContext);

// Only allow txt or htm files
mySmartUpload.setAllowedFilesList("gif,GIF,bmp,BMP,jpg,JPG,jpeg,JPEG,png,PNG,swf,SWF");

// DeniedFilesList can also be used :
mySmartUpload.setDeniedFilesList("exe,EXE,bat,BAT,jsp,JSP");

// Deny physical path
mySmartUpload.setDenyPhysicalPath(true);

// Only allow files smaller than 1M bytes
mySmartUpload.setMaxFileSize(100*100*1024);

// Deny upload if the total fila size is greater than 200000 bytes
//mySmartUpload.setTotalMaxFileSize(1024*1024);

// Upload	
mySmartUpload.upload();

com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);

String x = Long.toString(new java.util.Date().getTime());
Calendar calendar = Calendar.getInstance();
String p = calendar.get(Calendar.YEAR) + java.io.File.separator +
			(calendar.get(Calendar.MONTH)+1) + java.io.File.separator +
			calendar.get(Calendar.DAY_OF_MONTH) + java.io.File.separator ;
			
String rPath = request.getRealPath("/") + "upload" + java.io.File.separator + "images" + java.io.File.separator + p;
String vPath = java.io.File.separator + "upload" + java.io.File.separator + "images" + java.io.File.separator + p;
java.io.File dir = new java.io.File(rPath);
if(!dir.exists()){
	dir.mkdirs();
}
myFile.saveAs(vPath + x + "." + myFile.getFileExt(), mySmartUpload.SAVE_VIRTUAL);

out.println("<script language='javascript'>");
out.println("parent.HtmlEdit.focus();");
out.println("var range = parent.HtmlEdit.document.selection.createRange();");
String fileExt = (myFile.getFileExt()).toLowerCase();
if(fileExt.equals("gif") || fileExt.equals("jpg") || fileExt.equals("bmp") || fileExt.equals("jpeg") || fileExt.equals("png")){
	out.println("range.pasteHTML(\"<img src=../../upload/images/"+calendar.get(Calendar.YEAR)+"/"+(calendar.get(Calendar.MONTH)+1)+"/"+calendar.get(Calendar.DAY_OF_MONTH)+"/"+x+"."+myFile.getFileExt()+" width="+width+" height="+height+" border=0>\");");
}
if(fileExt.equals("swf")){
	out.println("range.pasteHTML(\"<object classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0 width="+width+" height="+height+" "+
	"<param name=movie value=../../upload/images/"+calendar.get(Calendar.YEAR)+"/"+(calendar.get(Calendar.MONTH)+1)+"/"+calendar.get(Calendar.DAY_OF_MONTH)+"/"+x+"."+myFile.getFileExt()+"> "+
	"<param name=quality value=high> <embed src=../../upload/images/"+calendar.get(Calendar.YEAR)+"/"+(calendar.get(Calendar.MONTH)+1)+"/"+calendar.get(Calendar.DAY_OF_MONTH)+"/"+x+"."+myFile.getFileExt()+" "+
	"quality=high pluginspage=http://www.macromedia.com/go/getflashplayer type=application/x-shockwave-flash width="+width+" height="+height+"></embed></object>\");");	
}
out.println("parent.parent.myform.imgfile.value += '"+calendar.get(Calendar.YEAR)+"/"+(calendar.get(Calendar.MONTH)+1)+"/"+calendar.get(Calendar.DAY_OF_MONTH)+"/"+x+"."+myFile.getFileExt()+":';");
out.println("alert('Upload successfully!');");
out.println("history.go(-1);");
out.println("parent.HtmlEdit.focus();");
out.println("</script>");
%>