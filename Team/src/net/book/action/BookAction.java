package net.book.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.book.db.BookDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class BookAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("BookAction execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");

		//세션값 객체생성
		HttpSession session=request.getSession();
		//세션값 가져오기
		String email=(String)session.getAttribute("email");
		
		//MemberDAO 객체생성
		MemberDAO mdao = new MemberDAO();
		// 리턴값 저장할 변수 mb= getMember(세션값) 메서드 호출
		MemberBean mb = mdao.getMember(email);
		//mem_num값 변수저장
		int mem_num = mb.getMem_num();
		
		//파라미터값 가져오기
		String location = request.getParameter("location");
		//String date = request.getParameter("date");
		Date date = Date.valueOf(request.getParameter("date"));
		String time = request.getParameter("time");
		int guest = Integer.parseInt(request.getParameter("guest"));
		int tablenum = Integer.parseInt(request.getParameter("tablenum"));
		String req = request.getParameter("request");
		
		BookBean bb = new BookBean();
		bb.setMem_num(mem_num);
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

