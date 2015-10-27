<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.web.database.*,util.*" errorPage="error/error.jsp" %>
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


java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");    
java.util.Date currentTime_1 = new java.util.Date();    
//formatter.format(currentTime_1)  

String id = "0";
String title0 = "";
String author0 = "未知";
String date0 = formatter.format(currentTime_1);
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
    <td colspan="7" align="center" height="30" background="images/tablebg.gif"><strong>文 章 管 理</strong></td>
  </tr>
  <form name="myform" method="post" action="<%if(id.equals("0")){%>addarticle.jsp?cid=<%=cid%>&no=<%=no%><%}else{%>modarticle.jsp?cid=<%=cid%>&no=<%=no%>&id=<%=id%><%}%>"  onSubmit="return CheckForm();">
  <tr> 
    <td width="12%" height="25" align="center"><div align="right"><strong>所在欄目</strong></div></td>
    <td width="88%" align="center"><div align="left">
      <table width="100%"  border="0">
        <tr>
          <td width="89%" height="24"><%=path%></td>
          <td width="11%" height="24"><div align="right">
            <input type="button" name="Submit2" value="返 回" onClick="javascript:location.href='admin.jsp?pid=<%=cid%>&no=<%=request.getParameter("no")%>';">
          </div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td height="25" align="center">      <p align="right"><strong>文章標題</strong></p></td>
    <td height="25" align="center"><div align="left">
      <input name="title" type="text" id="title" size="40" maxlength="80" value="<%=title0%>">
      <select name=type id="type"  onchange=Dotitle(this.options[this.selectedIndex].value)>
        <option value="" selected>[類型]</option>
        <option value="[圖文]">[圖文]</option>
        <option value="[原創]">[原創]</option>
        <option value="[轉帖]">[轉帖]</option>
        <option value="[討論]">[討論]</option>
        <option value="[推薦]">[推薦]</option>
        <option value="[注意]">[注意]</option>
        <option value="[分享]">[分享]</option>
          </select> 
      <span class="style1">*      </span></div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right"><strong>作&nbsp;&nbsp;&nbsp;&nbsp;者</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="author" type="text" id="author" value="<%=admin.getName()%>" maxlength="255">
    </div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right"><strong>發布日期</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="date" type="text" id="date" value="<%=date0%>" size="20" onClick="J.calendar.get({dir:'right'});"/>
    （日期的格式為︰2013-09-25）</div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right"><strong>關 鍵 字</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="keyword" type="text" id="keyword" size="50" maxlength="255" value="<%=keyword0%>">
      <span class="style1">    *</span></div></td>
  </tr>  
  <tr>
    <td height="25" align="center"><div align="right"><strong>內容摘要</strong></div></td>
    <td height="25" align="center"><div align="left">
      <textarea name="summary" cols="50" rows="4" id="summary"><%=summary0%></textarea>
      <span class="style1">*</span></div></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center"><div align="center"><strong>文章內容<span class="style1">*</span></strong></div></td>
    </tr>
  <tr> 
    <td height="25" colspan="2" align="center"><div align="center">
    <input name="imgfile" type="hidden" id="imgfile" value="">
    <textarea name="content" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=content0%></textarea>
    </div>    
    </td>
    </tr>
  <tr> 
    <td height="25" align="center"><div align="right"><strong>首頁圖片</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="indexImage" type="text" id="indexImage" size="40" value="<%=indexImage0%>">
      <select name="DefaultPicList" id="DefaultPicList" onChange="indexImage.value=this.value;">
        <option selected>不指定首頁圖片</option>
      </select>
    </div></td>
  </tr>
  <tr> 
    <td height="25" align="center"><div align="right"><strong>文章性質</strong></div></td>
    <td height="25" align="center"><div align="left">
	<input name="top" type="checkbox" id="top" value="1" <%rs = op.query("SELECT * FROM cms_topinfo WHERE cms_topinfo_info='"+id+"'");if(rs.next()){%>checked<%}%>>置頂
	
<input name="html" type="hidden" id="html" value="<%=html0%>">
    </div></td>
  </tr>
  <tr>
    <td height="25" align="right"><div align="right"><strong>摘要</strong></div></td>
    <td height="25" align="center"><div align="left">
      <input name="comment" type="radio" value="1" <%if(comment0==1){%>checked<%}%>>
    是 
    <input type="radio" name="comment" value="0" <%if(comment0==0){%>checked<%}%>>
    否</div></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center">      <div align="center">
        <input type="submit" name="Submit" value="<%if(id.equals("0")){%>添 加<%}else{%>修 改<%}%>">
        <input name="Reset" type="reset" id="Reset" value="重 置">
        <input type="button" name="Submit2" value="返 回" onClick="javascript:location.href='admin.jsp?pid=<%=cid%>&no=<%=request.getParameter("no")%>';">
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