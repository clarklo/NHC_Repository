<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<div class="Member_c">
<ul>

<li>
<div class="memberBOX">
<div class="BOXleft">
  <img src="../images/layout_right_icon01.png" width="73" height="65" alt="加入會員圖片" /> </div>
<div class="BOXright">
<%
	HttpSession Session = request.getSession(true);
	String loginname=(String)Session.getAttribute("loginname");
	if("".equals(loginname)||loginname==null)
	{
%></br>
<h1>會員登入</h1>
<span><a href="../user/login.jsp">登入會員</a></span>
<span><a href="../user/regist.jsp">加入會員</a></span>
<%}else{%>
<span><%=loginname%> 歡迎您﹗</span>
<span><a href="../user/modpsw.jsp">更換密碼</a></span>
<span><a href="../user/moduser.jsp">修改個人資料</a></span>
<span><a href="../user/logout.jsp">登出</a></span>
<%}%>
</div>
</div>
</li>

<li>
<div class="memberBOX02">
<div class="BOXleft">
<img src="../images/layout_right_icon02.png" width="73" height="65" alt="線上預約" /></div>
<div class="BOXright">
<h1>線上預約</h1>
<span><a href="../services/support.jsp">如何預約</a></span>
<span><a href="../services/support2.jsp">美容醫學中心預約</a></span>
</div>
</div>
</li>

<li>
<div class="memberBOX03">
<div class="BOXleft">
<img src="../images/layout_right_icon03.png" width="73" height="65" alt="醫療項目" /></div>
<div class="BOXright">
<h1>醫療項目</h1>
<p>星期一~星期五 </p>
<p>AM8:00 ~ PM6:00  </p>  
<p>星期六 : AM8:00 ~ AM12:00</p>
<select class="select" name="theraphy" onchange="if(this.value!=''){window.location.assign(this.value);}" >
<option>= 請選擇醫療項目 =</option>
<option value="../navigation/showproduct.jsp?id=1154661702812">心臟血管中心</option>
<option value="../navigation/showproduct.jsp?id=1154661724984">植牙中心</option>
<option value="../navigation/showproduct.jsp?id=1154661797171">生殖醫學中心</option>
<option value="../navigation/showproduct.jsp?id=1154661998968">美容醫學中心</option>
<option value="../navigation/showproduct.jsp?id=1154661780859">骨科部</option>
<option value="../navigation/showproduct.jsp?id=1154662095281">健康管理中心</option>
<option value="../navigation/showproduct.jsp?id=1154661760312">銩雷射治療中心</option>
<option value="../navigation/showproduct.jsp?id=1155690083354">兒童心臟中心</option>
<option value="../navigation/showproduct.jsp?id=1154661972843">正子造影中心</option>
<option value="../navigation/showproduct.jsp?id=1154661917000">屈光雷射中心</option>
</select></div>
</div>
</li>
</ul>
</div>