package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;

public class BookListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BookListAction execute()");
		
		//getBookList() 함수호출
		AdminDAO adao = new AdminDAO();
		List bookList = adao.getBookList();
		
		//저장
		request.setAttribute("bookList", bookList);
		
		//이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/bookList.jsp");
				
		return forward;
	}
	
	

}
