package net.admin.action;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;

public class BookListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BookListAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		
		String location = request.getParameter("location");
		if(location==null)location="전체";
		
		String date = (String)request.getParameter("date");
		if(date==null) date = sdf.format(cal.getTime());
		
		//getBookList() 함수호출
		AdminDAO adao = new AdminDAO();
		List bookList = adao.getBookList(location, date);
		
		//저장
		request.setAttribute("bookList", bookList);
		
		//이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/bookList.jsp");
				
		return forward;
	}
	
	

}
