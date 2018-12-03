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
		
		//count=getBoardCount() 함수 호출
		int count=mdao.getMenuCount();
		
		//데이터 있으면 boardList getBoardList(시작행,가져올글개수)
		List<MenuBean> menuList=null;
		if(count!=0) {
			//menuList = mdao.getMenu();
		}

		request.setAttribute("count", count);
		request.setAttribute("menuList", menuList);
		
		//이동 ./board/list.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./store/menu.jsp");
		return forward;
	}
}
