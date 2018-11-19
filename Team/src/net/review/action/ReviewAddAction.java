package net.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.review.action.ActionForward;
import net.review.db.ReviewDAO;
import net.review.db.ReviewBean;

public class ReviewAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletContext context=request.getServletContext(); 
  		String realPath=context.getRealPath("/upload"); 
  		int maxSize=5*1024*1024; 
  		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy()); 
  		ReviewBean rb=new ReviewBean();
  		rb.setContent(multi.getParameter("content")); 
  		String file=multi.getFilesystemName("file1")+","+multi.getFilesystemName("file2")+","+multi.getFilesystemName("file3"); 
  		rb.setFile(file); 
  		rb.setLocation(multi.getParameter("location")); 
  		rb.setRating(Integer.parseInt(multi.getParameter("rating")));
  		rb.setReview_num(Integer.parseInt(multi.getParameter("review_num")));
  		System.out.println(realPath); 
   		System.out.println(file); 
   		ReviewDAO agdao=new ReviewDAO(); 
  		agdao.insertReview(rb); 
  		ActionForward raa=new ActionForward(); 
  		raa.setRedirect(true); 
  		raa.setPath("./ReviewList.re"); 
  		return raa; 
  	} 

}
