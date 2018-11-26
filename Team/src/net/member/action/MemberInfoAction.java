package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberInfoAction execute()");

		//세션값 객체생성
		HttpSession session=request.getSession();
		//세션값 가져오기
		String id=(String)session.getAttribute("id");
			
		//  MemberDAO mdao 객체생성
		MemberDAO mdao=new MemberDAO();
		
		// 리턴값 저장할 변수 mb= getMember(세션값) 메서드 호출
		MemberBean mb = mdao.getMember(id);
		
		//request 맴버정보 저장
		request.setAttribute("mb", mb);
		
		//forward 객체생성
		ActionForward forward=new ActionForward();
		forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
		// 이동 ./Member/info.jsp
		forward.setPath("./member/info.jsp");
		
		return forward;
	}

}
