package net.review.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoveDAO {
	private Connection getConnection()  throws Exception{
		Connection con= null;//드라이버 불러오기
		Class.forName("com.mysql.jdbc.Driver");
		//DB 연결
		String dbUrl = "jdbc:mysql://localhost:3306/lhdb";
		String dbId = "jspid";
		String dbPass = "jsppass";
		con = DriverManager.getConnection(dbUrl,dbId,dbPass);
		return con;	
	}	

	public void insertLove(LoveBean lb)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int mnum =0;
		try
		{
			con = getConnection();
			
			String sql = "select max(love_num) from love" ;
			psm = con.prepareStatement(sql);
			rs = psm.executeQuery();
			
			if(rs.next())
			{
				mnum = rs.getInt(1)+1;
			}else{
				mnum=1;
			}
			

			 sql="insert into love(love_num,review_num,mem_num,love) values (?,?,?,?)";
			psm = con.prepareStatement(sql);
			psm.setInt(1, mnum);
			psm.setInt(2, lb.getReview_num());
			psm.setInt(3, lb.getMem_num());
			psm.setBoolean(4, lb.getLove());
	
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
			if(rs!=null)		
				try	{	rs.close();	}	catch(SQLException ex)	{}

		}
	}

	public void deleteLove(int love_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		try
		{
			con = getConnection();
			String sql = "delete from love where love_num=?";
			psm = con.prepareStatement(sql);
			psm.setInt(1, love_num);
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
	
	public int getLoveCount()

	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int count=0;
		try
		{
			con = getConnection();
			
			String sql = "select count(*) from love";
			psm= con.prepareStatement(sql);
			rs = psm.executeQuery();
			
	
			if(rs.next())
			{
			count =rs.getInt("count(*)");
			}
		
		}
		catch(Exception e)
		{
			
		}
		finally
		{
			if(psm!=null)		
				try	{	psm.close();	}	catch(SQLException ex)	{}
			if(con!=null)		
				try	{	con.close();	}	catch(SQLException ex)	{}
		}
		return count;
		
		
	}
}
