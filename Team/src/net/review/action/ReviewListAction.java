package net.review.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.PageBean;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewListAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("ReviewListAction execute()");

		//ReviewDAO rdao 객체 생성;
		ReviewDAO rdao = new ReviewDAO();
				
		// count = getReviewCount() 함수 호출
		int count = rdao.getReviewCount();	//location필요
	
		// pageSize 10 설정
		int pageSize = 5;
		
		// pageNum 파라미터 가져오기 없으면 "1" 설정
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)
			pageNum = "1";
		
		// 현 페이지 번호currentPage pageNum 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		
		// startRow 시작페이지 계산식 endRow 끝페이지 계산식
		int startRow = (currentPage-1)*pageSize + 1;
		//int endRow = currentPage * pageSize;
		
		// 데이터 있으면 reviewList getBoardList(시작행, 가져올글갯수)
		List<ReviewBean> reviewList = rdao.getReviewList(startRow, pageSize);
		
		// 전체 페이지 수 pageCount 계산식
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		
		// 한 화면에 보여줄 페이지 개수 pageBlock 10 설정
		int pageBlock = 5;
		
		// startPage 계산식 endPage 계산식
		int startPage = ((currentPage-1) / pageBlock) * pageBlock +1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount)
			endPage = pageCount;
		
		// 저장 reviewList
		request.setAttribute("reviewList", reviewList);
		
		// PageBean 저장 count pageNum 
		// pageCount pageBlock startPage endPage
		PageBean pb = new PageBean();
		pb.setCount(count);
		pb.setPageNum(pageNum);
		pb.setPageCount(pageCount);
		pb.setPageBlock(pageBlock);
		pb.setStartPage(startPage);
		pb.setEndPage(endPage);
		
		request.setAttribute("pb", pb);	
		
		// 이동 ./review/review.jsp
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/review/reviewCopy.jsp");
			
		return forward;
	}
}
