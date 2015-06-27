<%@page contentType="text/html; charset=big5" language="java" import="java.sql.*"  %>
<jsp:useBean id="DB" scope="page" class="com.msg.db.DBConnect"/>

<%!
  String  DateToString(){
      String str;
      //int i,j;
      java.util.Date date = new java.util.Date();
      str=String.valueOf(date.getTime());
      //i=str.length();
      //j=i-9;
      str=str.substring(0,9);
      return str;
  }
%>
<%! String sql,Time_Str,User_List,Guest_List,UserName;
    long Online_Time;
    int Guest_Num,User_Num;
%>
<%
 Guest_List="";
 User_List="";

 Connection con=DB.getConn();
 Statement  stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
 ResultSet rs=null;


  sql="select * from online where olid='"+session.getId()+"'";
  rs=stmt.executeQuery(sql);
  rs.last();
  if (rs.getRow()>0)
      {
  if (session.getValue("UserName")==null)
  sql="update online set olaftertime='"+DB.getTime()+"',olendtime='"+DateToString()+"' where olid='"+session.getId()+"'";
  else
  sql="update online set olusername='"+session.getValue("UserName")+"',olaftertime='"+DB.getTime()+"',olendtime='"+DateToString()+"' where olid='"+session.getId()+"'";
  stmt.executeUpdate(sql);
  }else
      {
    sql="insert into online(olid,olusername,olstarttime,olaftertime,olendtime,olip) ";

  if (session.getValue("UserName")==null)
  sql=sql+" values('"+session.getId()+"','客人','"+DB.getTime()+"','"+DB.getTime()+"','"+DateToString()+"','"+request.getRemoteAddr()+"')";
  else
  sql=sql+" values('"+session.getId()+"','"+session.getValue("UserName")+"','"+DB.getTime()+"','"+DB.getTime()+"','"+DateToString()+"','"+request.getRemoteAddr()+"')";
  //out.println(sql);
  stmt.executeUpdate(sql);

  }

  Time_Str=DateToString();
  Online_Time=Integer.parseInt(Time_Str);;
  Online_Time=Online_Time-60;
  sql="delete from online where olendtime<'"+Online_Time+"'";
  stmt.executeUpdate(sql);



  //out.println(Online_Time);
  sql="select olusername from online where olusername<>'客人' order by olendtime desc";
  rs=stmt.executeQuery(sql);
  rs.last();
  User_Num=rs.getRow();
  if (User_Num>0)
  {
   for (int i=1;i<=User_Num;i++)
      {

    UserName=rs.getString("olusername");
    User_List=User_List+"<a href=member.jsp?member="+UserName+">"+UserName+"</a>&nbsp;&nbsp";

    }
  }
 sql="select olusername from online where olusername='客人' order by olendtime desc";
  rs=stmt.executeQuery(sql);
  rs.last();
  Guest_Num=rs.getRow();

  if (Guest_Num>0)
  {
   for (int i=1;i<=Guest_Num;i++)
      {
        Guest_List=Guest_List+"客人&nbsp;&nbsp";

    }
  }
%>
<b><font color="#666666">線上人員- 目前有 <%=Guest_Num%> 位瀏覽者</font></b>
<%
    rs.close();
    stmt.close();
    con.close();
%>