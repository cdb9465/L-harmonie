package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BookCheckAction execute()");
		
		//book_num 가져오기
		String book_num = request.getParameter("book_num");
		
		//bookDAO 객체생성
		BookDAO bdao = new BookDAO();
		
		//bb = getBook(예약번호) 객체생성
		BookBean bb = bdao.getBook(book_num);
		
		request.setAttribute("bb", bb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/bookCheck.jsp");
		
		return forward;
	}
	

}
