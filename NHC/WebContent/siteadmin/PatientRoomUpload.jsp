<%@page import="java.nio.charset.Charset"%>
<%@page import="com.web.database.Operation"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.jspsmart.upload.*" %>


<%
//实例化 上载bean
com.jspsmart.upload.SmartUpload mySmartUpload=new com.jspsmart.upload.SmartUpload();
//初始化
mySmartUpload.initialize(pageContext);
//设置上载 的最大值
mySmartUpload.setMaxFileSize(500 * 1024*1024);
//上载文 件
mySmartUpload.upload();
    //取得别的参数
     String RoomID=(String)mySmartUpload.getRequest().getParameter("roomImgID");
 
//循环取得 所有上载的文件
for (int i=0;i<mySmartUpload.getFiles().getCount();i++){
//取得上载 的文件
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
if (!myFile.isMissing())
{

    
    //取得上载的文件的文件名
    String myFileName=myFile.getFileName();
    //取得不带后缀的文件名
    String  suffix=myFileName.substring(0,myFileName.lastIndexOf('.'));
    //取得后 缀名
    String  ext= mySmartUpload.getFiles().getFile(0).getFileExt(); 
    //取得文件 的大小
    int fileSize=myFile.getSize();
    //保存路径
    String filePath=getServletContext().getRealPath("/")+"/images/RoomImages/";
    String trace=filePath+RoomID + ".jpg";

    //将文件保存在服务器端
    myFile.saveAs(trace,mySmartUpload.SAVE_PHYSICAL);
}
}

//下面的是 将上载的文件保存到数据库中
// 将文件读到流中
//java.io.File file = new java.io.File(trace);
//java.io.FileInputStream fis = new java.io.FileInputStream(file);
//out.println(file.length());
//打开数 据库
//ResultSet result=null;
//String mSql=null;
//PreparedStatement prestmt=null;
//DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
//DbaObj.OpenConnection();
////将文件写 到数据库中
//mSql="insert into marklist (markname,password,marksize,markdate,MarkBody) values (?,?,?,?,?)";
//prestmt =DbaObj.Conn.prepareStatement(mSql);
//prestmt.setString(1, "aaa1");
//prestmt.setString(2, "0000");
//prestmt.setInt(3, fileSize);
//prestmt.setString(4, DbaObj.GetDateTime());
//prestmt.setBinaryStream(5,fis,(int)file.length());
//DbaObj.Conn.setAutoCommit(true) ;
//prestmt.executeUpdate();
//DbaObj.Conn.commit();
//out.println(("上载成功！！！").toString());
//}
//else
//{ out.println(("上载失败！！！").toString()); }
//}//与前面的if对应
%> 
<script language="javascript">
<!-- 
    alert("修改成功");
    window.location.replace("PatientRoomAdmin.jsp");
-->
</script>
 
