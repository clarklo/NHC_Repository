package com.web.www;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.database.Operation;

public class ProcessLeaveWordClass1 {
	//	�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//���O��H
	private LeaveWordClass1 lclass;
	//��^�T��
	private String msg;
	//��^���A
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
	 * �K�[�d�����O
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
	 * �ק�d�����O
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
	 * �R���d��
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
	 * �R����ӯd�����O
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
	  * �P�_���w���O�U���d���T���O�_�s�b�A�Ω�R�����O�ɪ��P�_.
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
	 * ��o�@�ӯd�����O�T��
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
	 * ��o�Ҧ����d�����O�T��
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

