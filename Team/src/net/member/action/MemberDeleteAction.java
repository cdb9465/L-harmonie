package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberDeleteAction  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteAction execute()");

			//request 한글처리
			request.setCharacterEncoding("utf-8");
			
			//request 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");

			// MemberDAO mdao 객체 생성
			MemberDAO mdao = new MemberDAO();
			
			// 정수형 변수    = userCheck(폼아이디,폼비밀번호) 함수 호출
			int check=mdao.userCheck(id, pass);
			
			// <if조건문>
			// 변수 ==1  세션값 생성 ./Main.me 이동
			if(check==1){
				//delete 
				mdao.deleteMember(id);
				//main으로 이동
				ActionForward forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./Main.me");
				return forward;
				
			// 변수==0 비밀번호틀림 뒤로이동
			}else if(check==0){
				response.setContentType("text/html; charset=UTF-8");
				
				//자바에서 JSP구문 쓸때 ↓ 아래 형식으로 사용
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호 틀림');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
				
			// 변수==-1 아이디없음 뒤로이동
			}else if(check==-1){
				response.setContentType("text/html; charset=UTF-8");
				
				//자바에서 JSP구문 쓸때 ↓ 아래 형식으로 사용
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이디 없음');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}
			return null;
	}


}
