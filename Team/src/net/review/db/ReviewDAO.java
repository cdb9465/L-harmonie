package net.review.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ReviewDAO {
	
	
	
	private Connection getConnection() throws Exception {
		Connection con=null;

		Context init=new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;	
	}
	
	

	public void updateReadCount(int num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ReviewBean rb = new ReviewBean();
		try
		{
			con = getConnection();
			String sql = "update review set readcount=readcount+1 where num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1, num);
			psm.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(psm!=null)		
				try	{	psm.close();	}	catch(SQLException ex)	{}
			if(con!=null)		
				try	{	con.close();	}	catch(SQLException ex)	{}

		}
	}



}
