<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*,com.web.util.*" errorPage="error/error.jsp" %>
<%@include file="permission.jsp"%>
<%@include file="permission/permission3.jsp"%>
<%
Operation op = new Operation();
ResultSet rs = null;
int cid = Integer.parseInt(request.getParameter("cid"));
int no = Integer.parseInt(request.getParameter("no"));
rs = op.query("SELECT * FROM cms_class WHERE cms_class_id="+cid);
rs.next();
String name = rs.getString("cms_class_name");
String path = rs.getString("cms_class_pathname") + name;
path = ReplaceAll.replace(path, "::", "/");

String id = "0";
String title0 = "";
String author0 = "未知";
String date0 = "未知";
String date1 = "2013-07-25";
String date2 = "2013-07-25";
String keyword0 = "";
String summary0 = "";
String html0 = "";
String content0 = " ";
String indexImage0 = "";
int commemd0 = 0;
int level0 = 0;
int comment0 = 1;

if(cid==81)
   content0="<TABLE bgColor=#ffffff style=\"WIDTH: 498px; HEIGHT: 91px\" border=bordercolor=#000000><TBODY><TR><TD></TD><TD></TD><TR><TD></TD><TD></TD><TR><TD></TD><TD></TD></TR></TBODY></TABLE>";
             
if(request.getParameter("id")!=null){
	id = request.getParameter("id");
	rs = op.query("select cms_infodata.*,cms_infodata1.cms_infodata1_author,cms_infodata1.cms_infodata1_content from cms_infodata,cms_infodata1 where cms_infodata.cms_infodata_id=cms_infodata1.cms_infodata1_id AND cms_infodata.cms_infodata_id='"+id+"'");
	rs.next();

	title0 = rs.getString("cms_infodata_name");
	date0 = rs.getString("cms_infodata_releasetime");
	if(date0.length()>10)
	    date0=date0.substring(0,10);
	date1 = rs.getString("cms_infodata_uptime");
	if(date1.length()>10)
	    date1=date1.substring(0,10);
	date2 = rs.getString("cms_infodata_dntime");
	if(date2.length()>10)
	    date2=date2.substring(0,10);
	indexImage0 = rs.getString("cms_infodata_indexpic");
	keyword0 = rs.getString("cms_infodata_keyword");
	summary0 = rs.getString("cms_infodata_descripte");
	html0 = rs.getString("cms_infodata_html");
	
	comment0 = rs.getInt("cms_infodata_iscoment");
	author0 = rs.getString("cms_infodata1_author");
	content0 = rs.getString("cms_infodata1_content");
	op.closestmt();
}
%>
<html>
<head>
<title>Untitled Document</title>
<script type="text/javascript" src="lhgcalendar/lhgcore.js"></script>
<script type="text/javascript" src="lhgcalendar/lhgcalendar.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script language = "JavaScript">
<!--
function CheckForm()
{
 	if(editor.EditMode.checked==true)
	  	document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  	else
	  	document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 
	  
	if(myform.title.value == ""){
		alert("文章標題不能為空,請輸入文章標題!");
		myform.title.focus();
		return false;
	}
	if(myform.date.value==""){
	    alert("文章發布日期不能為空,請輸入文章發布日期!");
		myform.date.focus();
		return false;
	}else if(myform.date.value.length!=10||myform.date.value.indexOf("-")<=-1){
	     alert("文章發布日期格式不正確,請輸入文章正確的格式，如︰2006-07-25");
		 myform.date.focus();
		return false;
	}
	
	if(myform.date1.value==""){
	    alert("NEWS上架日期不能為空,請輸入NEWS上架日期!");
		myform.date1.focus();
		return false;
	}else if(myform.date1.value.length!=10||myform.date1.value.indexOf("-")<=-1){
	     alert("NEWS上架日期格式不正確,請輸入文章正確的格式，如︰2013-07-25");
		 myform.date1.focus();
		return false;
	}
	
	if(myform.date2.value==""){
	    alert("NEWS下架日期不能為空,請輸入NEWS下架日期!");
		myform.date1.focus();
		return false;
	}else if(myform.date2.value.length!=10||myform.date2.value.indexOf("-")<=-1){
	     alert("NEWS下架日期格式不正確,請輸入文章正確的格式，如︰2013-07-25");
		 myform.date2.focus();
		return false;
	}
	
	
	
	if(myform.keyword.value == ""){
		alert("文章關鍵字不能為空,請輸入關鍵字!");
		myform.keyword.focus();
		return false;
	}	
	if(myform.summary.value == ""){
		alert("文章摘要不能為空,請輸入摘要!");
		myform.summary.focus();
		return false;
	}	
	if(myform.Content.value == ""){
		alert("文章內容不能為空,請輸入文章內容!");
		return false;
	}		
	
  return true;  
}

