
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.jspsmart.upload.*" %>

<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.jspsmart.upload.*" %>

<%
//ʵ���� ����bean
com.jspsmart.upload.SmartUpload mySmartUpload=new com.jspsmart.upload.SmartUpload();
//��ʼ��
mySmartUpload.initialize(pageContext);
//�������� �����ֵ
mySmartUpload.setMaxFileSize(500 * 1024*1024);
//������ ��
mySmartUpload.upload();
//ѭ��ȡ�� �������ص��ļ�
for (int i=0;i<mySmartUpload.getFiles().getCount();i++){
//ȡ������ ���ļ�
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
if (!myFile.isMissing())
{
//ȡ�����ص��ļ����ļ���
String myFileName=myFile.getFileName();
//ȡ�ò�����׺���ļ���
String  suffix=myFileName.substring(0,myFileName.lastIndexOf('.'));
//ȡ�ú� ׺��
String  ext= mySmartUpload.getFiles().getFile(0).getFileExt(); 
//ȡ���ļ� �Ĵ�С
int fileSize=myFile.getSize();
//����·��
String aa=getServletContext().getRealPath("/")+"upload\\";
String trace=aa+myFileName;
//ȡ�ñ�Ĳ���
String explain=(String)mySmartUpload.getRequest().getParameter("text");
String send=(String)mySmartUpload.getRequest().getParameter("send");
//���ļ������ڷ�������
myFile.saveAs(trace,mySmartUpload.SAVE_PHYSICAL);
//������� �����ص��ļ����浽���ݿ���
// ���ļ���������
java.io.File file = new java.io.File(trace);
java.io.FileInputStream fis = new java.io.FileInputStream(file);
out.println(file.length());
//���� �ݿ�
ResultSet result=null;
String mSql=null;
PreparedStatement prestmt=null;
//DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
//DbaObj.OpenConnection();
////���ļ�д �����ݿ���
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
out.println(("���سɹ�������").toString());
}
else
{ out.println(("����ʧ�ܣ�����").toString()); }
}//��ǰ���if��Ӧ
%> 
