package net.review.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.review.db.LoveDAO;


public class LoveCount implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoveCount execute() 1도착---");
		

		int review_num = Integer.parseInt(request.getParameter("review_num"));


		LoveDAO ld=new LoveDAO();
		
		int loveCount = ld.getLoveCount(review_num);
		
		request.setAttribute("loveCount", loveCount);
		

		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ReviewListTest.re");
		return forward;

	}
}