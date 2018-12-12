package net.admin.action;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.admin.db.PageBean;
import net.book.db.BookBean;

public class BookListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BookListAction execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		//날짜 포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		
		//지점선택
		String location = request.getParameter("location");
		if(location==null)location="전체";
		
		//날짜선택
		String date = (String)request.getParameter("date");
		//System.out.println(date);
		if(date==null) date = sdf.format(cal.getTime());

		//페이징
		//한페이지 글개수 pageSize
		int pageSize = 10;
		
		//pageNum 가져오기 없으면 1
		String pageNum =request.getParameter("pageNum");
		if(pageNum == null){pageNum = "1";}
		
		//현재페이지 currentPage
		int currentPage = Integer.parseInt(pageNum);
		
		//startRow  시작페이지 endRow 끝페이지
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		//getBookList() 함수호출
		AdminDAO adao = new AdminDAO();
		List<BookBean> bookList = null;
		
		int count = adao.getBookCount(location,date);
		if(count != 0)
			bookList = adao.getBookList(location,date,startRow,pageSize);
		
		//pageCount
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		
		//pageBlock 5
		int pageBlock = 5;
		
		//startPage 
		int startPage = ((currentPage-1)/pageBlock)*pageBlock +1;
		
		//endPage 계산 pb보다 작을 경우 마지막페이지는 페이지 수만큼
		int endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		
		//pageBean 담기
		PageBean pb = new PageBean();
		pb.setCount(count);
		pb.setPageNum(pageNum);
		pb.setPageCount(pageCount);
		pb.setPageBlock(pageBlock);
		pb.setStartPage(startPage);
		pb.setEndPage(endPage);
		
		//저장
		request.setAttribute("pb", pb);
		request.setAttribute("bookList", bookList);
		request.setAttribute("location", location);
		request.setAttribute("date", date);
		
		//이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/bookList.jsp");
				
		return forward;
	}
	
	

}
