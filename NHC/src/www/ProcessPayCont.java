package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 處理友情鏈接</p>
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

public class ProcessPayCont {
	//數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//友情鏈接對象
	private PayCont payCont;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;

    public ProcessPayCont() {
		op = null;
		sql = "";
		rs = null;
		msg = "";
		status = false;
    }

    public PayCont getPayCont() {
        return payCont;
    }

    public void setPayCont(PayCont payCont) {
        this.payCont = payCont;
    }

 

    public String getMsg() {
        return msg;
    }

    public boolean isStatus() {
        return status;
    }

 

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

	/**
	 *添加友情鏈接
	 */
	public void add() throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			//sql = "INSERT INTO cms_link (cms_link_type, cms_link_site, cms_link_url, cms_link_logo, cms_link_info, cms_link_commendsite, cms_link_check, cms_link_checkman) VALUES (" + friendSite.getType() + ",'"+friendSite.getName()+"', '" + friendSite.getUrl() + "', '" + friendSite.getLogo() + "', '" + friendSite.getIntroduce() + "', "+friendSite.getCommend()+", "+friendSite.getCheck()+", '" + friendSite.getUsername() + "')";
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
	 * 修改友情鏈接
	 */
	public void mod() throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			//sql = "UPDATE cms_link SET cms_link_type=" + friendSite.getType() + ", cms_link_site='" + friendSite.getName() + "', cms_link_url='" + friendSite.getUrl() + "', cms_link_logo='" + friendSite.getLogo() + "',cms_link_info='"+friendSite.getIntroduce()+"', cms_link_commendsite="+friendSite.getCommend()+", cms_link_check="+friendSite.getCheck()+", cms_link_checkman='"+friendSite.getUsername()+"' WHERE cms_link_id="+friendSite.getId();
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
	 * 刪除友情鏈接
	 */
	public void del(int id) throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "DELETE FROM PayCont WHERE pay_id="+id;
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