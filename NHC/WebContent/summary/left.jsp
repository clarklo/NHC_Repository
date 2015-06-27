<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.List" %>
<%@ page import="com.web.www.ProcessClassify" %>
<%@ page import="com.web.www.Classify" %>

 
<link href="../css/demo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/script.js"></script>

    <div class="menu_BG">
      <div id="main">
		<ul class="container">
		  <li class="menuAC">
			<ul>
	<%
	ProcessClassify pc=new ProcessClassify();
	List list=pc.qurAllClassByfatid("100");
	if(list.size()>0)
	{
	  for(int i=0;i<1;i++)
	  {
		Classify cf=(Classify)list.get(i);
		
	
%>

	<%if(cf.getId()==127) {%>
	    <li class="button01"><a href="Page.jsp?id=<%=cf.getId()%>" class="green"><%=cf.getName()%></a></li>
		
	<%}  %>
		
		
		
	<%
  	}
  }
  %>
  <li class="button"><a href="#" class="green">國際交流</a></li>
            <li class="dropdown" style="display: list-item;">
                <ul>
                    <li><a href="index.jsp?cid=129">國際義診</a></li>
                    <li><a href="index.jsp?cid=130">學術交流</a></li>
                    
                </ul>
			</li>
	</ul>
	</li>
    </ul>
    </div>
	
	
	
	<div class="clear"></div>
    
   <jsp:include page="../sub/left_foot.jsp"/>
    
    </div>


