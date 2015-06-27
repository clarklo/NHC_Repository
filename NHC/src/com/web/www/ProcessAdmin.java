package com.web.www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 處理管理員</p>
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
import com.web.util.GetDate;
import com.web.util.MD5;

public class ProcessAdmin {
	//數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//管理員對象
	private Admin admin=new Admin();
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;

	public ProcessAdmin() {
		op = null;
		sql = "";
		rs = null;
		admin = new Admin();
		msg = "";
		status = false;
	}

	public Admin getAdmin() {
		return admin;
	}

	public String getMsg() {
		return msg;
	}

	public boolean isStatus() {
		return status;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	/**
	 * 檢查用戶是否存在,如果存在返回true,否則返回false
	 */
	private boolean checkExist() throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();
			sql = "SELECT cms_admin_code FROM cms_admin WHERE cms_admin_code='" + admin.getUsername() +"'";
			rs = op.query(sql);

			if (rs.next()) {
				return true;
			}
			else {
				return false;
			}
		}
		catch(SQLException e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
		return false;
   }

   /**
	* 用戶登錄驗証，status為true,則是合法用戶,status為false是非法用戶,並且msg給出不成功的提示訊息
	*/
   public void  checkLogin() throws ClassNotFoundException, SQLException{
	   try{
		   if (checkExist()) {
			   op = new Operation();
			   sql = "SELECT * FROM cms_admin WHERE (cms_admin_code='" +
				   admin.getUsername()+ "') AND " +
				   "(cms_admin_psw='" + admin.getPassword() + "')";
			   rs = op.query(sql);

			   if (rs.next()) {
				   //合法用戶
				   //讀取管理員相關訊息
				   admin.setId(rs.getInt("cms_admin_id"));
				   admin.setName(rs.getString("cms_admin_name"));
				   admin.setPermission(rs.getString("cms_admin_auth"));
				   admin.setLastLogin(rs.getString("cms_admin_lastlogon"));
				   admin.setIsAdmin(rs.getInt("cms_admin_system"));
				   admin.setLogins(rs.getInt("cms_admin_times"));

				   //更新登錄時間
				   sql = "UPDATE cms_admin SET cms_admin_lastlogon='" + GetDate.getStringDate()+ "',cms_admin_times=cms_admin_times+1 WHERE cms_admin_id="+admin.getId();
				   op.update(sql);

				   status = true;
			   }
			   else {
				   //用戶密碼錯誤
				   status = false;
				   msg = admin.getUsername() + "的密碼錯誤，請重新登錄﹗";
			   }
		   }
		   else {
			   //用戶不存在
			   status = false;
			   msg = "對不起，沒有" + admin.getUsername() + "﹗";
		   }
	   }
	   catch(SQLException e){
		   msg = e.getMessage();
	   }
	   finally{
		   System.out.println("status:"+status);
		   op.closestmt();
		   op.closeconn();
	   }
	   
	}
	/**
	 * 添加管理員
	 */
	public void add() throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "SELECT * FROM cms_admin WHERE cms_admin_code='"+admin.getUsername()+"'";
			rs = op.query(sql);
			//檢測用戶名是否存在?
			if(!rs.next()){
				sql = "INSERT cms_admin(cms_admin_code, cms_admin_name, cms_admin_psw, cms_admin_auth, cms_admin_lastlogon, cms_admin_times, cms_admin_system) VALUES('" +
					admin.getUsername() + "','" + admin.getName() + "','" +
					admin.getPassword() + "','" + admin.getPermission() + "','" +
					admin.getLastLogin() + "',"+admin.getLogins()+","+admin.getIsAdmin()+")";
				op.update(sql);

				status = true;
			}
			else{
				msg = admin.getUsername()+"已存在,請換個用戶名試試!";
				status = false;
			}
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * 修改cms_admin_name,密碼及權限
	 */
	public void mod(String password) throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "SELECT * FROM cms_admin WHERE cms_admin_id="+admin.getId();
			rs = op.query(sql);
			rs.next();
			String oldPassword = rs.getString("cms_admin_psw");

			if(!password.equals(oldPassword)){
				sql = "UPDATE cms_admin SET cms_admin_name='" + admin.getName() + "', cms_admin_psw='" +
					admin.getPassword() + "',cms_admin_auth='" + admin.getPermission() +
					"',cms_admin_system="+admin.getIsAdmin()+" WHERE cms_admin_id=" + admin.getId();
			}
			else{
				sql = "UPDATE cms_admin SET cms_admin_name='" + admin.getName() + "', cms_admin_auth='" + admin.getPermission() +
					"',cms_admin_system="+admin.getIsAdmin()+" WHERE cms_admin_id=" + admin.getId();

			}
			op.update(sql);

			if((admin.getIsAdmin() ==1) || (admin.getPermission().charAt(2) == 'N')){
				sql = "DELETE FROM cms_permision WHERE cms_admin_id=" + admin.getId();
				op.update(sql);
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
	/**
	 * 修改密碼
	 */
	public void modPassword(int id, String oldPassword, String newPassword) throws Exception, SQLException{
		try{
			oldPassword = MD5.toMD5(oldPassword);
			newPassword = MD5.toMD5(newPassword);
			op = new Operation();
			sql = "SELECT * FROM cms_admin WHERE cms_admin_psw='"+oldPassword+"' AND cms_admin_id="+id;
			rs = op.query(sql);

			if(rs.next()){
				sql = "UPDATE cms_admin SET cms_admin_psw='" + newPassword + "' WHERE cms_admin_id=" + id;
				op.update(sql);

				status = true;
			}
			else{
				msg = "您輸入的舊密碼不正確,請重新輸入!";
				status = false;
			}
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * 刪除管理員
	 */
	public void del(int id) throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "DELETE FROM cms_admin WHERE cms_admin_id="+id;
			op.update(sql);

			//刪除此管理員的欄目管理權限
			sql = "DELETE FROM cms_permision WHERE cms_admin_id="+id;
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