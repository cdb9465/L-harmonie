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
		//mem_num값 가져오기
		System.out.println(email);
		
		/*------------------------------1페이지  MODIFY-------------------*/
		//  MemberDAO mdao 객체생성
		MemberDAO mdao=new MemberDAO();
		
		// 리턴값 저장할 변수 mb= getMember(세션값) 메서드 호출
		MemberBean mb = mdao.getMember(email);
		System.out.println(mb.getMem_num());
		//request 맴버정보 저장
		request.setAttribute("mb", mb);
		/*------------------------------2페이지 MY Book-------------------*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		
		//input에서 날짜값 가져오기
		String endDate = (String)request.getParameter("searchEndDate");
		String startDate = (String)request.getParameter("searchStartDate");
		System.out.println(endDate+" , "+startDate+","+cal.getTime());
		//초기값이 null이면 현재시간으로 셋팅
		if(startDate==null) startDate = sdf.format(cal.getTime());
		if(endDate==null) endDate =  sdf.format(cal.getTime());
		
		//조건&num으로 dao실행
		BookBean bb = new BookBean();
		List<BookBean> myBookList = mdao.getMyBookList(mb.getMem_num(),startDate,endDate);
		int myBookCountTerm = mdao.getMyBookCountTerm(mb.getMem_num(),startDate,endDate);
		int myBookCountAll = mdao.getMyBookCountAll(mb.getMem_num());
		
		System.out.println(myBookCountTerm);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("myBookList", myBookList);
		request.setAttribute("myBookCountTerm", myBookCountTerm);
		request.setAttribute("myBookCountAll", myBookCountAll);
		
		/*------------------------------3페이지 MY Review-------------------*/
		
		ReviewBean rb = new ReviewBean();
		
		List<ReviewBean> myReviewList =  mdao.getMyReviewList(mb.getMem_num());
		
		request.setAttribute("myReviewList", myReviewList);
		
		
		
		
		
		
		
		
		
		//forward 객체생성
		ActionForward forward=new ActionForward();
		forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
		// 이동 ./Member/info.jsp
		forward.setPath("./mypage/mypage.jsp");
		
		return forward;
	}

}
