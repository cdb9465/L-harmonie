package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class FindPassAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FinPassAction execute()메소드");
		request.setCharacterEncoding("utf-8");
		//입력값 가져오기
		String email = (String)(request.getParameter("email1")+"@"+request.getParameter("email2"));
		System.out.println(email);
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		System.out.println("적은 name="+name+", 적은 phone="+phone);
		//sql구문 실행
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = new MemberBean();
		String findPass = mdao.findPass(email, name, phone);
		
		//비밀번호 변경을 위해 email 저장
		mb.setEmail(email);
		mb.setName(name);
		mb.setPhone(phone);
		
		if(findPass==null){		
			//자바에서 JSP구문 쓸때 ↓ 아래 형식으로 사용
			response.setContentType("text/html; charset=UTF-8");	
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('조회된 회원정보가 없습니다. 입력 정보를 다시 확인해주세요.');");
			out.println("location.href='./FindIdPass.me'");
			out.println("</script>");
			out.close();		
			return null;
		}else{
			//결과값 내보내기
			request.setAttribute("findPass",findPass);
			request.setAttribute("mb",mb);
			//forward 객체생성
			ActionForward forward=new ActionForward();
			forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
			// 이동 ./Member/info.jsp
			forward.setPath("./member/findpassResult.jsp");
			return forward;
		}
		
		
	}
	

}
