package net.member.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.book.db.BookBean;
import net.review.db.ReviewBean;

public class MemberDAO {
	
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
	//디비연결 메소드 분리시키기 (1,2단계가 반복되므로)
	private Connection getConnection() throws Exception{
		Connection con = null;
		
		//1단계
		Class.forName("com.mysql.jdbc.Driver");

		//2단계
		String dbUrl="jdbc:mysql://localhost:3306/lhdb";
		String dbUser="jspid";	 //db에 접속할 수 있는 id, password
		String dbPass="jsppass";
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

		return con;
	}
	
	public void insertMember(MemberBean mb){
		int mem_num=0;
		//예외처리
		try{
			//디비연결 메소드 호출
			con = getConnection();
			
			String sql="select max(mem_num) from member";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//mem_num값 지정(+1씩)
			if(rs.next()){
				mem_num=rs.getInt(1)+1;
			}else{
				mem_num=1;
			}
			//3단계
			sql="insert into member(mem_num,email,pass,name,phone) values(?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);	//쿼리 길이가 기니까 sql변수에 넣어줌

			pstmt.setInt(1, mem_num);
			pstmt.setString(2, mb.getEmail());	//(?순서,값이있는 변수명)
			pstmt.setString(3, mb.getPass());	//String형은 ?에 자동으로 ''가 붙는다.
			pstmt.setString(4, mb.getName());
			pstmt.setString(5, mb.getPhone());


			//4단계 -SQL실행
			pstmt.executeUpdate();

			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//예외 발생여부 상관없이 마무리 작업(필수)
			// 객체생성해서 사용한 기억공간 정리  .close()
			
			if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
			if(con!=null)	try{con.close(); }catch(SQLException ex){}
			
		}
		
		return;
	}

