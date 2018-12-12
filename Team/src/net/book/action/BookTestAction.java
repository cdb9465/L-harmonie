package net.book.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookTestAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("BookTestAction execute");
		
		//int cnt=0;	//예약된 테이블 갯수
		String strTable = null;	//예약된 테이블 번호
		
		//한글처리
		request.setCharacterEncoding("utf-8");

		//파라미터 가져오기
		String location = request.getParameter("location");
		Date date = Date.valueOf(request.getParameter("date"));
		String time = request.getParameter("time");

		//BookBean bb에 저장
		BookBean bb = new BookBean();
		bb.setLocation(location);
		bb.setDate(date);
		bb.setTime(time);
		
		//TestBook호출
		BookDAO bdao = new BookDAO();
		List<BookBean> bookList = bdao.testBook(bb);
	
		for(int i = 0; i < bookList.size(); i++)
		{
			bb = bookList.get(i);
		
			System.out.println("예약된테이블번호: "+bb.getTablenum());
			
			//strTable += 예약된 테이블 번호 저장
			if(i==0)
				strTable = Integer.toString(bb.getTablenum());
			else
				strTable += "," + Integer.toString(bb.getTablenum());
			
		}
		
		if(bookList.size() == 10) //모든 테이블이 예약되어 있으면
		{
			//시간 비활성화..
		}
	
		System.out.println(strTable);

		//ajax로 값 리턴
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(strTable);
		out.close();		
		
		ActionForward forward = null;
//		forward.setRedirect(false);
//		forward.setPath("./Book.bk");
		
		return forward;
	}

}
