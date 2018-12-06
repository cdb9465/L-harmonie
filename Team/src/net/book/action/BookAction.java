package net.book.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("BookAction execute()");
		
		request.setCharacterEncoding("utf-8");

		String location = request.getParameter("location");
		//String date = request.getParameter("date");
		Date date = Date.valueOf(request.getParameter("date"));
		String time = request.getParameter("time");
		int guest = Integer.parseInt(request.getParameter("guest"));
		int tablenum = Integer.parseInt(request.getParameter("tablenum"));
		String req = request.getParameter("request");
		
		BookBean bb = new BookBean();
		bb.setLocation(location);
		bb.setDate(date);
		bb.setTime(time);
		bb.setGuest(guest);
		bb.setTablenum(tablenum);
		bb.setRequest(req);
		
		BookDAO bdao = new BookDAO();
		String book_num = bdao.insertBook(bb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./BookCheckAction.bk?book_num="+book_num);
		
		return forward;
	}
	
}

