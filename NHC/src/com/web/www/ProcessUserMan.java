package com.web.www;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.web.database.Operation;
import com.web.util.MD5;

public class ProcessUserMan {

//	數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql; 
//	返回狀態
	private boolean status;
//	記錄集對象
	private ResultSet rs;
//	返回訊息
	private String msg;
	//會員對象
	private Userman userman;
	
	
	public ProcessUserMan()
	{
		
		op = null;
		sql = "";
		msg = "";
		status = false;
		userman=new Userman();
		
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Operation getOp() {
		return op;
	}

	public void setOp(Operation op) {
		this.op = op;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Userman getUserman() {
		return userman;
	}

	public void setUserman(Userman userman) {
		this.userman = userman;
	}
	
	public boolean isExist()
	{
		try{
			op = new Operation();
			sql="select * from user_man where user_man_loginname='"+userman.getUserManLoginName()+"'";
			rs = op.query(sql);

			if (rs.next()) {
				return true;
			}
			else {
				msg="您輸入的登錄名不對，請檢查後再輸入"; 
				return false;
			}
		}
		catch(SQLException e){
			msg=e.getMessage();
			System.out.println("isExist():"+msg);
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
		return false;
	}
	
	/**
	 * 添加會員
	 *
	 */
	public void addUserMan()
	{
		try
		{
			op=new Operation();
			sql="select * from user_man where user_man_loginname='"+userman.getUserManLoginName()+"'";
			rs=op.query(sql);
			if(!rs.next())
			{
			////mysql//##sql="insert into user_man set user_man_loginname='"+userman.getUserManLoginName()+
							////mysql//##"', user_man_name='"+userman.getUserManName()+"',user_man_sex='"+userman.getUserManSex()+"',user_man_age='"+
							////mysql//##userman.getUserManAge()+"',user_man_work='"+userman.getUserManWork()+"',user_man_mobile='"+
							////mysql//##userman.getUserManMobile()+"',user_man_email='"+userman.getUserManEmail()+
							////mysql//##"',user_man_bankcard='"+userman.getUserManBankcard()+"',user_man_password='"+userman.getUserManPassword()+"'";
							 //////
			sql="INSERT INTO user_man (user_man_loginname,user_man_name,user_man_sex,user_man_age,user_man_work,user_man_mobile,user_man_email,user_man_bankcard,user_man_password) VALUES ('"+userman.getUserManLoginName()+"','"+userman.getUserManName()+"','"+userman.getUserManSex()+"','"+userman.getUserManAge()+"','"+userman.getUserManWork()+"','"+ userman.getUserManMobile()+"','"+userman.getUserManEmail()+"','"+userman.getUserManBankcard()+"','"+userman.getUserManPassword()+"')";
			///// 
				op.update(sql);
				status=true;
				rs.close();
			}
			else
			{
				msg=userman.getUserManLoginName()+"已經存在,換個名字試試!";
				rs.close();
			}
		}
		catch(SQLException e)
		{
			msg=e.getMessage();
			System.out.println("addUserMan() error:"+msg);
		}finally{
			
			op.closeconn();
		}
		}
	
	/**
	 * 修改會員訊息
	 *
	 */
	public void updateUserMan()
	{
		try
		{
			op=new Operation();
			sql="update user_man set user_man_loginname='"+userman.getUserManLoginName()+
			"', user_man_name='"+userman.getUserManName()+"',user_man_sex='"+userman.getUserManSex()+"',user_man_age='"+
			userman.getUserManAge()+"',user_man_work='"+userman.getUserManWork()+"',user_man_mobile='"+
			userman.getUserManMobile()+"',user_man_email='"+userman.getUserManEmail()+
			"' where user_man_id="+userman.getUserManId();
			
			op.update(sql);
			System.out.println("修改會員訊息:sql:"+sql);
			status=true;
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("updateUserMan() error:"+msg);
		}finally{
			
			op.closeconn();
		}
		
		
	}
	
	/**
	 * 根據ID刪除會員訊息
	 * @param id
	 */
	public void delUserMan(String[] id)
	{
		try
		{
			op =new Operation();
			for(int i=0;i<id.length;i++)
			{
				sql="delete from user_man where user_man_id="+id[i];
				op.update(sql);
			}
			
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessUserMan delUserMan(String id):error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * 禁止登錄
	 *
	 */
	public void noLogin(String id)
	{
		try
		{
			op=new Operation();
			sql="update user_man set user_man_flag=0 where user_man_id="+id;
			System.out.println("sql:"+sql);
			op.update(sql);
			status=true;
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("noLogin() error:"+msg);
		}finally
		{
			op.closeconn();
		}
	}
	public void allowLogin(String id)
	{
		try
		{
			op=new Operation();
			sql="update user_man set user_man_flag=1 where user_man_id="+id;
			op.update(sql);
			status=true;
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("noLogin() error:"+msg);
		}finally
		{
			op.closeconn();
		}
	}
	/**
	 * 獲得一條會員記錄
	 *
	 */
	
	public void getOneDate(String id)
	{
		try
		{
			op=new Operation();
			sql="select * from user_man where user_man_id="+id;
			//System.out.println("sql:"+sql);
			System.out.println("會員記錄:sql:"+sql);
			rs=op.query(sql);
			if(rs.next())
			{
				userman.setUserManAge(rs.getString("user_man_age"));
			    userman.setUserManLoginName(rs.getString("user_man_loginname"));
				userman.setUserManEmail(rs.getString("user_man_email"));
				userman.setUserManFlag(rs.getString("user_man_flag"));
				userman.setUserManId(rs.getString("user_man_id"));
				userman.setUserManLastLogin(rs.getString("user_man_lastlogin"));
				userman.setUserManLogintimes(rs.getString("user_man_logintimes"));
				userman.setUserManMobile(rs.getString("user_man_mobile"));
				userman.setUserManName(rs.getString("user_man_name"));
				userman.setUserManSex(rs.getString("user_man_sex"));
				userman.setUserManWork(rs.getString("user_man_work"));
				userman.setManBankcard(rs.getString("user_man_bankcard"));
				status=true;
			}
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("getOneDate() error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	public String queryIdByLoginname(String loginname)
	{
		String id="";
		try
		{
			op=new Operation();
			sql="select user_man_id from user_man where user_man_loginname='"+loginname+"'";
			//System.out.println("sql:"+sql);
			rs=op.query(sql);
			if(rs.next())
			{
				id=rs.getString("user_man_id");
				status=true;
			}
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("queryIdByLoginname() error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		return id;
	}
	
	/**
	 * 檢查登錄
	 */
	public void checkLogin()
	{
		try
		{
			if(isExist())
			{
				 op = new Operation();
				  sql = "SELECT * FROM user_man WHERE (user_man_loginname='" +
				   userman.getUserManLoginName() + "') AND " +
				   "(user_man_password='" + userman.getUserManPassword() + "')";
			  
				  rs = op.query(sql);
				  if(rs.next())
				{
				   
				   	userman.setUserManId(rs.getString("user_man_id"));
					userman.setUserManLastLogin(rs.getString("user_man_lastlogin"));
					userman.setUserManLogintimes(rs.getString("user_man_logintimes"));
//					更新登錄時間，登錄次數
					   sql = "UPDATE user_man SET user_man_lastlogin=now(),user_man_logintimes=user_man_logintimes+1 WHERE user_man_id="+userman.getUserManId();
					   op.update(sql);
					status=true;
				}
			   else {
				  
				   //用戶密碼錯誤
				   status = false;
				   msg = userman.getUserManLoginName() + "的密碼錯誤或者您不允許登錄，請重新登錄﹗";
				   System.out.println(msg);
			   }

			}
		}
		catch(SQLException e)
		{
			msg=e.getMessage();
			System.out.println("checkLogin() error:"+msg);
		}finally{
			   
			   op.closestmt();
			   op.closeconn();
		   }
	}
	
	  /**
     * 修改密碼
     *
     */
    	public void modPassword(String id,String oldPassword,String newPassword)
    	{
    		try
    		{
	    		oldPassword = MD5.toMD5(oldPassword);
				newPassword = MD5.toMD5(newPassword);
				op = new Operation();
				sql = "SELECT * FROM user_man WHERE user_man_password='"+oldPassword+"' AND user_man_id="+id;
				
				rs = op.query(sql);
	
				if(rs.next())
				{
					sql = "UPDATE user_man SET user_man_password='" + newPassword + "' WHERE user_man_id=" + id;
					op.update(sql);
	
					status = true;
				}
				else
				{
					msg = "您輸入的舊密碼不正確,請重新輸入!";
					status = false;
				}
		}
		catch(Exception e){
			msg = e.getMessage();
			System.out.println("modPassword() error:"+msg);
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
    	}
    	  /**
         * 修改密碼
         *
         */
    	public void reSetPassword(String password,String email,String loginname){
    		try{
    	    		
    				password = MD5.toMD5(password);
    				op = new Operation();
    				sql = "update user_man set user_man_password='"+password+"'" +
    				" where user_man_email='"+email+"' and user_man_loginname='" +
    				loginname+"'";
    				op.update(sql);
    				status = true;
    		
    				
    		}
    		catch(Exception e){
    			msg = e.getMessage();
    			System.out.println("reSetPassword() error:"+msg);
    		}
    		finally{
    			op.closestmt();
    			op.closeconn();
    		}
        }

    
 /**
  * 審核
  *
  */
    public void check(String userid)
    {
    	try
    	{
    		op = new Operation();
    		sql="update user_man set user_man_flag=1 where user_man_id="+userid;
    		op.update(sql);
    		status=true;
    	}
    	catch(Exception e){
			msg = e.getMessage();
			System.out.println("check() error:"+msg);
		}
		finally{
			
			op.closeconn();
		}
    }
  
    
    public String queryLoginNameByid(String userid)
    {
    	String loginname="";
    	try
    	{
    		op = new Operation();
    		sql="select user_man_loginname where user_man_id="+userid;
    		rs=op.query(sql);
    		if(rs.next())
    		{
    			loginname=rs.getString(1);
    		}
    		status=true;
    	}
    	catch(Exception e){
			msg = e.getMessage();
			System.out.println("queryLoginNameByid() error:"+msg);
		}
		finally{
			
			op.closeconn();
		}
		return loginname;
    }

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}