package net.review.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CommentDAO {


	private Connection getConnection() throws Exception{
      
      Connection con = null;
      // Context 객체 생성
      Context init = new InitialContext();
      // DateSource = 디비연동 이름 불러오기
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
      // con = DataSource
      con = ds.getConnection();

      return con;
   }	
	
	public void insertComment(CommentBean cb)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int mnum =0;
		try
		{
			con = getConnection();
			
			String sql = "select max(comment_num) from comment where review_num=?" ;
			psm = con.prepareStatement(sql);
			psm.setInt(1,cb.getReview_num());
			rs = psm.executeQuery();
			
			if(rs.next())
			{
				mnum = rs.getInt(1)+1;
			}else{
				mnum=1;
			}
			

			 sql="insert into comment(comment_num,review_num,mem_num,content,date) values (?,?,?,?,now())";
			psm = con.prepareStatement(sql);
			psm.setInt(1, mnum);
			psm.setInt(2, cb.getReview_num());
			psm.setInt(3, cb.getMem_num());
			psm.setString(4, cb.getContent());
	
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

	public void deleteComment(int comment_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		try
		{
			con = getConnection();
			String sql = "delete from comment where comment_num=?";
			psm = con.prepareStatement(sql);
			psm.setInt(1, comment_num);
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

	
	public int getCommentCount()

	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int count=0;
		try
		{
			con = getConnection();
			
			String sql = "select count(*) from comment";
			psm= con.prepareStatement(sql);
		//psm.setInt(1, review_num);
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
	
	
	public CommentBean getComment(int comment_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		CommentBean rb = new CommentBean();
		try
		{
			con=getConnection();
			String sql = "select * from comment where comment_num=?";
			psm= con.prepareStatement(sql);
			psm.setInt(1, comment_num);
			rs = psm.executeQuery();
			
			while(rs.next())
			{
				 rb.setMem_num(rs.getInt("mem_num"));
				rb.setReview_num(rs.getInt("review_num"));
				 rb.setComment_num(rs.getInt("comment_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setDate(rs.getDate("date"));
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

	
public List<CommentBean> getCommentList(int mem_num){
		
	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CommentBean> commentList=new ArrayList<CommentBean>();
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			
			 String sql="select * from comment where mem_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			//pstmt.setInt(2, review_num);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				CommentBean cb=new CommentBean();
				cb.setMem_num(rs.getInt("mem_num"));
				 cb.setReview_num(rs.getInt("review_num"));
				 cb.setComment_num(rs.getInt("comment_num"));
				 cb.setContent(rs.getString("content"));
				 cb.setDate(rs.getDate("date"));
				 commentList.add(cb);
				//자바빈 => 배열 한칸 저장
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return commentList;
	}


public CommentBean getComment1(){
	Connection con = null;
	PreparedStatement psm = null;
	ResultSet rs = null;
	CommentBean rb = new CommentBean();
	try
	{
		con=getConnection();
		String sql = "select * from comment";
		psm= con.prepareStatement(sql);
		rs = psm.executeQuery();
		
		while(rs.next())
		{
			 rb.setMem_num(rs.getInt("mem_num"));
			rb.setReview_num(rs.getInt("review_num"));
			 rb.setComment_num(rs.getInt("comment_num"));
			 rb.setContent(rs.getString("content"));
			 rb.setDate(rs.getDate("date"));
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

}

