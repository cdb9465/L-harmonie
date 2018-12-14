package net.member.action;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

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
//값이 없으면 메세지출력 후 페이지로 되돌아간다
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
//값이 있으면 
			//findEmail값을 하나씩 잘라서 email에 넣는다
			String[] email = findEmail.split("");
			//값의 0,1,2번째 자리를 제외한 나머지 *로 표시
			for(int i=0;i<email.length;i++){
				if(i>2){ email[i]="*"; }
			}
			System.out.println("결과1111!:"+Arrays.toString(email));
			
			//s1 값 안에 email배열 누적해서 넣기
			String s1 = "";
			for(int i=0;i<email.length;i++){
				s1 = s1+(String)email[i];
			}
			System.out.println("결과2222!:"+s1);
			
			//최종 결과값 내보내기
			request.setAttribute("s1",s1);
			
			//forward 객체생성
			ActionForward forward=new ActionForward();
			forward.setRedirect(false); //jsp로 가면 false, 가상주소로 가면 true 이다.
			// 이동 ./Member/info.jsp
			forward.setPath("./member/findidResult.jsp");
			return forward;
		}
		
		
	}
	
	

}
