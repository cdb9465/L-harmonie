package net.book.db;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.jdbc.PreparedStatement;

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
			
			
		} catch (Exception e) {e.printStackTrace();	}
	}

}
