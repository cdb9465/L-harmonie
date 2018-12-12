package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{
	// 서버 시작
	// 브라우저 가상주소  http://localhost:8080/Model2/MemberInsert.me
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doProcess()메서드");
		//가상주소 뽑아오기
		//URI 주소 뽑아오기		/Model2/MemberInsert.me
		String requestURI= request.getRequestURI();
		System.out.println(requestURI);
		//프로젝트 경로 (= context 경로)	/Model2
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		System.out.println("context 길이 : "+contextPath.length());
		// requestURI 에서 Context 길이 부터 끝까지 문자열 뽑아오기
										//MemberInsert.me
		//
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		
		//가상주소 비교하기 
		//뽑아온 가상의 주소 : /MemberInsert.me 비교
		//일치하면			./member/insertForm.jsp로 이동
		ActionForward forward=null;
		Action action=null;
			if(command.equals("/MemberJoin.me")){
			//실제주소
				//response.sendRedirect("./member/insertForm.jsp");
			//가상주소 forward 이동 방식 A → B로 이동할때, A에 있는 request 정보를 가지고 B로 이동
			//									주소줄에는 A유지하되 실행화면은 B페이지
				//RequestDispatcher dispatcher=
				//		 request.getRequestDispatcher("./member/insertForm.jsp");
				//dispatcher.forward(request, response);
				
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/join.jsp");

			}else if(command.equals("/MemberJoinAction.me")){
				//회원가입처리 → 자바파일 메서드정의
				//인터페이스 틀 : 자바파일을 만들기위한 틀
				// 추상메서드 정의(Action.java) : 상속받은 자바파일 메서드 오버라이딩(재정의) 사용
				// 자바파일(MemberInsertAction) 만들고 인터페이스 상속
				
				// 자바파일 execute() 메서드 호출
				action = new MemberJoinAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//이메일 중복체크 (실시간)
			}else if(command.equals("/EmailCheck.me")){	
				action = new EmailCheckAcion();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//로그인하기
			}else if(command.equals("/MemberLogin.me")){	
				action = new MemberLoginAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//마이페이지 이동
			}else if(command.equals("/MemberLogout.me")){	
				action = new MemberLogoutAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//마이페이지 이동
			}else if(command.equals("/Mypage.me")){
				action = new MemberMypageAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/MemberUpdate.me")){
				action = new MemberUpdateAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/MemberDelete.me")){
				action = new MemberDeleteAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//id,pass찾기 같이있음
			}else if(command.equals("/FindIdPass.me")){	
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/findidpass.jsp");
				//id찾기 액션
			}else if(command.equals("/FindIdAction.me")){	
				action = new FindIdAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//pass찾기 액션
			}else if(command.equals("/FindPassAction.me")){	
				action = new FindPassAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/ChangePassAction.me")){
				action = new ChangePassAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
			
			//이동
			if(forward!=null){
				//이동방식이  true면 response.sendRedirect방식 
				//이동방식이 false면 forward방식
				if(forward.isRedirect()){
					response.sendRedirect(forward.getPath());
				}else{
					RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
				
				
	}
	//메서드오버라이딩 : 메서드 재정의	alt + shift + s 하고  v
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doGet()메서드");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doPost()메서드");
		doProcess(request, response);
	}
}



