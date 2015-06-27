package com.web.database;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �ƾڮw�s���ΰ򥻾ާ@</p>
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
			 
		  	//�s��DB2
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
	 *  �ƾڮw�d��
	 */
	public ResultSet query(String sql) {
		try{
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(SQLException ex) {
			//System.out.println("*************");
			//System.out.println(sql);
			//System.out.println("*************");
			System.err.println("�ƾڮw�d�߿��~�J" + ex.getMessage());
		}

		return rs;
	}

	/**
	 *  �ƾڮw�K�[�B�ק�B�R��
	 */
	public void update(String sql) {
		try{
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException ex) {
			
			System.out.println("");
			System.err.println("�ƾڮw��s���~�J"+ex.getMessage());
		}
	}

	/**
	 * �����ƾڶ�
	 */
	public void closestmt() {
		try{
			stmt.close();
		}catch(SQLException ex) {
			System.out.println();
			System.out.println("");
			System.err.println("�ƾڶ��������~�J"+ex.getMessage());
		}
	}

	/**
	 * �����ƾڮw�s��
	 */
	public void closeconn() {
		try{
			conn.close();
		}catch(SQLException ex) {
			System.out.println();
			System.out.println("");
			System.err.println("�ƾڮw�s���������~�J"+ex.getMessage());
		}
	}
}