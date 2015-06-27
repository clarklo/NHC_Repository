package www;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.database.Operation;

public class ProcessDocDown {

//	�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//�ɮ׹�H
	private DocDown download;
	//��^�T��
	private String msg;
	//��^���A
	private boolean status;

    public ProcessDocDown() {
		op = null;
		sql = "";
		rs = null;
		download = new DocDown();
		msg = "";
		status = false;
    }

    public DocDown getDocDown() {
        return download;
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

	public void setDocDown(DocDown download)
	{
		this.download=download;
	}
	
	/**
	 * �����G����o�ɮפU��
	 */
	
	public DocDown getDocDownByRs(ResultSet rs)
	{
		try
		{
			download.setDown_id(rs.getString("down_id"));
			download.setDown_title(rs.getString("down_title"));
			download.setDown_document(rs.getString("down_document"));
			download.setDown_flag(rs.getString("down_flag"));
		}catch(SQLException e)
		{
			msg=e.getMessage();
			System.out.println("ProcessDocDown getDocDownByRs(ResultSet rs):"+msg);
		}
		
		return download;
	}
	
	/**
	 * �K�[�U�����ɮ�
	 */
	
	public void addDocDown()
	{
		try
		{
			op = new Operation();
			sql="insert into down set down_title='"+download.getDown_title()+"',down_document='"+download.getDown_document()+"',down_flag='"+download.getDown_flag()+"'";
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown addDocDown():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * �ק���ɤU��
	 */
	public void updateDocDown()
	{
		try
		{
			op = new Operation();
			sql="update down set down_title='"+download.getDown_title()+"',down_document='"+download.getDown_document()+"',down_flag='"+download.getDown_flag()+"' where down_id="+download.getDown_id();
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown updateDocDown():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	public void updateDocDownNoDoc()
	{
		try
		{
			op = new Operation();
			sql="update down set down_title='"+download.getDown_title()+"',down_flag='"+download.getDown_flag()+"' where down_id="+download.getDown_id();
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown updateDocDownNoDoc():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * �R�����ɤU��
	 */
	public void delDocDown(String[] id)
	{
		try
		{
			op = new Operation();
			for(int i=0;i<id.length;i++)
			{
				sql="delete from down where down_id="+id[i];
				op.update(sql);
				
			}
			status=true;
			
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown delDocDown(String[] id):"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * ��o�@�ӤU��������
	 */
	
	public void  getOneDate(String id)
	{
		try
		{
			op = new Operation();
			sql="select * from down where down_id="+id;
			rs=op.query(sql);
			if(rs.next())
				this.getDocDownByRs(rs);
			status=true;
		}catch(Exception  e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown getOneDate(String id)"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
	}
	
	/**
	 * ��o�Ҧ������ɤU���M��
	 */
	
	public List qurAllDocDown()
	{
		List li = new ArrayList();
		try
		{
			op = new Operation();
			DocDown download = new DocDown();
			sql="select * from down";
			rs=op.query(sql);
			while(rs.next())
			{
				download=this.getDocDownByRs(rs);
				li.add(download);
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown qurAllDocDown():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return li;
	}
	
	public List quryDocDownByCid(String cid)
	{
		List li = new ArrayList();
		try
		{
			op = new Operation();
			DocDown download = new DocDown();
			sql="select * from down where down_flag="+cid;
			//System.out.println("sql:"+sql);
			rs=op.query(sql);
			while(rs.next())
			{
				download.setDown_id(rs.getString("down_id"));
				download.setDown_title(rs.getString("down_title"));
				download.setDown_document(rs.getString("down_document"));
				download.setDown_flag(rs.getString("down_flag"));
				li.add(download);
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessDocDown quryDocDownByCid():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return li;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}