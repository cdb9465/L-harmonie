package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.review.db.ReviewBean;

public class MemberMypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberInfoAction execute()");

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
