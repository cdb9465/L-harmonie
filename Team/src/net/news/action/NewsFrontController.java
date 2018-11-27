package net.news.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.news.action.BoardListAction;
import net.news.action.Action;
import net.news.action.ActionForward;

public class NewsFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NewsFrontController doGet()메서드");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NewsFrontController doPost()메서드");
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NewsFrontController doProcess()메서드");
		
		String requestURI=request.getRequestURI();
		System.out.println(requestURI);
		
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		
		System.out.println("Context 길이 : "+contextPath.length());
		
		String command=requestURI.substring(contextPath.length());
		
		System.out.println("뽑아온 가상주소: " +command);
		
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/NewsList.nw")) {
			action=new BoardListAction();
			try{
				forward=action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}	
		}
		if(forward!=null) {
			if(forward.isRedirect()){
				//true sendRedirect()
				response.sendRedirect(forward.getPath());
			}else{
				//false forward()
				RequestDispatcher dispatcher=
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
