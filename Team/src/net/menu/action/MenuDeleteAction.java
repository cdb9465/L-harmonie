package net.menu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.menu.action.ActionForward;
import net.menu.db.MenuDAO;

public class MenuDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MenuDeleteAction execute()");
		
		HttpSession session=request.getSession();
		
		int m_num = Integer.parseInt(request.getParameter("num"));
		
		MenuDAO mdao = new MenuDAO();
		
		mdao.deleteMenu(m_num);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MenuList.nu");
		return forward;
	}

}