function Dotitle(addtitle) 
{ 
var revisedtitle; 
revisedtitle = addtitle; 
document.myform.title.value= revisedtitle + document.myform.title.value; 
document.myform.title.focus(); 
return; 
}
function loadForm()
{
  editor.HtmlEdit.document.body.innerHTML=document.myform.Content.value;
  return true
}
//-->
</script>
<!--
-編輯器-
-->
<script charset="utf-8" src="ckeditor/kindeditor.js"></script>
	<script charset="utf-8" src="ckeditor/lang/zh_TW.js"></script>
	<script charset="utf-8" src="ckeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : 'ckeditor/plugins/code/prettify.css',
				uploadJson : 'ckeditor/jsp/upload_json.jsp',



				fileManagerJson : 'ckeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['myform'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['myform'].submit();
					});
                    },
                   afterChange : function() {
                           this.sync();
                   }
          });
          prettyPrint(); 
});
	</script>
<!--編輯器
-->
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body onLoad="javascipt:setTimeout('loadForm()',1000);">
<table width="95%" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#ECEEE4" bordercolordark="#CCCABC">
  <tr> 
    <td colspan="7" align="center" height="30" background="images/tablebg.gif">&nbsp;</td>
  </tr>
  <form name="myform" method="post" action="<%if(id.equals("0")){%>addarticle.jsp?cid=<%=cid%>&no=<%=no%><%}else{%>modadmin2.jsp?cid=<%=cid%>&no=<%=no%>&id=<%=id%><%}%>"  onSubmit="return CheckForm();">
 
  <tr>
    <td height="25" align="center"><div align="right"><strong>內容摘要</strong></div></td>
    <td height="25" align="center"><div align="left">
      <textarea name="summary" cols="50" rows="4" id="summary" /><%=summary0%></textarea>
      <span class="style1">*</span></div></td>
  </tr>
 <tr> 
    <td height="25" align="center"><div align="right"><strong>上架日期</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="date1" type="text" id="date1" value="<%=date1%>" size="20" onClick="J.calendar.get({dir:'right'});" />
    （日期的格式為︰2013-09-25）</div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right"><strong>下架日期</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="date2" type="text" id="date2" value="<%=date2%>" size="20" onClick="J.calendar.get({dir:'right'});" />
    （日期的格式為︰2013-09-25）#下架日期必須大於上架日期</div></td>
  </tr>
  <tr>
    <td width="12%" height="25" align="right"><div align="right"><strong>上下架</strong></div></td>
    <td width="88%" height="25" align="center"><div align="left">
      <input name="comment" type="radio" value="1" <%if(comment0==1){%>checked<%}%>>
      是 #必須選擇是才會依據日期自動上下架
      <input type="radio" name="comment" value="0" <%if(comment0==0){%>checked<%}%>>
      否 #此項為強制下架</div></td>
  </tr>
  <tr>
  <input name="html" type="hidden" id="html" value="<%=html0%>">
      <input name="title" type="hidden" id="title" size="255" value="<%=title0%>">
      <input name="author" type="hidden" id="author" value="<%=admin.getName()%>">
      <input name="date" type="hidden" id="date" value="<%=date0%>">
      <input name="keyword" type="hidden" id="keyword" value="<%=keyword0%>">
     
      <input name="content" type="hidden" id="content" size="255" value="<%=content0%>"/>
      <input name="imgfile" type="hidden" id="imgfile" value="">
      <input name="indexImage" type="hidden" id="indexImage" size="40" value="<%=indexImage0%>">
      <input name="top" type="hidden" id="top" value="1">
      <input name="html" type="hidden" id="html" value="<%=html0%>">
  </tr>
  <tr>
    <td height="25" colspan="2" align="center">      <div align="center">
        <input type="submit" name="Submit" value="<%if(id.equals("0")){%>添 加<%}else{%>修 改<%}%>">
       
        <input type="button" name="Submit2" value="返 回" onClick="javascript:location.href='admin1.jsp?pid=<%=cid%>&no=<%=request.getParameter("no")%>';">
      </div></td>
  </tr>
  </form>
</table>
</body>
</html>
<%

op.closestmt();
op.closeconn();
%>