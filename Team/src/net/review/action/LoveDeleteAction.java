package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.LoveDAO;
import net.review.db.ReviewDAO;

public class LoveDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("LoveDeleteAction execute");
		int love_num = Integer.parseInt(request.getParameter("love_num"));
		LoveDAO ld=new LoveDAO();
			ld.deleteLove(love_num);
		
		
		ActionForward rvd= new ActionForward();
		rvd.setRedirect(true);
			rvd.setPath("./ReviewList.re");
		return rvd;
	}

}
