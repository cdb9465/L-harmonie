package net.book.action;

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
		
		int cnt=0;
		int chkTable[] = new int[10];
		
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
			
			if(i == bb.getTablenum()) //예약된 테이블이면
			{
				chkTable[i] = 1;
				cnt++;				
			}
			else // 예약된 테이블 아니면
			{
				chkTable[i] = 0;
			}
		}
		
		if(cnt == 10) //모든 테이블이 예약되어 있으면
		{
			//시간 비활성화..
		}
		
		for(int i = 0; i< 10; i++)
		{
			System.out.println(chkTable[i]);
			System.out.println();
		}
		
		ActionForward forward = null;
		forward.setRedirect(false);
		forward.setPath("./Book.bk");
		
		return forward;
	}

}
