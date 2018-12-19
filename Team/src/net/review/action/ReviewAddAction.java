package net.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import net.review.db.ReviewDAO;
import net.review.db.ReviewBean;

public class ReviewAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewAddAction execute");
		
		ServletContext context=request.getServletContext(); 
		
  		String realPath=context.getRealPath("/upload"); 
  		int maxSize=5*1024*1024; 
  		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy()); 
  		
  		ReviewBean rb=new ReviewBean();
  		rb.setMem_num(Integer.parseInt(multi.getParameter("mem_num")));
  		rb.setContent(multi.getParameter("content")); 
  		
  		
  			//파일  null값을 없애기
  			/*if(request.getParameter("file2")==null&&request.getParameter("file3")==null){
  				String file=multi.getFilesystemName("file1");
  				rb.setFile(file);
  				System.out.println(file); 
  			}else
  			if(request.getParameter("file2")!=null&&request.getParameter("file3")==null){
  				String file=multi.getFilesystemName("file1")+","+multi.getFilesystemName("file2");
  				rb.setFile(file);
  				System.out.println(file); 
  			}else
  			if(request.getParameter("file2")==null&&request.getParameter("file3")!=null){
  				String file=multi.getFilesystemName("file1")+","+multi.getFilesystemName("file3");
  				rb.setFile(file);
  				System.out.println(file); 
  			}else if(request.getParameter("file2")!=null&&request.getParameter("file3")!=null){
  				String file=multi.getFilesystemName("file1")+","+multi.getFilesystemName("file2")+","+multi.getFilesystemName("file3"); 
  				rb.setFile(file);
  				System.out.println(file); 
  			}*/
  			
  		
  		 
  		String file=multi.getFilesystemName("file1")+","+multi.getFilesystemName("file2")+","+multi.getFilesystemName("file3"); 
  		rb.setFile(file);
		System.out.println(file); 
  		
  		
  		rb.setLocation(multi.getParameter("sel_location")); 
  		rb.setRating(Integer.parseInt(multi.getParameter("rating")));
  		
   		ReviewDAO rd=new ReviewDAO(); 
  		rd.insertReview(rb); 
  		System.out.println(realPath); 
   	
  		ActionForward forward=new ActionForward(); 
  		forward.setRedirect(true); 
  		forward.setPath("./ReviewList.re"); 
  		
  		return forward; 
  	} 

}
