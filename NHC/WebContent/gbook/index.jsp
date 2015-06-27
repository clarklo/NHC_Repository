<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.util.*" import="java.sql.*"%>
<%@ page errorPage="index_error.jsp" %>
<jsp:useBean id="db" scope="request" class="com.msg.db.DBConnect">
</jsp:useBean>
<jsp:useBean id="m_pages" scope="page" class="com.msg.bean.Pagination">
</jsp:useBean>

<SCRIPT language=javascript>
function ConfirmDel()
{
   if(confirm("確定要刪除選中的留言嗎？一旦刪除將不能恢復﹗"))
     return true;
   else
     return false;

}
</SCRIPT>
<!----Navigation Bar Begin---->
<body bgcolor="#FFFFFF">
<jsp:include page="../sub/top.jsp"></jsp:include>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
  <tr>
    <td height="30"><TABLE width="990" align=center cellPadding=1 cellSpacing=1 bgcolor="#ACB9D1">
  <TBODY>
  <TR align=middle bgcolor="#A3B2CC">
    <TD width=34 align=middle style="color: #FFFFFF"><IMG src="image/gb.gif" width=18 border=0 style="line-height: 21px; font-size: 12px;"></TD>
    <TD width=* align=middle bgcolor="#FFFFFF" style="color: #FFFFFF">
      <span style="line-height: 21px; font-size: 12px;">
      <SCRIPT language=JavaScript src="image/fader.js"
      type=text/javascript></SCRIPT>
      <marquee  height=20 hspace=5 loop=100 scrollamount=2
      scrolldelay=10 width=100% on="left" DIRECTI
      align="center">
<%
Connection conn1=db.getConn();
Statement stmt1=conn1.createStatement();
String s="select news from system";
ResultSet rs0=stmt1.executeQuery(s);
if(rs0.next()){
%>
              <span class="hongse13"><%=rs0.getString("news")%>          </span>    
              <%
}
rs0.close();
stmt1.close();
conn1.close();
%>
        </marquee>
      </span></TD>
  </TR></TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td height="30"><table width="990" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" bgcolor="#A3B2CC">
      <tbody>
        <tr>
          <td valign="center" align="left" width="70%"><b>&nbsp;<img alt=""
      src="image/closedfold.gif" border="0" />高雄榮民總醫院&gt;&gt;真情留言&gt;&gt; 首頁</b></td>
          <td valign="bottom" align="right" width="30%"><a href="send.jsp"><img src="image/t_new.gif" border="0" /></a>&nbsp;&nbsp;<a href="publish.jsp"><img src="image/t_new2.gif" border="0" /></a></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table  cellspacing="0" cellpadding="0" width="990" align="center" border="0">
      <tbody>
        <tr>
          <td><div align="center">
              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
                <tbody>
                  <tr align="middle" bgcolor="#f5f6f6" height="22">
                    <td width="214" background="image/bbs"><div align="center"><font color="#666666"><b>用戶訊息</b></div></td>
                    <td width="624" background="image/bbs"><div align="center"><font color="#666666"><b>留言內容</b></div></td>
                  </tr>
                  <%
