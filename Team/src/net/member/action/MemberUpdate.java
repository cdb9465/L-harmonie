package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdate execute()");
		
		//세션값 객체생성
		HttpSession session=request.getSession();
		//세션값 가져오기
		String id=(String)session.getAttribute("id");
		
		//세션값이 없으면 loginForm.jsp
		if(id==null){
			response.sendRedirect("./MemberLogin.me.me");
		}

		//forward 객체생성
		ActionForward forward=new ActionForward();
		forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
		// 이동 ./Member/info.jsp
		forward.setPath("./member/updateForm.jsp");
		
		return forward;
	
	}
	
	
}
