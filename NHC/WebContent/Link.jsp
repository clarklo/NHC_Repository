<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.www.FriendSite"%>
<%@ page import="com.web.www.ProcessFriendSite"%>

<%@ page import="com.web.www.ProcessArticle" %>
<%@ page import="com.web.www.Article" %>
<%@ page import="com.web.util.DealString" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery</title>
<link rel="stylesheet" href="css/css.css" type="text/css" media="screen"/>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#edf0f8;">
        <div class="menu">
            <div class="item">
                <a class="link icon_mail"></a>
                <div class="item_content">
                    <h2>友善連結</h2>
                    <p>
                     <%
                     ProcessFriendSite  pfs = new ProcessFriendSite();
                     FriendSite fs = new FriendSite();
                     List lt = new ArrayList();
                     lt=pfs.qurAllFriendSite(0);
					 String url ="";
                     String sitename ="";
                     if(lt.size()>0)
                     {
                       for(int k=0;k<lt.size();k++)
                       {
                         fs = (FriendSite)lt.get(k);
                         sitename =fs.getName();
                         url = fs.getUrl();
                  %>
                          <%if("http://".equals(url)||"".equals(url)){%><%=sitename%>
                          <%}else{%>
                          <a href="<%=url%>" target="_blank" ><%=sitename%></a>
                    <%     }
                         }
                      }
                     %>
                    
                        <!--<a href=""><img src="images/index_link_pic01.png" width="122" height="38" alt="榮民醫療體系入口網" /></a>
                        <a href=""><img src="images/index_link_pic02.png" width="122" height="38" alt="高屏EOC" /></a>
                        <a href=""><img src="images/index_link_pic03.png" width="122" height="38" alt="反毒資源網" /></a>
                        <a href=""><img src="images/index_link_pic04.png" width="122" height="38" alt="綠色生活資訊網" /></a>
                        <a href=""><img src="images/index_link_pic04.png" width="122" height="38" alt="確保核安穩健檢核網" /></a>-->
                    </p>
                </div>
            </div>
            <div class="item">
                <a class="link icon_help"></a>
                <div class="item_content">
                    <h2>聯絡我們</h2>
                    
                        <a href="mailto:imc@vghks.gov.tw">E-mail：imc@vghks.gov.tw</a>
                        
                    
                </div>
            </div>
           
            
            <div class="item">
                <a class="link icon_home"></a>
                <div class="item_content">
                    <h2>特色醫療中心</h2>
                    <ul>
				
					<li><a href="navigation/showproduct.jsp?id=1154661702812" target="_top">心臟血管中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661724984" target="_top">植牙中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661760312" target="_top">銩雷射治療中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661797171" target="_top">生殖中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661780859" target="_top">骨科部</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661917000" target="_top">屈光雷射中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661998968" target="_top">美容醫學中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154662095281" target="_top">健康管理中心</a></li>					
					<li><a href="navigation/showproduct.jsp?id=1155690083354" target="_top">兒童心臟中心</a></li>
					<li><a href="navigation/showproduct.jsp?id=1154661972843" target="_top">正子造影中心</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>-->
        <script src="js/jquery-1.10.1.min.js" type="text/javascript"></script>
        <script src="js/jquery-css-transform.js" type="text/javascript"></script>
        <script src="js/jquery-animate-css-rotate-scale.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/main.js"></script>
</body>
</html>


