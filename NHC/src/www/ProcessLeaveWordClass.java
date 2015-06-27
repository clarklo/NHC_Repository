package www;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.database.Operation;

public class ProcessLeaveWordClass {
	//	數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//類別對象
	private LeaveWordClass lclass;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;
	
	public ProcessLeaveWordClass() {
		op = null;
		sql = "";
		rs = null;
	    lclass = new LeaveWordClass();
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
	
	public void setLWC(LeaveWordClass lclass)
	{
		this.lclass=lclass;
	}
	
	public LeaveWordClass getLWC()
	{
		return lclass;
	}
	
	public LeaveWordClass getLeaveWordClass(ResultSet rs)
	{   LeaveWordClass  lclass = new LeaveWordClass();
		try
		{
			lclass.setL_class_id(rs.getString("l_class_id"));
			lclass.setL_class_name(rs.getString("l_class_name"));
			
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWordClass getLeaveWordClass():"+msg);
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
			System.out.println("ProcessLeaveWordClass addLeaveWordClass():"+msg);
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
			System.out.println("ProcessLeaveWordClass updateLeaveWordClass():"+msg);
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
			System.out.println("ProcessLeaveWordClass delLeaveWordClass(String []id):"+msg);
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
			System.out.println("ProcessLeaveWordClass delOneDate():"+msg);
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
				System.out.println("ProcessLeaveWordClass:LeaveWordIsExist():"+msg);
			}finally{
				
				op.closestmt();
				op.closeconn();
			}
			return status;
		}
	
	/**
	 * 獲得一個留言類別訊息
	 */
	
	public LeaveWordClass getOneDate(String id)
	{   
		LeaveWordClass lclass = new LeaveWordClass();
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
				//LeaveWordClass lclass = new LeaveWordClass();
				li.add(this.getLeaveWordClass(rs));
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessLeaveWordClass qurAllLeaveWordClass():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		return li;
	}
	
	
}

