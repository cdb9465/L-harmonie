package net.review.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.book.db.BookBean;
import net.review.db.ReviewBean;

public class ReviewDAO {
	
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
	public void insertReview(ReviewBean rb)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int mnum =0;
		try
		{
			con = getConnection();
			
			String sql = "select max(review_num) from review" ;
			psm = con.prepareStatement(sql);
			rs = psm.executeQuery();
			
			if(rs.next())
			{
				mnum = rs.getInt(1)+1;
			}else{
				mnum=1;
			}
			

			 sql="insert into review(review_num,mem_num,rating,location,content,file,date) values (?,?,?,?,?,?,now())";
			psm = con.prepareStatement(sql);
			psm.setInt(1, mnum);
			psm.setInt(2, rb.getMem_num());
			psm.setInt(3, rb.getRating());
			psm.setString(4, rb.getLocation());
			psm.setString(5, rb.getContent());
			psm.setString(6, rb.getFile());
	
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

	
	public void updateReadCount(int review_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ReviewBean rb = new ReviewBean();
		try
		{
			con = getConnection();
			String sql = "update review set readcount=readcount+1 where review_num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1, review_num);
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


	public ReviewBean getReview(int review_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		ReviewBean rb = new ReviewBean();
		try
		{
			con=getConnection();
			String sql = "select * from review where review_num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1, review_num);
			rs = psm.executeQuery();
			
			while(rs.next())
			{
				 rb.setMem_num(rs.getInt("mem_num"));
				rb.setReview_num(rs.getInt("review_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setRating(rs.getInt("rating"));
				 rb.setDate(rs.getDate("date"));
				 rb.setFile(rs.getString("file"));
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

	
	public void deleteReview(int review_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		try
		{
			con = getConnection();
			String sql = "delete from review where review_num=?";
			psm = con.prepareStatement(sql);
			psm.setInt(1, review_num);
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


	public int passCheck(int mem_num, String ppass)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int pscheck = -1;
		try
		{
			con = getConnection();
			
			String sql = "select pass from review where mem_num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1,mem_num);
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

	
	public List<ReviewBean> getReviewList(int startRow,int pageSize){
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ReviewBean> reviewList=new ArrayList<ReviewBean>();
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			
			 String sql="select * from review limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean rb=new ReviewBean();
				rb.setMem_num(rs.getInt("mem_num"));
				 rb.setReview_num(rs.getInt("review_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setRating(rs.getInt("rating"));
				 rb.setDate(rs.getDate("date"));
				 rb.setFile(rs.getString("file"));
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

		
	public List<ReviewBean> getLocation(String location){
		List<ReviewBean> ReviewList1 = new ArrayList<ReviewBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs= null;
		
		try{
			//db 연결
			con = getConnection();
			
			//sql
			if(location.equals("전체")){
				sql = "select * from Review";
				pstmt = con.prepareStatement(sql);
				
			}else{
				
				sql = "select * from Review where location =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, location);
			}

			
			//rs 실행 저장
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean rb = new ReviewBean();
				rb.setMem_num(rs.getInt("mem_num"));
				 rb.setReview_num(rs.getInt("review_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setRating(rs.getInt("rating"));
				 rb.setDate(rs.getDate("date"));
				 rb.setFile(rs.getString("file"));
				 rb.setLocation(rs.getString("location"));
				ReviewList1.add(rb);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return ReviewList1;
	}
	
}
