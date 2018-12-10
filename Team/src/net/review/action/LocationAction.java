package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.ReviewDAO;

public class LocationAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LocationAction execute");
		String location = request.getParameter("sel_location");
		ReviewDAO rd = new ReviewDAO();
		rd.getLocation(location);
		
		
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ReviewList.re");
		return forward;
	}

}
