package net.review.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.review.db.CommentBean;
import net.review.db.CommentDAO;

public class CommentWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentWriteAction execute");
		ServletContext context=request.getServletContext(); 
		CommentBean cb= new CommentBean();
		request.setCharacterEncoding("utf-8");
		
		cb.setMem_num(Integer.parseInt(request.getParameter("mem_num")));
		cb.setReview_num(Integer.parseInt(request.getParameter("review_num")));
		cb.setContent(request.getParameter("content"));
		
		CommentDAO cd = new CommentDAO();
		cd.insertComment(cb);
		ActionForward forward=new ActionForward(); 
  		forward.setRedirect(true); 
  		forward.setPath("./ReviewList.re"); 
  		
  		return forward; 
	}

}
