package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.action.ActionForward;

public class AdminFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		//가상주소 뽑아오기
		//URI 주소 뽑아오기  /Team/*.ad
		String requestURI=request.getRequestURI();
		//System.out.println(requestURI);
		
		// 프로젝트경로  Context 경로
		String contextPath=request.getContextPath();
		//System.out.println(contextPath);
		//System.out.println("Context 길이 : "+contextPath.length());
	
		// requestURI 에서  Context 길이 부터 끝까지 문자열 뽑아오기
		String command=requestURI.substring(contextPath.length());
		System.out.println(command);
		
		//가상주소 비교하기		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/BookList.ad")){
			action = new BookListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
		else if(command.equals("/MemberList.ad")){
			action = new MemberListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
		else if(command.equals("/MenuAdd.ad")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/menuForm.jsp");
		}
		else if(command.equals("/MenuAddAction.ad"))
		{
			action = new MenuAddAction(); 
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}			
		}
		else if(command.equals("/NewsAdd.ad")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/newsForm.jsp");
		}
		
		
		//이동
		if(forward!=null){
			//이동방식  true response.sendRedirect /false  forward
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
}
