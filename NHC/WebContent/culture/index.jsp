<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.util.*"%>
<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.util.DealString" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高雄榮民總醫院國際醫療中心-就醫資訊</title>

<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="../js/6-8-001-2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.fancybox').fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none'
		});
	});
</script>
<style>
.dnone
{
	display:none;
}
</style>
</head>
<%
	DealString ds=new DealString();
	String cid=ds.toString(request.getParameter("id"));
	String id="";
	int currpage =1;
    int PageCount=0;

	ProcessArticle pa=new ProcessArticle();
	if("".equals(cid)||cid==null)
		{
			List list=pa.query(0,"132");
			Article ac=(Article)list.get(0);
			id=ac.getId();
		}
	else
	    {
			List list=pa.query(0,cid);
			Article ac=(Article)list.get(0);
			id=ac.getId();
		}
	pa.getOnedate(id);
	Article article=pa.getArticle();
	if(!"".equals(request.getParameter("page")) && request.getParameter("page")!=null)
     currpage=Integer.parseInt(request.getParameter("page"));
    StringTokenizer st=new StringTokenizer(article.getContent(),"|||");
	PageCount=st.countTokens();
    String content[]= new String[st.countTokens()] ;
    System.out.println("st.countTokens()="+st.countTokens());
    for(int i=0;st.hasMoreTokens();i++)
    {
         content[i]=st.nextToken();
    }
%>
<body>
<jsp:include page="../sub/top.jsp" />

<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><img src="../images/menu_pic10.png" width="231" height="81" alt="就醫資訊" /></div>

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
    <h1><%=article.getTitle()%></h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li><a href="../culture/">就醫資訊</a></li>
    <li>></li>
    <li>
   <%=article.getTitle()%>
					
</li>
    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
    <div class="content">

					<%=content[currpage-1]%>

            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                      
            <%if(PageCount>1){%>
					  <tr>
                        <td align="center">&nbsp;<%if(currpage>1) {%>
			   <a href="index.jsp?id=<%=id%>&page=1">首頁</a> 
			  <%}else{%>
			   <font color="#FF0000">首頁</font> 
			  <%}%>
              <%if(currpage-1>0){%>
              <a class="red_link" href="index.jsp?id=<%=cid%>&page=<%=currpage-1%>">上一頁</a> 
              <%}else{%>
              <font color="#FF0000">上一頁</font> 
              <%}%>
              　 
              <%if(currpage+1<=PageCount){%>
              <a  class="red_link" href="index.jsp?id=<%=cid%>&page=<%=currpage+1%>">下一頁</a> 
              <%}else{%>
              <font color="#FF0000">下一頁</font> 
              <%}%>
			  <%if(currpage<PageCount) {%>
			  <a class="red_link" href="index.jsp?id=<%=cid%>&page=<%=PageCount%>">末頁</a> 
			   <%}else{%>
              <font color="#FF0000">末頁</font> 
              <%}%></td>
                      </tr>
                  <%}%> 
                    </table>

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