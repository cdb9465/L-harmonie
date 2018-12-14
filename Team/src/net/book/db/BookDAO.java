package net.book.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BookDAO {
	//디비연결 메소드
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
		
	public String insertBook(BookBean bb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int book_count = 0; //일련번호
		String book_num = null; //예약번호
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			//1,2단계 메서드 호출
			con = getConnection();
			
			//예약번호 구하기
			String sql = "select max(book_count) from book where date=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, bb.getDate());
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				book_count = rs.getInt(1)+1;//rs.getInt(1)
			}else{
				book_count = 1;
			}
			book_num = sdf.format(bb.getDate()).toString()+book_count;
			
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			
			//sql만들고 실행 프로그램 생성
			sql = "insert into book values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			//pstmt.setInt(1, 1);
			pstmt.setInt(1,bb.getMem_num());
			pstmt.setInt(2, book_count);
			//pstmt.setInt(3,bb.getBook_num());
			pstmt.setString(3, book_num); //예약번호
			pstmt.setString(4, bb.getLocation());
			pstmt.setDate(5, bb.getDate());
			pstmt.setString(6, bb.getTime());
			pstmt.setInt(7,bb.getGuest());
			pstmt.setInt(8, bb.getTablenum());
			pstmt.setString(9,bb.getRequest());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
		}
		
		return book_num;
		
	}
	
	public BookBean getBook(String book_num){
		BookBean bb = new BookBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			
			//sql 생성
			String sql = "select * from book where book_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book_num);
			
			//결과값 저장
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bb.setBook_num(rs.getString("book_num"));
				bb.setLocation(rs.getString("location"));
				bb.setGuest(rs.getInt("guest"));
				bb.setDate(rs.getDate("date"));
				bb.setTime(rs.getString("time"));
				bb.setTablenum(rs.getInt("tablenum"));
				bb.setRequest(rs.getString("request"));	
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
			if(rs!=null) try {rs.close();} catch (SQLException ex){}
		}
	
		return bb;
	}

	public int getTableCount(BookBean bb, String time)
	{
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1,2단계 메서드 호출
			con = getConnection();
			
			//3 sql
			String sql = "select count(*) from book where location=? and date=? and time=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb.getLocation());
			pstmt.setDate(2, bb.getDate());
			pstmt.setString(3, time);
			
			//4 저장 <=결과 실행
			rs=pstmt.executeQuery();

			//5 첫행에 데이터 있으면 글개수 count
			if(rs.next())
				count = rs.getInt("count(*)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
			if(rs!=null) try{rs.close();} catch(SQLException ex){}	
		}		
		
		return count;
	}
	
	public List<BookBean> getDisableTable(BookBean bb)

	{
		List<BookBean> list = new ArrayList<BookBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();

			//sql 생성
			String sql = "select * from book where location=? and date=? and time=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb.getLocation());
			pstmt.setDate(2, bb.getDate());
			pstmt.setString(3, bb.getTime());
			
			//결과값 저장
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new BookBean();

				bb.setBook_num(rs.getString("book_num"));
				bb.setLocation(rs.getString("location"));
				bb.setGuest(rs.getInt("guest"));
				bb.setDate(rs.getDate("date"));
				bb.setTime(rs.getString("time"));
				bb.setTablenum(rs.getInt("tablenum"));
				bb.setRequest(rs.getString("request"));	
				
				list.add(bb);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
			if(rs!=null) try {rs.close();} catch (SQLException ex){}
		}
	
		return list;		
	}

	public void bookDelete(String book_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "delete from book where book_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}			
		}
	}

}
