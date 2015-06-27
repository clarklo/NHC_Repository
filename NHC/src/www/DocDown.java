package www;

public class DocDown {
    
	//文檔下載的ID號
	private String down_id;
	//文檔的標題
	private String down_title;
	//文檔的名稱
	private String down_document;
    //文檔所屬欄目
	private String down_flag;
	
	
	public String  getDown_id()
	{
		return down_id;
	}
	
	public void setDown_id(String down_id)
	{
		this.down_id=down_id;
	}
	
	public String getDown_title()
	{
		return down_title;
	}
	
	public void setDown_title(String down_title)
	{
		this.down_title=down_title;
	}
	
	public String getDown_document()
	{
		return down_document;
	}
	
	public void setDown_document(String down_document)
	{
		this.down_document=down_document;
	}
	
	public String getDown_flag()
	{
		return down_flag;
	}
	
	public void setDown_flag(String down_flag)
	{
		this.down_flag=down_flag;
	}
	
}