package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookDAO;

public class BookDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookDeleteAction execute");
		
		//한글 처리
		request.setCharacterEncoding("utf-8");
		
		//book_num 받아오기
		String book_num = request.getParameter("book_num");
		
		//BookDAO 객체 생성
		BookDAO bdao = new BookDAO();
		
		//bookDelete()함수호출
		bdao.bookDelete(book_num);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("Mypage.me?#main1");
		
		
		return forward;
	}
	
	

}
