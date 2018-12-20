package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.CommentDAO;

public class CommentDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentDeleteAction execute");
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		CommentDAO cd=new CommentDAO();
		cd.deleteComment(comment_num,review_num);
		ActionForward forward= new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ReviewList.re");
		return forward;
	}

}
