<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.web.database.*" %>
<%@ page import="com.web.www.ProcessDocDown" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.www.DocDown" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-最新消息</title>
<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>

<script type="text/javascript" src="../js/6-8-001-2.js"></script>
  </head>
 <%
Operation op = new Operation();
ResultSet rs = null;

int id = 0;
String type0 =  "無!";
String name0 = "";
String url0 = "http://";
String logo0 = "http://";
String introduce0 = "無!";
String commend0 = "無!";
String check0 =  "無!";

 //String cid=(String)request.getAttribute("cid");
if(request.getParameter("cid")!=null){
	id = Integer.parseInt(request.getParameter("cid"));
		//String sql="select cms_infodata_id,cms_infodata_name,cms_infodata_releasetime" +
				//" from cms_infodata where cms_infodata_class=" +classid+
				//" order by cms_infodata_id desc";
	rs = op.query("SELECT * from cms_infodata where cms_infodata_class="+id+" order by cms_infodata_id desc");
	rs.next();
	//type0 = rs.getString("cms_infodata_id");
	name0 = rs.getString("cms_infodata_name");
	url0 = rs.getString("cms_infodata_releasetime");
	//logo0 = rs.getString("cms_link_logo");
	//introduce0 = rs.getString("l_title");
	//commend0 = rs.getString("user_company");
	//check0 = rs.getString("user_tel");
	
	op.closestmt();
}
%>
  <body>
   <jsp:include page="../sub/top.jsp"/>

   
<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><img src="../images/menu_pic11.png" width="231" height="81" alt="最新消息" /></div>

   
   
   <jsp:include page="left.jsp"/>
   
   
   </td>
    <td valign="top">
    <table width="729" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="content_banner"><iframe src="../0023_2.html" width="726" height="176" align="top"  scrolling ="no" frameborder="0"></iframe></div></td>
  </tr>
  <tr>
    <td valign="top">
    <div class="title">
    <h1>最新消息</h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li>最新消息</li>
    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
    <div class="content">
    <div class="NewsTable">

                   
<table width="660" border="0" cellspacing="0" cellpadding="0">

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
	rs = op.query("SELECT COUNT(*) AS total from cms_infodata where cms_infodata_class="+id+"");
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

	//獲得當前頁的記錄集
	
	rs = op.query("SELECT * from cms_infodata where cms_infodata_class="+id+" order by cms_infodata_id desc ," + pageSize);
  %>
   
  <%
  int j = 0;
  while(rs.next()){
	  String id1 = rs.getString("cms_infodata_id");
	  String type1 = rs.getString("cms_infodata_id");
	  String name1 = rs.getString("cms_infodata_name");
	  String url1 = rs.getString("cms_infodata_releasetime");
	 
	  
	  j++;
  %>                    
                        <tr>
							<td width="1%" valign="top"><img src="../images/LOGIN_ICON.png" width="11" height="12" alt="icon" /></td>
							<td><a href="showNews.jsp?id=<%=id1%>" title="<%=name1%>"><%=name1%></a></td>
							<td align="center" valign="top"><p><%=url1%></p></td>
						</tr>
                      <%
  }
  %>
 
                    </table>
					
					    </div>
    <div class="PageNumeral">
      <%=navigator%>
      </div>
    <div class="clear"></div>
    
    </div>

    <!------編輯內容區結束-------------->
    </td>
  </tr>
  <tr>
    <td valign="bottom">
		<jsp:include page="../sub/back.jsp"/>
    </td>
  </tr>
</table>
    </td>
  </tr>
</table>
<jsp:include page="../sub/foot_top.jsp"/>
</div>
</div>
		<jsp:include page="../sub/foot.jsp"/>
  </body>
</html>