/**
 * だ陪ボ
 * 把计page(pageRows,strSql);
 * 		pageRows–陪ボ︽计
 * 		strSql琩高じ﹃"select * from card where i='1'"
 * 		public Vector getData(String pages);莉材计pages┮Τ计沮
 * 		public int getMaxpage()羆计
 */	
package util;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Vector;

import com.web.database.Operation;

public class page {
	
	private int maxpage;//Τぶ
	private int maxrowcount;//Τぶ︽癘魁
	private int rowsperpage=3;//–ぶ︽
	
	private Vector v=new Vector();//纗挡狦
	private Operation Sql;
	private String strSql;
	
	/**﹍て–︽计㎝琩高粂*/
	//slect * from table where r='0';
	public page(int rowsperpage,String strSql){
		this.rowsperpage=rowsperpage;
		this.strSql=strSql;
		Sql=new Operation();
		try{
			init();
		}catch(Exception e){
			System.err.println("page:page()  "+e.toString());
			e.printStackTrace();
		}
	}
	
	private void init()throws Exception{
		//﹍て眔程癘魁计程计
		maxrowcount=getmaxRowscount();
		countMaxPage();
	}

	public  int getmaxRowscount()
	{
		int getrow=0;
		String countQuery="";
		if(strSql.indexOf(" from ")!=-1)
			countQuery=strSql.substring(strSql.indexOf(" from "),strSql.length());
		else if(strSql.indexOf(" FROM ")!=-1)
			countQuery=strSql.substring(strSql.indexOf(" FROM "),strSql.length());
		ResultSet rs=null;
		try
		{
			rs=Sql.query("select count(*) "+countQuery);
			if(rs.next()) getrow=Integer.valueOf(rs.getString(1)).intValue();
		}
		catch(Exception e)	
		{
			System.err.println("page:getmaxRowcount():"+e.getLocalizedMessage());
		}
		return getrow;
		
	}

	/**璸衡羆计*/
	private void countMaxPage(){
		if (this.maxrowcount%this.rowsperpage==0){
			this.maxpage=this.maxrowcount/this.rowsperpage;
		}else{
			this.maxpage=this.maxrowcount/this.rowsperpage+1;
		}
	}
	
	/**羆计*/
	public int getMaxpage(){
		return this.maxpage;
	}
	public int getCounts(){
		return this.maxrowcount;
	}

	/**琩高计pages计沮*/
	public Vector getData(int pages){
		v.clear();
		
		int star=((pages-1)*rowsperpage);
		int end=star+this.rowsperpage;
		
		if(maxrowcount==0||star>maxrowcount) {
			close();return null;
		}
		
		try{
			ResultSet rs=Sql.query(strSql+" limit "+star+" , "+end);
			
			ResultSetMetaData rsm=rs.getMetaData();
			int cn=rsm.getColumnCount();//rsm.getColumnCount()挡狦栋计
			rs.absolute(1);
			for(int j=0; j<this.rowsperpage;j++){
				//–object癸禜い,
				Object[] obj=new Object[cn];
				for(int k=0;k<cn;k++){
					obj[k]=rs.getString(k+1);	
		     		}	
				v.add(obj);
				if(!rs.next()) break;	
			}	
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close();
		}
		
		return v;
	}
	public void close(){
		Sql.closestmt();	
		Sql.closeconn();
	}
	/*public static void main(String args[]){
		page pa=new page(5,"select * from content");
		Vector v=pa.getData(2);
		Enumeration e=v.elements();
		while(e.hasMoreElements()){
			Object[] obj=(Object[])e.nextElement();
			//System.out.print("︽:");
			for(int i=0;i<obj.length;i++){
				System.out.print(obj[i]);
			}
		}
		
		v=pa.getData(1);
		e=v.elements();
		while(e.hasMoreElements()){
			Object[] obj=(Object[])e.nextElement();
			System.out.print("︽:");
			for(int i=0;i<obj.length;i++){
				System.out.print(obj[i]);
			}	
		}
	}    */    
}