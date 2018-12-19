package net.review.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.LoveBean;
import net.review.db.LoveDAO;
import net.review.db.ReviewDAO;

public class LoveCountAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoveCountAction execute() 도착---");
		
		String email = request.getParameter("email");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		System.out.print("맴넘 리넘 확인 : "+email+ review_num);
		
		LoveDAO ld=new LoveDAO();
		//등록된 love가 있는지 확인하러 가자( 있으면 1, 없으면0 리턴 )
		int loveCheck = ld.checkLove(email, review_num);
 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(loveCheck);
		out.close();
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ReviewListTest.re");
		return forward;
		
		/*System.out.println("LoveCountAction execute");
		ServletContext context=request.getServletContext(); 
		LoveBean lb = new LoveBean();
		request.setCharacterEncoding("utf-8");
		lb.setMem_num(Integer.parseInt(request.getParameter("mem_num")));
		lb.setReview_num(Integer.parseInt(request.getParameter("review_num")));
		lb.setLove_num(Integer.parseInt(request.getParameter("love_num")));
		int love_num = Integer.parseInt(request.getParameter("love_num"));
		System.out.println(love_num + "안녕");
		LoveDAO ld=new LoveDAO(); 
  		if(love_num==0){
  			ld.deleteLove(love_num);
  		}else{
  			ld.insertLove(lb);
  			
  		}
		ActionForward forward=new ActionForward(); 
  		forward.setRedirect(true); 
  		forward.setPath("./ReviewList.re"); 
  		
  		return forward; */
	}
}