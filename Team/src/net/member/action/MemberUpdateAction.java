package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction execute()");
		
		//세션값 객체생성
		HttpSession session=request.getSession();
		//세션값 가져오기
		String email=(String)session.getAttribute("email");
		//hiden값으로 넘긴 mem_num가져오기
		
		//세션값이 없으면 loginForm.jsp
		/*if(email==null){
			response.sendRedirect("./Mypage.me");
		}*/
		MemberBean mb =new MemberBean();
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		//request 파라미터 가져오기 id pass name
		/*String pass=request.getParameter("pass");*/
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		
		mb.setEmail(email);
		mb.setPass(pass);
		mb.setName(name);
		mb.setPhone(phone);

		
			// MemberDAO mdao 객체 생성
			MemberDAO mdao = new MemberDAO();
			

				mdao.updateMember(mb);
				
				response.setContentType("text/html; charset=UTF-8");
				//자바에서 JSP구문 쓸때 ↓ 아래 형식으로 사용
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원 정보가 수정되었습니다.');");
				out.println("location.href='Mypage.me';"); //이동
				out.println("</script>");
				out.close();
				
				/*// 이동
				ActionForward forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./Mypage.me");
				return forward;*/
				return null;
	}

	
}
