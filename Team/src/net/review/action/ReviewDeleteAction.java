package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.action.ActionForward;
import net.review.db.ReviewDAO;

public class ReviewDeleteAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewDeleteAction execute");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		ReviewDAO rd=new ReviewDAO();
		rd.deleteReview(review_num);
		ActionForward rvd= new ActionForward();
		rvd.setRedirect(true);
			rvd.setPath("./ReviewList.re");
		return rvd;
	}

}


