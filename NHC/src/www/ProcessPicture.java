package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �B�z�Ϥ�JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.web.database.Operation;

public class ProcessPicture {
	//�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//���i��H
	private Picture picture;
	//��^�T��
	private String msg;
	//��^���A
	private boolean status;

    public ProcessPicture() {
		op = null;
		sql = "";
		rs = null;
		picture = new Picture();
		msg = "";
		status = false;
    }

    public String getMsg() {
        return msg;
    }

    public Picture getPicture() {
        return picture;
    }

    public boolean isStatus() {
        return status;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

	/**
	 *�K�[�Ϥ�
	 */
	public void add() throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "INSERT INTO cms_img (cms_img_url, cms_img_info, cms_img_class) VALUES ('"+picture.getFile()+"','" + picture.getCid() + "',"+picture.getType()+")";
			op.update(sql);
			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closeconn();
		}
	}

	/**
	 * �ھڤ峹ID����o�Ϥ��W��
	 */
	
	public String qurPicUrlByImgInfo(String id)
	{
		String url="";
		try
		{
			op = new Operation();
			sql="select cms_img_url from cms_img where cms_img_info="+id;
			System.out.println("sql="+sql);
			rs=op.query(sql);
			if(rs.next())
				url=rs.getString("cms_img_url");
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessPicture qurPicUrlByImgInfo():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return url;
	}
	
	/**
	 * �R���Ϥ�
	 */
	public void del(String path, String id, int type) throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "SELECT * FROM cms_img WHERE cms_img_info='"+id+"' AND cms_img_class="+type;
			rs = op.query(sql);
			//�R���Ϥ��ɮ�
			String file = "";
			File image = null;
			while(rs.next()){
				file = rs.getString("cms_img_url");
				image = new File(path + "upload" + java.io.File.separator + "images" + java.io.File.separator +file);
				if(image.exists()){
					image.delete();
				}
			}
			sql = "DELETE FROM cms_img WHERE cms_img_info='"+id+"' AND cms_img_class="+type;
			op.update(sql);
			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}
}