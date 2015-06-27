package www;

public class Job {
    
	//職位ID
	private String Job_id;
	//職位名稱
	private String Job_name;
	//職位要求
	private String Job_demand;
	//職位發表日期
	private String Job_date;
    //職位所招人數
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