	// getMember() 함수
	public MemberBean getMember(String email){
		MemberBean mb=new MemberBean();
		try {
			//디비연결 메소드 호출
			con = getConnection();
			
			 // 3단계 sql 구문 만들고 실행할수 있는 객체생성
			 // 세션값에 해당하는 회원정보 가져오기
			 String sql="select * from member where email=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, email);
			 // 4단계  결과 저장 <= 실행
			 rs=pstmt.executeQuery();
			 // 5단계 첫행으로이동  열접근 => 출력
			 if(rs.next()){
				 // 첫행 이동 열접근 해서 
				 // MemberBean mem_num,pass,name,email,phone 변수 저장
				 mb.setMem_num(rs.getInt("mem_num"));
				 mb.setEmail(rs.getString("email"));
				 mb.setPass(rs.getString("pass"));
				 mb.setName(rs.getString("name"));
				 mb.setPhone(rs.getString("phone"));
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//예외 발생여부 상관없이 마무리 작업(필수)
			// 객체생성해서 사용한 기억공간 정리  .close()
			
			if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
			if(con!=null)	try{con.close(); }catch(SQLException ex){}
		}
		return mb;
	}
	
	// userCheck(폼아이디,폼비밀번호) 함수
	public int userCheck(String email,String pass){
		int check=-1;
		try {
			//디비연결 메소드 호출
			con = getConnection();
			
			 //3단계 sql 구문 만들고 실행할 객체 생성
			 // sql member테이블 안에 id열에 있는 데이터 와 비교
			 String sql="select pass from member where email=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, email);
			 //4단계 결과 저장 <= 실행
			 rs=pstmt.executeQuery();
			 // 5단계 결과 첫행으로 이동  데이터 있는 경우  "아이디 있음"
			 //  비밀번호 비교 (폼에서 입력한 비밀번호 디비비밀번호 비교)
			 //     맞으면 "비밀번호 맞음"
			 //     틀리면 "비밀번호 틀림"
			 // 데이터 없는 경우 "아이디없음"
			 if(rs.next()){
			 	//아이디있음
			 	//비밀번호비교//폼비밀번호   디비비밀번호 비교
			 	if(pass.equals(rs.getString("pass"))){
			 		check=1;
			 		//세션값 생성  이름,값   "id",id//이동 main.jsp 이동 
			 	}else{
			 		check=0;
			 		// 메시지 "비밀번호틀림" // 뒤로이동
			 	}
			 }else{
			 	//아이디없음 
			 	// 메시지 "아이디없음"	// 뒤로이동
			 check=-1;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//예외 발생여부 상관없이 마무리 작업(필수)
			// 객체생성해서 사용한 기억공간 정리  .close()
			
			if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
			if(con!=null)	try{con.close(); }catch(SQLException ex){}
		}
		return check;
	}
	
	// 수정 - updateMember() 함수
	public void updateMember(MemberBean mb){
		 
		 try{
			//디비연결 메소드 호출
				con = getConnection();
				
			 //3단계 세션값 id 에 해당하는 회원정보 pass 가져오기
			 String sql="update member set pass=?, name=?, phone=? where email=?";
			 pstmt=con.prepareStatement(sql);
			 //4단계 결과저장 <= 실행
			 pstmt.setString(1, mb.getPass());
			 pstmt.setString(2, mb.getName());
			 pstmt.setString(3, mb.getPhone());
			 pstmt.setString(4, mb.getEmail());
			 
			 pstmt.executeUpdate();
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			//예외 발생여부 상관없이 마무리 작업(필수)
				// 객체생성해서 사용한 기억공간 정리  .close()
				
				//if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
				if(con!=null)	try{con.close(); }catch(SQLException ex){}
			 
		 }
		 
		 
	}
	
	// 삭제 - deleteMember() 함수
	public void deleteMember(String email){
		 
		 try{
			//디비연결 메소드 호출
				con = getConnection();
				
			 //3단계 세션값 id 에 해당하는 회원정보 pass 가져오기
			 String sql="delete from member where email=?";
			 pstmt=con.prepareStatement(sql);
			 //4단계 결과저장 <= 실행
			 pstmt.setString(1, email);
			 pstmt.executeUpdate();
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			//예외 발생여부 상관없이 마무리 작업(필수)
				// 객체생성해서 사용한 기억공간 정리  .close()
				
				//if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
				if(con!=null)	try{con.close(); }catch(SQLException ex){}
			 
		 }
		 
	}
	
	// list 보여주는 함수
	public ArrayList<MemberBean> listMember(){
		
		   			//MemberBean형만 저장하는 arr 생성
		      ArrayList<MemberBean> arr = new ArrayList<MemberBean>();
		     
		      try {
		    	//디비연결 메소드 호출
					con = getConnection();
					
		          //3단계 sql 구문 실행할 객체 생성 insert
		          String sql="select * from member";
		          pstmt=con.prepareStatement(sql);
		          //4단계 실행
		          rs = pstmt.executeQuery();
		          
		          //5단계 저장된 결과 -> 한사람 정보 MemberBean에 묶어서 저장
		          //			-> 여러명 배열 List 한칸씩 저장
		          while(rs.next()){
		            	//한사람의 전체 정보를 저장하는 MemberBean 객체생성
	        	  		//while문 밖에 있으면 저장주소가 1개이므로 정보가 들어올때마다 update되어 마지막 사람만 저장됨.
		            MemberBean mb = new MemberBean();
		            mb.setName(rs.getString("pass"));
		            mb.setPass(rs.getString("name"));

					mb.setEmail(rs.getString("email"));
		            
		            	//한사람의 전체 정보를 arr한칸에 저장
		            arr.add(mb);
		          }
		      } catch (Exception e) {
		         e.printStackTrace();
		      }finally{
		    	  	//예외 발생여부 상관없이 마무리 작업(필수)
					// 객체생성해서 사용한 기억공간 정리  .close()
					
					if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
					if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
					if(con!=null)	try{con.close(); }catch(SQLException ex){}
		      }
		      return arr;
		   }
	
	public int checkEmail(String email){
			//중복된 이메일이 없다
		   int re = 0;
		   try{
		          con = getConnection();
		          String sql="select email from member where email=?";
				  pstmt = con.prepareStatement(sql);
				  
				  pstmt.setString(1,email);
				// 4단계  결과 저장 <= 실행
				  rs=pstmt.executeQuery();
				  
					   if(rs.next()){
						   //중복된 이메일이 있다
						     re = 1;
					   }
		    
		   }catch (Exception e) {
		         e.printStackTrace();
		    }finally{
			   
			   	if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
				if(con!=null)	try{con.close(); }catch(SQLException ex){}

		   }
		   return re;
		 }//end checkEmail()
	
	
	public List getMyReviewList(int mem_num){
		List myReviewList=new ArrayList();

		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			String sql="select * from review where mem_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,mem_num);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs데이터 있으면 자바빈 객체 생성 gBean
			//  rs => 자바빈 멤버변수 저장 => goodsList 한칸 저장
			while(rs.next()){
				ReviewBean rb=new ReviewBean();
				 rb.setReview_num(rs.getInt("review_num"));
				 rb.setContent(rs.getString("content"));
				 rb.setRating(rs.getInt("rating"));
				 rb.setDate(rs.getDate("date"));
				 rb.setFile(rs.getString("content"));
				 rb.setLocation(rs.getString("location"));
				//자바빈 => 배열 한칸 저장
				myReviewList.add(rb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return myReviewList;
	}
	public List getMyBookList(int mem_num){
		List myBookList=new ArrayList();

		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			String sql="select * from book where mem_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,mem_num);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs데이터 있으면 자바빈 객체 생성 gBean
			//  rs => 자바빈 멤버변수 저장 => goodsList 한칸 저장
			while(rs.next()){
				BookBean bb=new BookBean();
				 bb.setBook_count(rs.getInt("book_count"));
				 bb.setBook_num(rs.getString("book_num"));
				 bb.setLocation(rs.getString("location"));
				 bb.setDate(rs.getDate("date"));
				 bb.setTime(rs.getString("time"));
				 bb.setGuest(rs.getInt("guest"));
				 bb.setTablenum(rs.getInt("tablenum"));
				 bb.setRequest(rs.getString("request"));
				 
				//자바빈 => 배열 한칸 저장
				myBookList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return myBookList;
	}
	
	public int getMyBookCount(int mem_num){
		int count=0;
		try{
			//디비연결 메소드 호출
			con = getConnection();		
		
				//전체의 갯수를 구함 = * / select count(*) from board
			String sql= "select count(*) from book where mem_num = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			
			rs=	pstmt.executeQuery();				
			
			
			if(rs.next()){
				count=rs.getInt("count(*)"); //getInt(1)도 가능. 1번째열이라는 뜻
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//예외 발생여부 상관없이 마무리 작업(필수)
			// 객체생성해서 사용한 기억공간 정리  .close()
			
			if(rs!=null)	try{rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)	try{pstmt.close(); }catch(SQLException ex){}
			if(con!=null)	try{con.close(); }catch(SQLException ex){}
			
		} //end_try catch
			return count;
	}
}//클래스






