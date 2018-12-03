package net.member.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.review.db.ReviewBean;

public class MemberMypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberInfoAction execute()");
		request.setCharacterEncoding("utf-8");
		
		//세션값 객체생성
		HttpSession session=request.getSession();
		//세션값 가져오기
		String email=(String)session.getAttribute("email");

	
//1페이지  MODIFY
		//  MemberDAO mdao 객체생성
		MemberDAO mdao=new MemberDAO();
		
		
		// 리턴값 저장할 변수 mb= getMember(세션값) 메서드 호출
		MemberBean mb = mdao.getMember(email);
		//mem_num값 변수저장
		int mem_num = mb.getMem_num();
				
		System.out.println("mem_num="+mem_num);
		//request 맴버정보 저장
		request.setAttribute("mb", mb);
		
		
// 2페이지 MY Book
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		/*int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		System.out.println("mem_num = "+mem_num);*/
		
		//input에서 날짜값 가져오기
		String endDate = (String)request.getParameter("searchEndDate");
		String startDate = (String)request.getParameter("searchStartDate");
		System.out.println(endDate+" , "+startDate+","+cal.getTime());
		//초기값이 null이면 현재시간으로 셋팅
		if(startDate==null) startDate = "";
		if(endDate==null) endDate = "";
		
		//BookBean 객체생성
				BookBean bb = new BookBean();
		//내예약 전체갯수구하기
				int myBookCountAll = mdao.getMyBookCountAll(mem_num);
		//기간조회 별 내예약 갯수
				int myBookCount = mdao.getMyBookCount(mem_num,startDate,endDate);
				System.out.println("myBookCountAll="+myBookCountAll );
				List<BookBean> myBookList = null;
		//페이지
		//pageSize 5설정
				int bookpageSize=6;
				//pageNum 파라미터 가져오기 없으면 "1" 설정
				String bookpageNum=request.getParameter("bookpageNum");
				System.out.println("bookpageNum="+bookpageNum);
				if(bookpageNum==null){
					bookpageNum="1";
				}
				
				int currentPage=Integer.parseInt(bookpageNum);
		//startRow 시작페이지 계산식 endRow 끝페이지 계산식
				int bookstartRow=(currentPage-1)*bookpageSize+1;
				int bookendRow=currentPage*bookpageSize;
				System.out.println("startRow="+bookstartRow+","+"endRow="+bookendRow);
				System.out.println("myBookCount="+myBookCount);
				if(myBookCount>0){
					myBookList = mdao.getMyBookList(mem_num,startDate,endDate,bookstartRow,bookpageSize);
					System.out.println(myBookList);
				}
		//pageCount 계산식
				int bookpageCount = myBookCount/bookpageSize + (myBookCount%bookpageSize==0?0:1); 
		//pageBlock 10설정
				int bookpageBlock=10;
		//startPage 계산식 endPage 계산식
				int bookstartPage = ((currentPage-1)/bookpageBlock) * bookpageBlock+1;
				int bookendPage = bookstartPage+bookpageBlock-1;
		//계산식
				if(bookendPage > bookpageCount){
					bookendPage=bookpageCount;//전체 페이지 개수
				}
		
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);		
		request.setAttribute("myBookCount", myBookCount);
		request.setAttribute("myBookCountAll", myBookCountAll);
		request.setAttribute("myBookList", myBookList);

		request.setAttribute("bookpageNum", bookpageNum);
		request.setAttribute("bookpageBlock", bookpageBlock);
		request.setAttribute("bookstartPage", bookstartPage);
		request.setAttribute("bookendPage", bookendPage);
		request.setAttribute("bookpageCount", bookpageCount);

		
//3페이지 MY Review
		

		//input에서 날짜값 가져오기
		String endDate2 = (String)request.getParameter("searchEndDate2");
		String startDate2 = (String)request.getParameter("searchStartDate2");

		//초기값이 null이면 현재시간으로 셋팅
		if(startDate2==null) startDate2 = "";
		if(endDate2==null) endDate2 = "";
		
		//ReviewBean 객체생성
			ReviewBean rb = new ReviewBean();
		//내예약 전체갯수구하기
				int myReviewCountAll = mdao.getMyReviewCountAll(mem_num);
		//기간조회 별 내예약 갯수
				int myReviewCount = mdao.getMyReviewCount(mem_num,startDate2,endDate2);

				List<ReviewBean> myReviewList = null;
		//페이지
		//pageSize 5설정
				int reviewpageSize=6;
				//pageNum 파라미터 가져오기 없으면 "1" 설정
				String reviewpageNum=request.getParameter("reviewpageNum");

				if(reviewpageNum==null){
					reviewpageNum="1";
				}
				
				int reviewcurrentPage=Integer.parseInt(reviewpageNum);
		//startRow 시작페이지 계산식 endRow 끝페이지 계산식
				int reviewstartRow=(reviewcurrentPage-1)*reviewpageSize+1;
				int reviewendRow=reviewcurrentPage*reviewpageSize;

				if(myReviewCount>0){
					myReviewList = mdao.getMyReviewList(mem_num,startDate2,endDate2,reviewstartRow,reviewpageSize);
					System.out.println(myReviewList);
				}
		//pageCount 계산식
				int reviewpageCount = myReviewCount/reviewpageSize + (myReviewCount%reviewpageSize==0?0:1); 
		//pageBlock 10설정
				int reviewpageBlock=10;
		//startPage 계산식 endPage 계산식
				int reviewstartPage = ((reviewcurrentPage-1)/reviewpageBlock) * reviewpageBlock+1;
				int reviewendPage = reviewstartPage+reviewpageBlock-1;
		//계산식
				if(reviewendPage > reviewpageCount){
					reviewendPage=reviewpageCount;//전체 페이지 개수
				}
		
		request.setAttribute("startDate2", startDate2);
		request.setAttribute("endDate2", endDate2);		
		request.setAttribute("myReviewCount", myReviewCount);
		request.setAttribute("myReviewCountAll", myReviewCountAll);
		request.setAttribute("myReviewList", myReviewList);

		request.setAttribute("reviewpageNum", reviewpageNum);
		request.setAttribute("reviewpageBlock", reviewpageBlock);
		request.setAttribute("reviewstartPage", reviewstartPage);
		request.setAttribute("reviewendPage", reviewendPage);
		request.setAttribute("reviewpageCount", reviewpageCount);


//이동		
		//forward 객체생성
		ActionForward forward=new ActionForward();
		forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
		// 이동 ./Member/info.jsp
		forward.setPath("./mypage/mypage.jsp");
		
		return forward;
	}

}
