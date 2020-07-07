package com.wy;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;

public class JDBConnection {

	private static Connection conn = null; // ����Connection��Ķ���
	private static PreparedStatement ps = null; // ����Statement��Ķ���
	private ResultSet rs = null; // ����ResultSet��Ķ���

	private String dbUrl = "jdbc:mysql://localhost:3306/db_wuliu";
	private String dbUserName = "root";
	private String dbPassword = "chenpan";
	private String jdbcName = "com.mysql.jdbc.Driver";

	public  Connection getCon() throws Exception {
		Class.forName(jdbcName);
		Connection con = DriverManager.getConnection(dbUrl, dbUserName,dbPassword);
		return con;
	}

	public void close(Connection con) throws Exception {
		if (con != null) {
			con.close();
		}
	}
	public void Close(Connection con,PreparedStatement ps) throws Exception {
		if (con != null) 
		{
			con.close();
		}
		if(ps!=null)
			ps.close();
	}
	public void execute(String sql)throws Exception
	{
//		if(sql==null||"".equals(sql))
//			return;
		conn = this.getCon();
		try 
		{
			ps = conn.prepareStatement(sql);
			ps.execute(); 
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			System.out.println("Query Exception"); // �ڿ���̨�������쳣��Ϣ
		} 
	}
	
	public ResultSet executeQuery(String sql) throws Exception 
	{
		conn = this.getCon();
		try 
		{
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			System.out.println("Query Exception"); // �ڿ���̨�������쳣��Ϣ
		} 
		return rs; // ����ѯ�Ľ��ͨ��return�ؼ��ַ���
	}

	public boolean executeUpdata(String sql) 
	{
//		if(sql==null||"".equals(sql))
//			return false;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); // ִ����ӡ��޸ġ�ɾ������
			return true; // ���ִ�гɹ��򷵻�true
		} catch (Exception e) {
			e.printStackTrace();
			return false; // ���ִ�гɹ��򷵻�false
		}
	}

}
