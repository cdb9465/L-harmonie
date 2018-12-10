package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class ChangePassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ChangePassAction execute()메소드");
		
		request.setCharacterEncoding("utf-8");
		//입력값 가져오기
		String email =(String) request.getParameter("email");
		String name =(String) request.getParameter("name");
		String phone =(String) request.getParameter("phone");
		String pass =(String) request.getParameter("pass");
		System.out.println(email+name+phone+pass);
		
		MemberBean mb =new MemberBean();
		
		mb.setEmail(email);
		mb.setName(name);
		mb.setPhone(phone);
		mb.setPass(pass);
		
		// MemberDAO mdao 객체 생성
		MemberDAO mdao = new MemberDAO();
		

			mdao.updateMember(mb);
			
			response.setContentType("text/html; charset=UTF-8");
			//자바에서 JSP구문 쓸때 ↓ 아래 형식으로 사용
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 수정되었습니다. 로그인해주세요.');");
			out.println("location.href='Main.ma';"); //이동
			out.println("</script>");
			out.close();
						
		return null;
	}
	
	
}
