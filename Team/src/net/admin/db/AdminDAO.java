package net.admin.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.book.db.BookBean;
import net.member.db.MemberBean;
import net.menu.db.MenuBean;
import net.news.db.NewsBean;

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

			if(location.equals("전체") || date == sdf.format(cal.getTime())){
				sql = "select * from book where Date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sdf.format(cal.getTime()));
			}
			else if(location.equals("전체")){
				sql = "select * from book where Date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,date);
			}
			else{
				sql = "select * from book where location =? and Date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, location);
				pstmt.setString(2,date);
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

	// 뉴스등록
	public void insertNews(NewsBean nb)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 0;	//news번호 
 		try {
			//1,2단계 메서드 호출
			con = getConnection();
 			// 3. news_num 구하기
			String sql = "select max(news_num) from news";
			pstmt = con.prepareStatement(sql);
 			// 4. 저장 <= 결과 실행
			rs = pstmt.executeQuery();
			
			// 5. 첫행에 데이터 있으면 가장 큰번호 +1
			if(rs.next())
				num = rs.getInt("max(news_num)") + 1;
			
			if(pstmt!=null) try{pstmt.close();} catch (SQLException ex) {}
			
			//3. sql 실행객체 생성
			sql = "insert into news(news_num, title, content, date, file)"
				+ "values(?, ?, ?, now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nb.getTitle());
			pstmt.setString(3, nb.getContent());
			pstmt.setString(4, nb.getFile());
 			//4. 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
		}
	}

//메뉴등록
	public void insertMenu(MenuBean mnb)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 0;	//menu번호 

		try {
			//1,2단계 메서드 호출
			con = getConnection();

			// 3. menu_num 구하기
			String sql = "select max(menu_num) from menu";
			pstmt = con.prepareStatement(sql);

			// 4. 저장 <= 결과 실행
			rs = pstmt.executeQuery();
			
			// 5. 첫행에 데이터 있으면 가장 큰번호 +1
			if(rs.next())
				num = rs.getInt("max(menu_num)") + 1;
			
			if(pstmt!=null) try{pstmt.close();} catch (SQLException ex) {}
			
			//3. sql 실행객체 생성
			sql = "insert into menu(menu_num, category, name, file, content)"
				+ "values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, mnb.getCategory());
			pstmt.setString(3, mnb.getName());
			pstmt.setString(4, mnb.getFile());
			pstmt.setString(5, mnb.getContent());

			//4. 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
		}
	}

}
