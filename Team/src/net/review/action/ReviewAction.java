package net.review.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.review.action.ActionForward;
import net.review.db.CommentBean;
import net.review.db.CommentDAO;
import net.review.db.LoveBean;
import net.review.db.LoveDAO;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewAction execute()");
		
		List<ReviewBean> reviewList=null;
		
		ReviewDAO rd= new ReviewDAO();
				
		String location = request.getParameter("location");
		
		if(location==null)
		{
			
			location="전체";
			
		}
		
		List<ReviewBean> reviewlocation=rd.getLocation(location);
		
		int count = rd.getReviewCount();
		//pageSize 10설정
		int pageSize=3;
		//pageNum 파라미터 가져오기 없으면 "1" 설정
		String pageNum=request.getParameter("pageNum");
		
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		//startRow 시작페이지 계산식 endRow 끝페이지 계산식
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		if(count!=0){
			reviewList = rd.getReviewList(startRow, pageSize);		
		}
		//pageCount 계산식
		int pageCount = count/pageSize + (count%pageSize==0?0:1); 
		//pageBlock 10설정
		int pageBlock=10;
		//startPage 계산식 endPage 계산식
		int startPage = ((currentPage-1)/pageBlock) * pageBlock+1;
		int endPage = startPage+pageBlock-1;
		//계산식
		if(endPage > pageCount){
			endPage=pageCount;//전체 페이지 개수
		}
	
		
		
		CommentDAO cd= new CommentDAO();
		CommentBean cb= new CommentBean();
		int review_num1 = cb.getReview_num();
		
		int mem_num=cb.getMem_num();
		List<CommentBean> cobe=null;
		
		
		int Ccount = cd.getCommentCount();

		if(Ccount!=0){
			cobe=cd.getCommentList(1);
		}
		
		LoveDAO ld= new LoveDAO();
		ReviewBean lb= new ReviewBean();
		int review_num2=lb.getReview_num();
		int mem_num2;
		List<LoveBean> lobe=null;
		
		
		int Lcount = ld.getLoveCount();

		if(Lcount!=0){
			lobe=ld.getLoveList(reviewList);
		}
		
		
		request.setAttribute("review_num2", review_num2);
		request.setAttribute("Lcount", Lcount);
		request.setAttribute("lobe", lobe);
		request.setAttribute("review_num1", review_num1);
		request.setAttribute("cobe", cobe);
		request.setAttribute("Ccount", Ccount);
		request.setAttribute("reviewlocation", reviewlocation);
		request.setAttribute("location", location);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("reviewList", reviewList);
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/review/review.jsp");
			
		return forward;
	}

}
