package net.book.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookDisableTimeAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("BookDisableTimeAction execute");

		int cnt = 0;
		String time[] = {"11:00", "13:00", "17:00", "19:00"};
		String strTime = "";	//예약이 다 찬 시간
		
		//한글처리
		request.setCharacterEncoding("utf-8");

		//파라미터 가져오기
		String location = request.getParameter("location");
		Date date = Date.valueOf(request.getParameter("date"));
		
		//BookBean bb에 저장
		BookBean bb = new BookBean();
		bb.setLocation(location);
		bb.setDate(date);
		
		//getTableCount 호출
		BookDAO bdao = new BookDAO();		
		for(int i = 0; i < time.length; i++)
		{
			cnt = bdao.getTableCount(bb, time[i]);
			
			System.out.println("cnt : "+cnt);
			
			if(cnt == 10)
			 strTime += i;
			
			System.out.println("strTime : "+strTime);
		}
		
		//ajax로 값 리턴
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(strTime);
		out.close();		
		
		ActionForward forward = null;
		return forward;
	}

}
