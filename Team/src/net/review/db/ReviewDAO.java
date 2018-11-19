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

import net.review.db.ReviewBean;



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


	public int getReviewCount()

	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int count=0;
		try
		{
			con = getConnection();
			
			String sql = "select count(*) from review";
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


	public ReviewBean getReview(int num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		ReviewBean rb = new ReviewBean();
		try
		{
			con=getConnection();
			String sql = "select * from review where num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1, num);
			rs = psm.executeQuery();
			
			while(rs.next())
			{
				 rb.setReview_num(rs.getInt("review_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setRating(rs.getInt("rating"));
				 rb.setDate(rs.getDate("date"));
				 rb.setFile(rs.getString("content"));
				 rb.setLocation(rs.getString("location"));
			}
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
		
		
	return rb;
	}

	
	public void deleteReview(int num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		try
		{
			con = getConnection();
			String sql = "delete from review where num=?";
			psm = con.prepareStatement(sql);
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


	public int passCheck(int num, String ppass)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int pscheck = -1;
		try
		{
			con = getConnection();
			
			String sql = "select pass from review where num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1,num);
			rs=psm.executeQuery();
			if(rs.next())
			{
				if(ppass.equals(rs.getString("pass")))	{		pscheck = 1;		}
				else		{	pscheck = 0;	}
			}
			else		
			{		pscheck=-1;	}
			
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
		return pscheck;
	}

	
	public List getReviewList(){
		List reviewList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			sql="select * from review";
			pstmt=con.prepareStatement(sql);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs데이터 있으면 자바빈 객체 생성 gBean
			//  rs => 자바빈 멤버변수 저장 => goodsList 한칸 저장
			while(rs.next()){
				ReviewBean rb=new ReviewBean();
				 rb.setReview_num(rs.getInt("review_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setRating(rs.getInt("rating"));
				 rb.setDate(rs.getDate("date"));
				 rb.setFile(rs.getString("content"));
				 rb.setLocation(rs.getString("location"));
				//자바빈 => 배열 한칸 저장
				reviewList.add(rb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return reviewList;
	}

	public void insertReview(ReviewBean rb)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int mnum =0;
		try
		{
			con = getConnection();
			
			String sql = "select max(num) from review;" ;
			psm = con.prepareStatement(sql);
			rs = psm.executeQuery();
			
			if(rs.next())
			{
				mnum = rs.getInt("max(num)")+1;
			}
			

			String sql2="insert into review(review_num,rating,location,date,content,file) values (?,?,?,?,?,?now())";
			psm = con.prepareStatement(sql2);
			psm.setInt(1, rb.getReview_num());
			psm.setInt(2, rb.getRating());
			psm.setString(3, rb.getLocation());
			psm.setDate(3, rb.getDate());
			psm.setString(5, rb.getContent());
			psm.setString(6, rb.getFile());
			psm.setInt(10,0);
	
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
}
