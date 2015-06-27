package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 處理分類</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.database.Operation;

public class ProcessClassify {
	//數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//類別對象
	private Classify classify;
	//當前路徑編號
	private String currPathId;
	//當前路徑名稱
	private String currPathName;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;

	public ProcessClassify() {
		op = null;
		sql = "";
		rs = null;
		classify = new Classify();
		currPathId = "0";
		currPathName = "";
		msg = "";
		status = false;
	}

	public Classify getClassify() {
		return classify;
	}

	public String getCurrPathId() {
		return currPathId;
	}

	public String getCurrPathName() {
		return currPathName;
	}

	public String getMsg() {
		return msg;
	}

	public boolean isStatus() {
		return status;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}

	public void setCurrPathId(String currPathId) {
		this.currPathId = currPathId;
	}

	public void setCurrPathName(String currPathName) {
		this.currPathName = currPathName;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	/**
	 * 新建分類
	 */
	public void add() throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "INSERT cms_class(cms_class_name, cms_class_fatid, cms_class_pathid, cms_class_pathname, cms_class_orderid,cms_class_href,cms_class_isremoute, cms_class_isout) VALUES('"+classify.getName()+"',"+classify.getPid()+",'"+currPathId+"','"+currPathName+"',"+classify.getNum()+",'"+classify.getExternURL()+"',"+classify.getCommend()+","+classify.getIsOutputRSS()+")";
			op.update(sql);
			System.out.println(sql);
			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closeconn();
		}
	}
	/**
	 * 修改分類
	 */
	public void mod() throws Exception, SQLException{
		try{
			op = new Operation();
			sql = "UPDATE cms_class SET cms_class_name='"+classify.getName()+"', cms_class_orderid="+classify.getNum()+",cms_class_href='"+classify.getExternURL()+"',cms_class_isremoute="+classify.getCommend()+", cms_class_isout="+classify.getIsOutputRSS()+" WHERE cms_class_id="+classify.getId();
			op.update(sql);

			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closeconn();
		}
	}
	/**
	 * 刪除分類:本身及子孫以及所屬該類別的資源
	 */
	public void del(String path, int id) throws Exception, SQLException{
		try{
			op = new Operation();
			ResultSet rs1 = null;
			int id1 = 0;
			//欄目中的內容是否為空
			boolean isEmpty = true;
			//刪除子類
			sql = "SELECT * FROM cms_class WHERE cms_class_pathid LIKE '%::"+id+"::%' OR cms_class_id="+id+" ORDER BY cms_class_id DESC";
			rs = op.query(sql);

			while(rs.next()){
				id1 = rs.getInt("cms_class_id");
				sql = "SELECT * FROM cms_infodata WHERE cms_infodata_class="+id1;
				rs1 = op.query(sql);
				if(rs1.next()){
					isEmpty = false;//內容不為空
					break;
				}
			}
			if(isEmpty){
				sql = "SELECT * FROM cms_class WHERE cms_class_pathid LIKE '%::"+id+"::%' OR cms_class_id="+id+" ORDER BY cms_class_id DESC";
				rs = op.query(sql);
				while(rs.next()){
					id1 = rs.getInt("cms_class_id");
					//刪除欄目管理人員的權限
					sql = "DELETE FROM cms_permision WHERE cms_permision_claass="+id1;
					op.update(sql);

					//刪除類別HTML檔案
					rs1 = op.query("SELECT * FROM cms_html WHERE cms_html_class="+id1);
					path += "html" + File.separator;
					while(rs1.next()){
						File html = new File(path+rs1.getString("cms_html_file"));
						if(html.exists()){
	                         html.delete();
						 }
					}

					op.update("DELETE FROM cms_html WHERE cms_html_class="+id1);
				}
                //刪除類別
                sql = "DELETE FROM cms_class WHERE cms_class_pathid LIKE '%::" + id + "::%' OR cms_class_id="+id+"";
                op.update(sql);

                status = true;
            }
			else{
				msg = "此欄目的內容不為空,不能刪除此欄目!";
				status = false;
			}
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}
	/**
	 * 透過父類ID號獲得所有的子類
	 * @param fatid
	 * @return
	 */
	public List qurAllClassByfatid(String fatid)
	{
		List li = new ArrayList();
		try
		{
			op = new Operation();
			sql="select * from cms_class where cms_class_fatid="+fatid;
			rs=op.query(sql);
			while(rs.next())
			{
				Classify cf = new Classify();
				cf.setId(rs.getInt("cms_class_id"));
				cf.setCommend(rs.getInt("cms_class_isremoute"));
				cf.setPathName(rs.getString("cms_class_pathname"));
				cf.setPid(rs.getInt("cms_class_fatid"));
				cf.setIsOutputRSS(rs.getInt("cms_class_isremoute"));
				cf.setName(rs.getString("cms_class_name"));
				cf.setPathId(rs.getString("cms_class_pathid"));
				cf.setExternURL(rs.getString("cms_class_href"));
				cf.setNum(rs.getInt("cms_class_orderid"));
				li.add(cf);
			}
			status=true;	
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessClassify qurAllClassByfatid():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return li;
	}
	
	public Classify getOneDate(String id)
	{
		Classify cf = new Classify();
		try
		{
			op = new Operation();
			
			sql="select * from cms_class where cms_class_id="+id;
			rs=op.query(sql);
			if(rs.next())
			{
				
				cf.setId(rs.getInt("cms_class_id"));
				cf.setCommend(rs.getInt("cms_class_isremoute"));
				cf.setPathName(rs.getString("cms_class_pathname"));
				cf.setPid(rs.getInt("cms_class_fatid"));
				cf.setIsOutputRSS(rs.getInt("cms_class_isremoute"));
				cf.setName(rs.getString("cms_class_name"));
				cf.setPathId(rs.getString("cms_class_pathid"));
				cf.setExternURL(rs.getString("cms_class_href"));
				cf.setNum(rs.getInt("cms_class_orderid"));
			}
			status=true;
		}catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("ProcessClassify getOneDate():"+msg);
		}finally
		{
			op.closestmt();
			op.closeconn();
		}
		
		return cf;
	}
	
	public String queryNameByid(String classid)
	{
		op = new Operation();
		String name="";
		try
		{
			sql = "SELECT cms_class_name FROM cms_class WHERE  cms_class_id="+classid;
			rs = op.query(sql);
			if(rs.next())
			{
				name=rs.getString("cms_class_name");
			}

		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
		return name;
	}
}
