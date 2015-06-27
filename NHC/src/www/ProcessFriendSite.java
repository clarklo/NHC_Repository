package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �B�z�ͱ��챵</p>
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

public class ProcessFriendSite {
	//�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//�ͱ��챵��H
	private FriendSite friendSite;
	//��^�T��
	private String msg;
	//��^���A
	private boolean status;

    public ProcessFriendSite() {
		op = null;
		sql = "";
		rs = null;
		friendSite = new FriendSite();
		msg = "";
		status = false;
    }

    public FriendSite getFriendSite() {
        return friendSite;
    }

    public String getMsg() {
        return msg;
    }

    public boolean isStatus() {
        return status;
    }

    public void setFriendSite(FriendSite friendSite) {
        this.friendSite = friendSite;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

	/**
	 *�K�[�ͱ��챵
	 */
	public void add() throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "INSERT INTO cms_link (cms_link_type, cms_link_site, cms_link_url, cms_link_logo, cms_link_info, cms_link_commendsite, cms_link_check, cms_link_checkman) VALUES (" + friendSite.getType() + ",'"+friendSite.getName()+"', '" + friendSite.getUrl() + "', '" + friendSite.getLogo() + "', '" + friendSite.getIntroduce() + "', "+friendSite.getCommend()+", "+friendSite.getCheck()+", '" + friendSite.getUsername() + "')";
			System.out.println(sql);
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
	 * �ק�ͱ��챵
	 */
	public void mod() throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "UPDATE cms_link SET cms_link_type=" + friendSite.getType() + ", cms_link_site='" + friendSite.getName() + "', cms_link_url='" + friendSite.getUrl() + "', cms_link_logo='" + friendSite.getLogo() + "',cms_link_info='"+friendSite.getIntroduce()+"', cms_link_commendsite="+friendSite.getCommend()+", cms_link_check="+friendSite.getCheck()+", cms_link_checkman='"+friendSite.getUsername()+"' WHERE cms_link_id="+friendSite.getId();
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
	 * �R���ͱ��챵
	 */
	public void del(int id) throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "DELETE FROM cms_link WHERE cms_link_id="+id;
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
}