Connection con=db.getConn();
Statement stmt=con.createStatement();
int ComSet=10;
   int curPages = m_pages.curPages(m_pages.strPage(request,"page"));
   //Pagination.strPage(request,"page")取page值傳遞給curPages()方法
   m_pages.setRows(ComSet);//設定每頁顯示10條
   String sql1="select count(*) as t from message";
   ResultSet rs_count=stmt.executeQuery(sql1);//傳遞進數據庫處理的javabean
   rs_count.next();
   int resultconts=rs_count.getInt("t");//取得總的數據數
   int totalPages = m_pages.getPages(resultconts);//取出總頁數
   String sql2="select * from message order by id desc";
   ResultSet rs2=stmt.executeQuery(sql2);
   ResultSet rs=m_pages.getPageSet(rs2,curPages);//獲取指標的結果集參數是(結果集，頁數)
   int i=1;
        while(rs.next()){
          String id=rs.getString("id");
          String name=rs.getString("name");
          String sex=rs.getString("sex");
          String content=rs.getString("content");
          String recontent=rs.getString("recontent");
          String qq=rs.getString("qq");
          String email=rs.getString("email");
          String http=rs.getString("http");
          String ltime=rs.getString("ltime");
          String ip=rs.getString("ip");
          
          System.out.println(id);
          System.out.println(name);
          System.out.println(sex);
          System.out.println(content);
          System.out.println(recontent);
          System.out.println(qq);
          System.out.println(email);
          System.out.println(http);
          System.out.println(ltime);
          System.out.println(ip);
          
%>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td><span class="style2"><span class="style4"><span class="style7"><font color="#666666"><%=name%></font></span><font color="#666666"><span class="style3">留言於</span><br />
                              <%=ltime%>&nbsp;&nbsp;</font></span></span><font color="#666666"> </td>
                    <td align="right" bgcolor="#ffffff"><a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=qq%>" target="_blank"><img src="image/icon_editor_oicq.gif" alt="<%=name%>的QQ是︰<%=qq%>" width="16" height="16" border="0" /></a><a href="<%=http%>" target="_blank"><img src="image/icon_homepage.gif" alt="<%=name%>的主頁" width="16" height="16" border="0" /></a><a href="mailto:<%=email%>"><img src="image/icon_email.gif" alt="<%=name%>的Email是︰<%=email%>" width="16" height="16" border="0" /></a><a href="edit.jsp?id=<%=id%>"><img src="image/icon_edit_topic.gif" width="16" height="16" border="0" alt="編輯該留言[只有版主才有的權利]" /></a><a href="del_pro.jsp?id=<%=id%>" onClick="return ConfirmDel();"><img src="image/icon_delete_reply.gif" alt="刪除該留言[只有版主才有的權利]" width="16" height="16" border="0" /></a> </td>
                  </tr>
                  <tr valign="center" align="middle" bgcolor="#ffffff">
                    <td><div align="center">
                        <%
		if("男".equals(sex)){
		%>
                        <img src="image/1.gif" />
                        <%
		}else{
		%>
                        <img src="image/2.gif" />
                        <%
		}
	%>
                        <br />
                        <font color="#666666"><%=name%></font><br />
                        <%
System.out.println(session.getAttribute("adminname"));
if(session.getAttribute("adminname")==null){

%>
                        <span class="style4"><font color="#000099">IP:</font><font color="#666666">守密</font></span>
                        <%
}else{
%>
                        <span class="style4"><font color="#000099">IP:</font><font color="#666666"><%=ip%></font></span>
                        <%
}
%>
                    </div></td>
                    <%
		  if(recontent==null||"".equals(recontent.trim())){
		  %>
                    <td align="left" valign="top" bgcolor="#ffffff"><pre><font color="#666666"><%=content%><font></pre></td>
                    <%
		  }
		  else{ %>
                    <td width="118" align="left" valign="top" bgcolor="#ffffff" style="word-break:break-all"><pre><font color="#666666"><%=content%></font></pre>
                        <br />
                      <hr />
                      <font color="#0E5FA7"> 版主回複︰<font color="#666666"><%=recontent%></font></td>
                    <%}
		  %>
                  </tr>
                  <tr height="2">
                    <td colspan="2" bgcolor="#666666"></td>
                  </tr>
                  <%
i=i+1;
if(i>ComSet)
break;
}
%>
                  <tr  bgcolor="#ffffff">
                    <td align="right" colspan="2" valign="top" bgcolor="#ffffff"><%
  if(curPages>1)
  {
  %>
                        <a href="index.jsp?page=<%=curPages-1%>">上一頁</a>
                        <%}
  else{%>
                      上一頁
                      <%}
 if(curPages<totalPages)
 {
  %>
                      <a href="index.jsp?page=<%=curPages+1%>">下一頁</a>
                      <%}
  else{%>
                      下一頁
                      <%}%>
                      <!---->
                      當前第<%=curPages%>頁 共<%=totalPages%>頁
                      <!---->
                      <%
  if(curPages>1)
  {
  %>
                      <a href="index.jsp?page=<%=totalPages-(totalPages-1)%>">首頁</a>
                      <%}
  else{%>
                      首頁
                      <%}
 if(curPages<totalPages)
 {
  %>
                      <a href="index.jsp?page=<%=totalPages%>">尾頁</a>
                      <%}
  else{%>
                      尾頁
                      <%}%>
                      <%
        try{
          rs_count.close();
          rs2.close();
          rs.close();
          stmt.close();
          con.close();
        }
        catch(Exception e){

          }
%>                    </td>
                  </tr>
                </tbody>
              </table>
          </div></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>

<!----Navigation Bar End----->
<BR>
<TABLE cellSpacing=0 cellPadding=0 width="75%" align=center border=0>
  <TBODY>
  <TR>
    
    
    </TR></TBODY></TABLE>
<BR>
<div align="center">
<jsp:include page="sub/foot.jsp"></jsp:include></div>
</BODY></HTML>