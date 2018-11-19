package net.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
  			throws ServletException, IOException {
		String requestURI = request.getRequestURI(); 
  		String contextPath = request.getContextPath();
  		String command = requestURI.substring(contextPath.length()); 
  		// 가상주소 비교 
  		ActionForward forward = null; 
  		Action action = null; 
  		if (command.equals("/ReviewAdd.re")) { 
  			// ./admingoods/admin_goods_write.jsp 
  			forward = new ActionForward(); 
  			forward.setRedirect(false); 
  			forward.setPath("./review/modal.jsp"); 
  		}else if (command.equals("/ReviewAddAction.re")) { 
  	  			// GoodsAddAction 
  	  			action = new ReviewAddAction(); 
  	  			try { 
  	  				forward = action.execute(request, response); 
  	  			} catch (Exception e) { 
  	  				e.printStackTrace(); 
  	  			}
  		}else if (command.equals("/ReviewList.re")) { 
  			// GoodsListAction 
  			action = new ReviewAction(); 
  			try { 
 				forward = action.execute(request, response); 
  			} catch (Exception e) { 
  				e.printStackTrace(); 
  			}
  		}
  		
  			else if (command.equals("/ReviewDelete.re")) { 
  	  			// AdminGoodsDeleteAction 
  	  			action = new ReviewDeleteAction(); 
  	  			try { 
  	  				forward = action.execute(request, response); 
  	  			} catch (Exception e) { 
  	  				e.printStackTrace(); 
  	  			} 
  	  		}  
  		
  			
  		if (forward != null) { 
  			if (forward.isRedirect()) { 
 				response.sendRedirect(forward.getPath()); 
  			} else { 
  				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 
  				dispatcher.forward(request, response); 
  			} 
  		} 
  	} 
	
	@Override 
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
  			throws ServletException, IOException { 
  		doProcess(request, response); 
  	} 
  
 
  	@Override 
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
  			throws ServletException, IOException { 
  		doProcess(request, response); 
  	} 

}
