package com.web.www;

import java.sql.ResultSet;

import com.web.database.*;
import java.io.*;
import java.util.List;
import java.util.ArrayList;

public class ProcessLeaveWord1 {

//	數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//類別對象
	private LeaveWord1 leaveword;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;
	
	public ProcessLeaveWord1() {
		op = null;
		sql = "";
		rs = null;
	    leaveword = new LeaveWord1();
		setMsg("");
		setStatus(false);
	}
    
	
	
	public LeaveWord1 getLeaveword() {
		return leaveword;
	}



	public void setLeaveword(LeaveWord1 leaveword) {
		this.leaveword = leaveword;
	}



	public LeaveWord1 getLeaveWord(ResultSet rs)
	{   LeaveWord1 l = new LeaveWord1();
		try
		{
			leaveword.setL_content(rs.getString("l_content"));
			leaveword.setL_email(rs.getString("l_email"));
			leaveword.setL_id(rs.getString("l_id"));
			leaveword.setL_isreply(rs.getString("l_isreply"));
			leaveword.setL_reply(rs.getString("l_reply"));
			leaveword.setL_replytime(rs.getString("l_replytime"));
			leaveword.setL_time(rs.getString("l_time"));
			leaveword.setL_title(rs.getString("l_title"));
			leaveword.setL_user(rs.getString("l_user"));
			leaveword.setL_class_id(rs.getString("l_class_id"));
			leaveword.setUser_company(rs.getString("user_company"));
			leaveword.setUser_sex(rs.getString("user_sex"));
			leaveword.setUser_tel(rs.getString("user_tel"));
			
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			System.out.println("ProcessLeaveWord1 getLeaveWord():"+getMsg());
		}
		return leaveword;
	}
	
	/*
	 * 添加留言
	 */
	
	public void addLeaveWord()
	{
		try
		{
			op = new Operation();
			//////"sql="insert into leaveword1 set l_title='"+leaveword.getL_title()+"'," +
				//////"l_content='"+leaveword.getL_content()+"',l_reply='"+leaveword.getL_reply()+"'," +
				//////"l_time=now(),l_email='"+leaveword.getL_email()+"',l_user='"+leaveword.getL_user()+"',"+
				//////"l_class_id='"+leaveword.getL_class_id()+"',user_company='"+leaveword.getUser_company()+"',user_sex='"+leaveword.getUser_sex()+"',user_tel='"+leaveword.getUser_tel()+"'";
				//////
			sql="INSERT INTO leaveword1 ( l_title,l_content,l_reply,l_time,l_email,l_user,user_sex,user_company,user_tel) VALUES ('"+leaveword.getL_title()+"','"+leaveword.getL_content()+"','"+leaveword.getL_reply()+"',current timestamp,'"+leaveword.getL_email()+"','"+leaveword.getL_user()+"','"+leaveword.getUser_sex()+"','"+leaveword.getUser_company()+"','"+leaveword.getUser_tel()+"')";

			/////
			System.out.println("addLeaveWord() sql="+sql);
			op.update(sql);
			setStatus(true);
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			setStatus(true);
			System.out.println("ProcessLeaveWord1 addLeaveWord():"+getMsg());
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * 修改留言
	 */
	
	public void updateLeaveWord()
	{
		try
		{
			op = new Operation();
			sql="update leaveword1 set l_title='"+leaveword.getL_title()+"',l_content='"+leaveword.getL_content()+"'," +
			"l_reply='"+leaveword.getL_reply()+"',l_replytime=now(),l_email='"+leaveword.getL_email()+"',l_user='"+leaveword.getL_user()+"',l_isreply='"+leaveword.getL_isreply()+"',l_class_id='"+leaveword.getL_class_id()+"' where l_id='"+leaveword.getL_id()+"'";
			op.update(sql);
			setStatus(true);
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			System.out.println("ProcessLeaveWord1 updateLeaveWord():"+getMsg());
			setStatus(true);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * 刪除留言
	 */
	public void delLeaveWord(String []id)
	{
		try
		{
			op = new Operation();
			for(int i=0;i<id.length;i++)
			{
				sql="delete from leaveword where l_id="+id[i];
				op.update(sql);
			}
			setStatus(true);
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			setStatus(true);
			System.out.println("ProcessLeaveWord1 delLeaveWord(String []id):"+getMsg());
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * 獲得一個留言訊息
	 */
	
	public LeaveWord1 getOneDate(String id)
	{   
		LeaveWord1 l = new LeaveWord1();
		try
		{
			op = new Operation();
			sql="select * from leaveword1 where l_id="+id;
			rs=op.query(sql);
			if(rs.next())
				l=this.getLeaveWord(rs);
			setStatus(true);
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			setStatus(true);
			System.out.println("ProcessLeaveWord1 getOneDate(String id):"+getMsg());
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return l;
	}
	
	/**
	 * 獲得所有的已經回複的留言訊息
	 */
	public List qurAllLeaveWordByIsreply()
	{
		
		List li = new ArrayList();
		try
		{
			op = new Operation();
			sql="select * from leaveword1 where l_isreply=1";
			rs=op.query(sql);
			while(rs.next())
			{
				LeaveWord1 l = new LeaveWord1();
				l=this.getLeaveWord(rs);
				li.add(l);
			}
			setStatus(true);
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			System.out.println("ProcessLeaveWord1 qurAllLeaveWordByIsreply():"+getMsg());
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		return li;
	}
	
	/**
	 * 獲得所有的留言訊息
	 */
	public List qurAllLeaveWord()
	{
		
		List li = new ArrayList();
		try
		{
			op = new Operation();
			sql="select * from leaveword1";
			rs=op.query(sql);
			while(rs.next())
			{
				LeaveWord1 l = new LeaveWord1();
				l=this.getLeaveWord(rs);
				li.add(l);
			}
			setStatus(true);
		}catch(Exception e)
		{
			setMsg(e.getMessage());
			System.out.println("ProcessLeaveWord1 qurAllLeaveWord():"+getMsg());
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		return li;
	}



	public boolean isStatus() {
		return status;
	}



	public void setStatus(boolean status) {
		this.status = status;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}

