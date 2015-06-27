package com.web.www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �B�z�޲z��</p>
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
	//�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//�޲z����H
	private Admin admin=new Admin();
	//��^�T��
	private String msg;
	//��^���A
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
	 * �ˬd�Τ�O�_�s�b,�p�G�s�b��^true,�_�h��^false
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
	* �Τ�n������Astatus��true,�h�O�X�k�Τ�,status��false�O�D�k�Τ�,�åBmsg���X�����\�����ܰT��
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
				   //�X�k�Τ�
				   //Ū���޲z�������T��
				   admin.setId(rs.getInt("cms_admin_id"));
				   admin.setName(rs.getString("cms_admin_name"));
				   admin.setPermission(rs.getString("cms_admin_auth"));
				   admin.setLastLogin(rs.getString("cms_admin_lastlogon"));
				   admin.setIsAdmin(rs.getInt("cms_admin_system"));
				   admin.setLogins(rs.getInt("cms_admin_times"));

				   //��s�n���ɶ�
				   sql = "UPDATE cms_admin SET cms_admin_lastlogon='" + GetDate.getStringDate()+ "',cms_admin_times=cms_admin_times+1 WHERE cms_admin_id="+admin.getId();
				   op.update(sql);

				   status = true;
			   }
			   else {
				   //�Τ�K�X���~
				   status = false;
				   msg = admin.getUsername() + "���K�X���~�A�Э��s�n���T";
			   }
		   }
		   else {
			   //�Τᤣ�s�b
			   status = false;
			   msg = "�藍�_�A�S��" + admin.getUsername() + "�T";
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
	 * �K�[�޲z��
	 */
	public void add() throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "SELECT * FROM cms_admin WHERE cms_admin_code='"+admin.getUsername()+"'";
			rs = op.query(sql);
			//�˴��Τ�W�O�_�s�b?
			if(!rs.next()){
				sql = "INSERT cms_admin(cms_admin_code, cms_admin_name, cms_admin_psw, cms_admin_auth, cms_admin_lastlogon, cms_admin_times, cms_admin_system) VALUES('" +
					admin.getUsername() + "','" + admin.getName() + "','" +
					admin.getPassword() + "','" + admin.getPermission() + "','" +
					admin.getLastLogin() + "',"+admin.getLogins()+","+admin.getIsAdmin()+")";
				op.update(sql);

				status = true;
			}
			else{
				msg = admin.getUsername()+"�w�s�b,�д��ӥΤ�W�ո�!";
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
	 * �ק�cms_admin_name,�K�X���v��
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
	 * �ק�K�X
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
				msg = "�z��J���±K�X�����T,�Э��s��J!";
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
	 * �R���޲z��
	 */
	public void del(int id) throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "DELETE FROM cms_admin WHERE cms_admin_id="+id;
			op.update(sql);

			//�R�����޲z������غ޲z�v��
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