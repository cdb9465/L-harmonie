package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action{
	//추상메서드 재정의하기 (오버라이드)
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinAction execute()");
				//request 한글처리
			request.setCharacterEncoding("utf-8");
				//request 저장된 파라미터 가져오기
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
				// 자바빈 - 패키지 member 파일이름 MemberBean (MemberDAO)
			
				// 멤버변수 정의 set get메서드 준비

				// MemberBean 객체 생성 mb
			MemberBean mb=new MemberBean();
				// 폼 파라미터 값 => 자바빈 멤버변수 저장
			
			mb.setEmail(email);
			mb.setPass(pass);
			mb.setName(name);
			mb.setPhone(phone);

				// MemberDAO  mdao 객체생성
			MemberDAO mdao=new MemberDAO();
				// insertMember 함수호출
			mdao.insertMember(mb);	
				// 이동   MemberLogin.me
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./MemberJoin.me");
			
			return forward;
	}
	
	
}
