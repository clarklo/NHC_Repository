<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.web.www.ProcessDocDown" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.www.DocDown" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>高雄榮民總醫院國際醫療中心-搜尋</title>
<link href="../css/vghks_LAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/contentLAYOUT.css" rel="stylesheet" type="text/css" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.5.2.min.js"></script>

<script type="text/javascript" src="../js/6-8-001-2.js"></script>

</head>
<%
     String title=(String)request.getAttribute("title");
%>
  <body>
   <jsp:include page="../sub/top.jsp"/>
   

<!----內容區------>
<div class="CONTENT_c">
<div class="box03">
<table width="960" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="231" valign="top">
    <div class="menu_title"><!--<img src="../images/menu_pic08.png" width="231" height="81" alt="友善連結" />--></div>

   
   
   <jsp:include page="../menu.jsp"/>
   
   
   </td>
    <td valign="top">
    <table width="729" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div class="content_banner"><iframe src="../0023_2.html" width="726" height="176" align="top"  scrolling ="no" frameborder="0"></iframe></div></td>
  </tr>
  <tr>
    <td valign="top">
    <div class="title">
    <h1>搜尋列表</h1>
    <ul>
    <li><a href="../index.jsp">首頁</a></li>
    <li>></li>
    <li>搜尋列表</li>
    </ul>
    </div>
     <div class="clear"></div>
	<jsp:include page="../sub/font.jsp"/>
    <div class="clear"></div>
    <!------編輯內容區-------------->
    <div class="content">
    
<table width="660" border="0" cellspacing="0" cellpadding="0">

                      <%
                            Vector v=(Vector)(Object)request.getAttribute("Info");
						          request.removeAttribute("Info");

						          if (v!=null){
						                Enumeration e=v.elements();
										while(e.hasMoreElements())
										{
											Object[] obj=(Object[])e.nextElement();
                                    		String title1=(String)obj[1];
                                    		String id=(String)obj[0];
                                    		String time=(String)obj[2];
											String cid=(String)obj[3];
											ProcessClassify pcf = new ProcessClassify();
											String classname=pcf.queryNameByid(cid);
                                    		time=time.substring(0,10);
                                    		String subTitle=title1;
                                    		if(subTitle.length()>31)
                                    			subTitle=subTitle.substring(0,31);
					%>
                      <tr>
                        <td width="12%" height="25" align="center" bgcolor="#FFFFFF" class="hongse13">[<span class="14cuhongse"><%=classname%></span>]</td>
                        <td width="71%" bgcolor="#FFFFFF">&nbsp;<span class="14hao"><a href="showNews.jsp?id=<%=id%>" title=<%=title%> class="red_link15"><%=subTitle%></a></span></td>
                        <td width="17%" align="center" bgcolor="#FFFFFF" class="14hao">[<%=time%>]</td>
                      </tr>
                      
                      
                      <%
                              		}
                              		v.clear();
                              	}
                              	
                              %>
                            
                    </table>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="30" align="right"> <%
        String curpage=(String)(Object)request.getAttribute("Curpage");
        request.removeAttribute("Curpage"); 
        String maxpagenum=(String)(Object)request.getAttribute("Maxpage");
        request.removeAttribute("Maxpage");
     
        int MaxPagenum=Integer.parseInt(maxpagenum); 
   	    int curpageNum=Integer.parseInt(curpage);      
        %>
         共<span class="red_font"><%=MaxPagenum%></span>頁 第
        <span class="red_font"><%=curpageNum%></span>頁 共搜尋到
        <span class="red_font"><%=(String)request.getAttribute("Counts")%>條</span>
        
        <%
        if(curpageNum==1){
            out.print("　");
        }else{
        %>
            <a href="SearchList?pgnum=1&title=<%=title%>"   class="red_link15">【最前頁】</a>
            <a href="SearchList?pgnum=<%=curpageNum-1%>&title=<%=title%>"  class="red_link15">【上一頁】</a>
        <%
        }
        %>
        <%
        if(curpageNum>=MaxPagenum){
            out.print("　");
        }else{
        %>
        <a href="SearchList?pgnum=<%=curpageNum+1%>&title=<%=title%>"   class="red_link15">【下一頁】</a>
        <a href="SearchList?pgnum=<%=MaxPagenum%>&title=<%=title%>"  class="red_link15">【最後頁】</a>
        <%
        }
        %></td>
        </tr>
    </table>
    
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