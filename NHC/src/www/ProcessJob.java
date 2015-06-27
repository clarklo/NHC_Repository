package www;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.database.Operation;
public class ProcessJob {
	
//	�ƾڮw�ާ@��H
	private Operation op;
	//SQL�y�y
	private String sql;
	//�O������H
	private ResultSet rs;
	//�x�H¾���H
	private Job job;
	//��^�T��
	private String msg;
	//��^���A
	private boolean status;
	
    public Job getJob()
    {
    	return job;
    }
    public void setJob(Job job)
    {
    	this.job=job;
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
    
	public ProcessJob()
	{
		op=null;
		sql="";
		rs=null;
		msg="";
		status=false;
	}
	
	public Job getJobByRs(ResultSet rs)
	{
		try
		{
			job.setJobId(rs.getString("job_id"));
			job.setJobName(rs.getString("job_name"));
			job.setJobDemand(rs.getString("job_demand"));
			job.setJoBDate(rs.getString("job_date"));
			job.setJobNumber(rs.getString("job_number"));
		}catch(SQLException e)
		{
			msg=e.getMessage();
			System.out.println("ProcessJob getJob(ResultSet rs):error:"+msg);
		}
		
		return job;
	
	}
	
    /**
     * �K�[¾��
     *
     */
	
	public void addJob()
	{
		try
		{
			op = new Operation();
			sql="insert into job set job_name='"+job.getJobName()+"',job_demand='"+job.getJobDemand()+"',job_date=now(),job_number='"+job.getJobNumber()+"'";
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessJob addJob:error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * �ק�¾��
	 */
	
	public void updateJob()
	{
		try
		{
			op = new Operation();
			sql="update job set job_name='"+job.getJobName()+"',job_demand='"+job.getJobDemand()+"',job_date=now(),job_number='"+job.getJobNumber()+"' where job_id="+job.getJobId();
			System.out.println("ProcessJob updateJob():sql="+sql);
			op.update(sql);
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessJob updateJob():error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * �R��¾��
	 */
	
	public void delJob(String []id)
	{
		try
		{
			op = new Operation();
			for(int i=0;i<id.length;i++)
			{
				sql="delete from job where job_id="+id[i];
				op.update(sql);
				status=true;
			}
			
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessJob updateJob(String []id):error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * ��o�@�Ӽx�H¾��
	 */
	
	public void getOneDate(String id)
	{
		try
		{
			op = new Operation();
			sql="select from job where job_id="+id;
			rs=op.query(sql);
			if(rs.next())
				this.getJobByRs(rs);
			rs.close();
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			status=true;
			System.out.println("ProcessJob getOneDate(String id):error:"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
	}
	
	/**
	 * ��o�Ҧ����x�H¾��
	 */
	
	public List qurAllJob()
	{
		List li = new ArrayList();
		try
		{
			op = new Operation();
			sql="select * from job ";
			rs=op.query(sql);
			while(rs.next())
			{
				Job job = new Job();
				job=this.getJobByRs(rs);
				li.add(job);
			}
			rs.close();
			status=true;
		}catch(Exception e)
		{
			msg= e.getMessage();
			status=true;
			System.out.println("ProcessJob qyrAllJob():error:"+msg);
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