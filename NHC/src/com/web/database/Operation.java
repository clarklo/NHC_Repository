package com.web.database;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 數據庫連接及基本操作</p>
 *
 * <p>Copyright: Copyright (c) 2012</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Operation {
	private Connection conn = null;
	private Statement stmt = null;
	ResultSet rs = null;

	public Operation() {
		DataSource ds = null;
		try{
			Context initCtx = new InitialContext();
			 
		  	//連接DB2
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance(); 
			
			//String url = "jdbc:db2:WSUDB";
			//test server : db2v901t
			//online : www3
			String url="jdbc:db2://localhost:50000/WSUDB";
				   String user="APNHC01"; 
			  	   String password="ihaoyu@8"; 				
				
			  	   conn= DriverManager.getConnection(url,user,password);  
			  	  
			     stmt=conn.createStatement();
			stmt.execute ("SET CURRENT_SCHEMA=NHC");
			  	
			  	
			  	   //END
		 		  	 
		  	 if(ds != null){   
				conn = ds.getConnection();
			}
		} 
		catch(Exception e){ 
			System.out.println(e.getMessage());
			
		}
	}

	/**
	 *  數據庫查詢
	 */
	public ResultSet query(String sql) {
		try{
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(SQLException ex) {
			//System.out.println("*************");
			//System.out.println(sql);
			//System.out.println("*************");
			System.err.println("數據庫查詢錯誤︰" + ex.getMessage());
		}

		return rs;
	}

	/**
	 *  數據庫添加、修改、刪除
	 */
	public void update(String sql) {
		try{
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException ex) {
			
			System.out.println("");
			System.err.println("數據庫更新錯誤︰"+ex.getMessage());
		}
	}

	/**
	 * 關閉數據集
	 */
	public void closestmt() {
		try{
			stmt.close();
		}catch(SQLException ex) {
			System.out.println();
			System.out.println("");
			System.err.println("數據集關閉錯誤︰"+ex.getMessage());
		}
	}

	/**
	 * 關閉數據庫連接
	 */
	public void closeconn() {
		try{
			conn.close();
		}catch(SQLException ex) {
			System.out.println();
			System.out.println("");
			System.err.println("數據庫連接關閉錯誤︰"+ex.getMessage());
		}
	}
}