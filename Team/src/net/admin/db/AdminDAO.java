package net.admin.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;

import net.book.db.BookBean;
import net.member.db.MemberBean;

public class AdminDAO {
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
	
	public List getBookList(String location, String date){
		List bookList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs= null;
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		try{
			//db 연결
			con = getConnection();
			
			//sql
			if(location == "전체" || date == sdf.format(cal.getTime())){
				sql = "select * from book where Date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sdf.format(cal.getTime()));
			}
			else{
				sql = "select * from book where location=? and Date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,location);
				pstmt.setString(2, date);
			}
			
			//rs 실행 저장
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BookBean bb = new BookBean();
				bb.setMem_num(rs.getInt("mem_num"));
				bb.setBook_num(rs.getString("book_num"));
				bb.setLocation(rs.getString("location"));
				bb.setDate(rs.getDate("date"));
				bb.setTime(rs.getString("time"));
				bb.setGuest(rs.getInt("guest"));
				bb.setTablenum(rs.getInt("tablenum"));
				bb.setRequest(rs.getString("request"));
				
				bookList.add(bb);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return bookList;
	}
	
	public List getMemberList(){
		List memberList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs= null;
		
		try{
			//db 연결
			con = getConnection();
			
			//sql
			sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			
			//rs 실행 저장
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb = new MemberBean();
				
				mb.setMem_num(rs.getInt("mem_num"));
				mb.setEmail(rs.getString("email"));
				mb.setName(rs.getString("name"));
				mb.setPhone(rs.getString("phone"));
			
				memberList.add(mb);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		
		return memberList;
	}
}
