package net.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.book.db.BookBean;
import net.member.db.MemberBean;
import net.menu.db.MenuBean;
import net.news.db.NewsBean;

public class AdminDAO {
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
	
	public int getBookCount(String location, String date){
		int count=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			//1,2단계 메서드 호출
			con = getConnection();
			//3 sql
			if(location.equals("전체")){
				sql = "select count(*) from book where date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,date);
			}else{
				sql = "select count(*) from book where location =? and date=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, location);
				pstmt.setString(2,date);
				
			}
			//4 저장 <=결과 실행
			rs=pstmt.executeQuery();
			//5 첫행에 데이터 있으면 글개수 count
			if(rs.next()){
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
			if(rs!=null) try{rs.close();} catch(SQLException ex){}	
		}
		return count;
	}
	
	public List<BookBean> getBookList(String location, String date, int startRow, int pageSize){
		List<BookBean> bookList = new ArrayList<BookBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs= null;
		
		try{
			//db 연결
			con = getConnection();
			
			//sql
			if(location.equals("전체")){
				sql = "select * from book where date=? limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,date);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
			}else{
				sql = "select * from book where location=? and date=? limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, location);
				pstmt.setString(2,date);
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
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
	
	public int getMemberCount(){
		int count=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			//1,2단계 메서드 호출
			con = getConnection();
			
			//3 sql
			sql = "select count(*) from member";
			pstmt = con.prepareStatement(sql);
			
			//4 저장 <=결과 실행
			rs=pstmt.executeQuery();
			//5 첫행에 데이터 있으면 글개수 count
			if(rs.next()){
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)	try {pstmt.close();} catch (SQLException ex){}
			if(con!=null) try {con.close();} catch (SQLException ex){}
			if(rs!=null) try{rs.close();} catch(SQLException ex){}	
		}
		return count;
	}
	
	public List<MemberBean> getMemberList(int startRow, int pageSize){
		List<MemberBean> memberList = new ArrayList<MemberBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs= null;
		
		try{
			//db 연결
			con = getConnection();
			
			//sql
			sql = "select * from member limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
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
