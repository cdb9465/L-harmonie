package net.review.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.review.action.ActionForward;
import net.review.db.ReviewDAO;

public class ReviewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Review execute()");
		ReviewDAO rd= new ReviewDAO();
		List ReviewList=rd.getReviewList();
		request.setAttribute("rd", rd);
		ActionForward ra= new ActionForward();
		ra.setRedirect(false);
			ra.setPath("./review/review.jsp");
			
			return ra;
	}

}
