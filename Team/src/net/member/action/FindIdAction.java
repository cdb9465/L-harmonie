package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class FindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FindIdAction execute()메소드");
		request.setCharacterEncoding("utf-8");
		//입력값 가져오기
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		System.out.println("적은 name="+name+", 적은 phone="+phone);
		//sql구문 실행
		MemberDAO mdao = new MemberDAO();
		String findEmail = mdao.findId(name, phone);
		
		
		if(findEmail==null){		
			//자바에서 JSP구문 쓸때 ↓ 아래 형식으로 사용
			response.setContentType("text/html; charset=UTF-8");	
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('조회된 회원정보가 없습니다. 입력 정보를 다시 확인해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();		
			return null;
		}else{
			//결과값 내보내기
			request.setAttribute("findEmail",findEmail);
			System.out.println(findEmail);
			//forward 객체생성
			ActionForward forward=new ActionForward();
			forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
			// 이동 ./Member/info.jsp
			forward.setPath("./member/findidResult.jsp");
			return forward;
		}
		
		
	}
	
	

}
