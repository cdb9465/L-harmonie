package net.menu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.menu.db.MenuDAO;
import net.menu.db.MenuBean;

public class MenuListAction implements Action{	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MenuListAction execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		//NewsDAO ndao 객체생성
		MenuDAO mdao = new MenuDAO();
		
		String category = request.getParameter("category");
		
		if(category==null) {
			category="Starter";
		}
		
		List menuList = mdao.getMenuList(category);

		request.setAttribute("menuList", menuList);
		
		//이동 ./board/list.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./store/menu.jsp");
		return forward;
	}
}
