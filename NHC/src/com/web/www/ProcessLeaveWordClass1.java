package com.web.www;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.database.Operation;

public class ProcessLeaveWordClass1 {
	//	數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//類別對象
	private LeaveWordClass1 lclass;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;
	
	public ProcessLeaveWordClass1() {
		op = null;
		sql = "";
		rs = null;
	    lclass = new LeaveWordClass1();
		msg = "";
		status = false;
	}
    
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public void setLWC(LeaveWordClass1 lclass)
	{
		this.lclass=lclass;
	}
	
	public LeaveWordClass1 getLWC()
	{
		return lclass;
	}
	
	public LeaveWordClass1 getLeaveWordClass(ResultSet rs)
	{   LeaveWordClass1  lclass = new LeaveWordClass1();
		try
		{
			lclass.setL_class_id(rs.getString("l_class_id"));
			lclass.setL_class_name(rs.getString("l_class_name"));
			
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWordClass1 getLeaveWordClass():"+msg);
		}
		return lclass;
	}
	
	/*
	 * 添加留言類別
	 */
	
	public void addLeaveWordClass()
	{
		try
		{
			op = new Operation();
			sql="insert into l_class set l_class_name='"+lclass.getL_class_name()+"'";
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessLeaveWordClass1 addLeaveWordClass():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * 修改留言類別
	 */
	
	public void updateLeaveWordClass()
	{
		try
		{
			op = new Operation();
			sql="update l_class set l_class_name='"+lclass.getL_class_name()+"' where l_class_id="+lclass.getL_class_id();
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWordClass1 updateLeaveWordClass():"+msg);
			status=true;
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * 刪除留言
	 */
	public void delLeaveWordClass(String []id)
	{
		try
		{
			op = new Operation();
			for(int i=0;i<id.length;i++)
			{
				sql="delete from l_class where l_class_id="+id[i];
				op.update(sql);
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessLeaveWordClass1 delLeaveWordClass(String []id):"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * 刪除單個留言類別
	 */
	
	public void delOneDate(String id)
	{
		try
		{
			op = new Operation();
			sql="delete from l_class where l_class_id="+id;
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWordClass1 delOneDate():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	 /**
	  * 判斷指定類別下的留言訊息是否存在，用於刪除類別時的判斷.
	  * @param id
	  */
		public boolean LeaveWordIsExist(String classid)
		{
			try
			{
				op = new Operation();
				sql="select * from leaveword where l_class_id="+classid;
				rs=op.query(sql);
				if(rs.next())
					status=true;
			}
			catch(SQLException e)
			{
				msg = e.getMessage();
				System.out.println("ProcessLeaveWordClass1:LeaveWordIsExist():"+msg);
			}finally{
				
				op.closestmt();
				op.closeconn();
			}
			return status;
		}
	
	/**
	 * 獲得一個留言類別訊息
	 */
	
	public LeaveWordClass1 getOneDate(String id)
	{   
		LeaveWordClass1 lclass = new LeaveWordClass1();
		try
		{
			op = new Operation();
			sql="select * from l_class where l_class_id="+id;
			rs=op.query(sql);
			if(rs.next())
				lclass=this.getLeaveWordClass(rs);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessLeaveWord getOneDate(String id):"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return lclass;
	}
	
	/**
	 * 獲得所有的留言類別訊息
	 */
	public List qurAllLeaveWordClass()
	{
		
		List li = new ArrayList();
		try
		{
			op = new Operation();
			sql="select * from l_class order by l_class_id desc";
			System.out.println("sql="+sql);
			rs=op.query(sql);
			while(rs.next())
			{
				//LeaveWordClass1 lclass = new LeaveWordClass1();
				li.add(this.getLeaveWordClass(rs));
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWordClass1 qurAllLeaveWordClass():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		return li;
	}
	
	
}

