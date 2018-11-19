package net.book.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
		
		try {
			//1,2단계 메서드 호출
			con = getConnection();
			
			//sql만들고 실행 프로그램 생성
			String sql = "insert into book values(?,?,?,?,?,?,?,?)";
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
