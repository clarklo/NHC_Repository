package www;

import java.sql.ResultSet;

import com.web.database.*;
import java.io.*;
import java.util.List;
import java.util.ArrayList;

public class ProcessLeaveWord {

//	數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//類別對象
	private LeaveWord leaveword;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;
	
	public ProcessLeaveWord() {
		op = null;
		sql = "";
		rs = null;
	    leaveword = new LeaveWord();
		msg = "";
		status = false;
	}
    
	
	
	public LeaveWord getLeaveword() {
		return leaveword;
	}



	public void setLeaveword(LeaveWord leaveword) {
		this.leaveword = leaveword;
	}



	public LeaveWord getLeaveWord(ResultSet rs)
	{   LeaveWord l = new LeaveWord();
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
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWord getLeaveWord():"+msg);
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
			sql="insert into leaveword set l_title='"+leaveword.getL_title()+"'," +
				"l_content='"+leaveword.getL_content()+"',l_reply='"+leaveword.getL_reply()+"'," +
				"l_time=now(),l_email='"+leaveword.getL_email()+"',l_user='"+leaveword.getL_user()+"',l_class_id='"+leaveword.getL_class_id()+"'";
			System.out.println("addLeaveWord() sql="+sql);
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessLeaveWord addLeaveWord():"+msg);
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
			sql="update leaveword set l_title='"+leaveword.getL_title()+"',l_content='"+leaveword.getL_content()+"'," +
			"l_reply='"+leaveword.getL_reply()+"',l_replytime=now(),l_email='"+leaveword.getL_email()+"',l_user='"+leaveword.getL_user()+"',l_isreply='"+leaveword.getL_isreply()+"',l_class_id='"+leaveword.getL_class_id()+"' where l_id='"+leaveword.getL_id()+"'";
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWord updateLeaveWord():"+msg);
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
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessLeaveWord delLeaveWord(String []id):"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * 獲得一個留言訊息
	 */
	
	public LeaveWord getOneDate(String id)
	{   
		LeaveWord l = new LeaveWord();
		try
		{
			op = new Operation();
			sql="select * from leaveword where l_id="+id;
			rs=op.query(sql);
			if(rs.next())
				l=this.getLeaveWord(rs);
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
			sql="select * from leaveword where l_isreply=1";
			rs=op.query(sql);
			while(rs.next())
			{
				LeaveWord l = new LeaveWord();
				l=this.getLeaveWord(rs);
				li.add(l);
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWord qurAllLeaveWordByIsreply():"+msg);
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
			sql="select * from leaveword";
			rs=op.query(sql);
			while(rs.next())
			{
				LeaveWord l = new LeaveWord();
				l=this.getLeaveWord(rs);
				li.add(l);
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWord qurAllLeaveWord():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		return li;
	}
	
	
}

