package net.book.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class BookDAO {
	//디비연결 메소드
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
		
	public void insertBook(BookBean bb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bookNum = 0;
		try {
			//1,2단계 메서드 호출
			con = getConnection();
			
			//예약번호 구하기
			String sql = "select max(book_num) from book ";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				bookNum = rs.getInt("max(book_num)")+1;//rs.getInt(1)
			}
			
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			
			
			
			//sql만들고 실행 프로그램 생성
			sql = "insert into book values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			
			//pstmt.setInt(1,bb.getMem_num());
			pstmt.setInt(1, 1);
			//pstmt.setInt(1,bb.getBook_num());
			pstmt.setInt(2, 1);
			pstmt.setString(3, bb.getLocation());
			pstmt.setDate(4, bb.getDate());
			pstmt.setString(5, bb.getTime());
			pstmt.setInt(6,bb.getGuest());
			pstmt.setInt(7, bb.getTablenum());
			pstmt.setString(8,bb.getRequest());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
		}
	}

}
