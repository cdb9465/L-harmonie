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

import net.member.db.MemberBean;
public class LoveDAO {
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
	public void insertLove(LoveBean lb)
	{
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int mnum =0;
		boolean nnum=true;
		try
		{
			con = getConnection();
			
			String sql = "select max(love_num) from love where review_num=?" ;
			psm = con.prepareStatement(sql);
			psm.setInt(1,lb.getReview_num());
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
			psm.setBoolean(4, nnum);
	
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
	

	public List<LoveBean> getLoveList(List<ReviewBean> reviewList){
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<LoveBean> loveList=new ArrayList<LoveBean>();
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			
			for(int i=0; i<reviewList.size(); i++){
			 ReviewBean review=reviewList.get(i);
				System.out.println(review.getReview_num());
			
				
				String sql="select * from love where review_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, review.getReview_num());
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					LoveBean lb=new LoveBean();
					lb.setMem_num(rs.getInt("mem_num"));
					 lb.setReview_num(rs.getInt("review_num"));
					 lb.setLove_num(rs.getInt("love_num"));
					 lb.setLove(rs.getBoolean("love"));
					 loveList.add(lb);
					//자바빈 => 배열 한칸 저장
					
				}
				
				
				
			}
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return loveList;
	}

public List<LoveBean> getLoveList1(){
		
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<LoveBean> loveList=new ArrayList<LoveBean>();
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			
			 String sql="select * from love ";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(2, review_num);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				LoveBean lb=new LoveBean();
				lb.setMem_num(rs.getInt("mem_num"));
				 lb.setReview_num(rs.getInt("review_num"));
				 lb.setLove_num(rs.getInt("love_num"));
				 lb.setLove(rs.getBoolean("love"));
				 loveList.add(lb);
				//자바빈 => 배열 한칸 저장
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return loveList;
	}

public int checkLove(String email, int review_num){
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	//love가 없다 - 기본
   int loveCheck = 0;
   try{
	   		//mem_num에 해당하는 review_num 찾기
          con = getConnection();  
          MemberBean mb = new MemberBean();
          
          String sql = "select mem_num from member where email=?";
          pstmt = con.prepareStatement(sql); 
		  pstmt.setString(1,email);
		  rs=pstmt.executeQuery();
			  if(rs.next()){
				 
				  mb.setMem_num(rs.getInt(1));
			  }
		
          sql="select * from love where mem_num=? and review=?;";
		  pstmt = con.prepareStatement(sql); 
		  pstmt.setInt(1,mb.getMem_num());
		  pstmt.setInt(2,review_num);
		// 4단계  결과 저장 <= 실행
		  rs=pstmt.executeQuery();

			   if(rs.next()){
				   //love가 있다
				   loveCheck = 1;
			   }
    
   }catch (Exception e) {
         e.printStackTrace();
    }finally{
	   
	   	if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
		if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
		if(con!=null)	try{con.close(); }catch(SQLException ex){}

   }
   return loveCheck;
 }//end checkEmail()


}
