package www;

public class Job {
    
	//¾��ID
	private String Job_id;
	//¾��W��
	private String Job_name;
	//¾��n�D
	private String Job_demand;
	//¾��o����
	private String Job_date;
    //¾��ҩۤH��
	private String Job_number;
	
	public String getJobId()
	{
		return Job_id;
	}
	
	public void setJobId(String job_id)
	{
		this.Job_id=job_id;
	}
	
	public String getJobName()
	{
		return Job_name;
	}
	
	public void setJobName(String job_name)
	{
		this.Job_name=job_name;
	}
	
	public String getJobDemand()
	{
		return Job_demand;
	}
	
	public void setJobDemand(String job_demand)
	{
		this.Job_demand=job_demand;
	}
	
	public String getJobDate()
	{
		return Job_date;
	}
	
	public void setJoBDate(String job_date)
	{
		this.Job_date=job_date;
	}
	
	public String getJobNumber()
	{
		return Job_number;
	}
	
	public void setJobNumber(String job_number)
	{
		this.Job_number=job_number;
	}

}