package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �v����</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.sql.ResultSet;
import java.sql.SQLException;

import com.web.database.Operation;

public class Permission {
	//�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//���O�s��
	private int cid;
	//�޲z���s���M��
	private int mid[];
	//��^�T��
	private String msg;
	//��^���A
	private boolean status;

	public Permission() {
		op = null;
		sql = "";
		rs = null;
		cid = 0;
		mid = null;
	}

	public int getCid() {
		return cid;
	}

	public int[] getMid() {
		return mid;
	}

	public String getMsg() {
		return msg;
	}

	public boolean isStatus() {
		return status;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public void setMid(int[] mid) {
		this.mid = mid;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public void setPermission()throws SQLException{
		try{
			op = new Operation();

			sql = "DELETE FROM cms_permision WHERE cms_permision_claass=" + cid;
			op.update(sql);

			for (int i = 0; i < mid.length; i++) {
				if (mid[i] != 0) {
					sql = "DELETE FROM cms_permision WHERE cms_permision_aid="+mid[i] + " AND cms_permision_claass IN (SELECT cms_class_id FROM cms_class WHERE cms_class_pathid LIKE '%::"+cid+"::%')";
					op.update(sql);

					sql = "INSERT INTO cms_permision(cms_permision_claass, cms_permision_aid) VALUES(" + cid +
							", " + mid[i] + ")";
					op.update(sql);
				}
			}
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