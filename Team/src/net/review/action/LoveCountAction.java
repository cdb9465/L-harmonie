package net.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.LoveBean;
import net.review.db.LoveDAO;
import net.review.db.ReviewDAO;

public class LoveCountAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoveCountAction execute");
		ServletContext context=request.getServletContext(); 
		LoveBean lb = new LoveBean();
		request.setCharacterEncoding("utf-8");
		lb.setMem_num(Integer.parseInt(request.getParameter("mem_num")));
		lb.setReview_num(Integer.parseInt(request.getParameter("review_num")));
		lb.setLove_num(Integer.parseInt(request.getParameter("love_num")));
		
		LoveDAO ld=new LoveDAO(); 
  		ld.insertLove(lb); 
		ActionForward forward=new ActionForward(); 
  		forward.setRedirect(true); 
  		forward.setPath("./ReviewList.re"); 
  		
  		return forward; 
	}
}