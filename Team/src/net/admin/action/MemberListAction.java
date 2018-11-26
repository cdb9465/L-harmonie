package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberListAction execute()");
		
		//getMemberList() 호출
		AdminDAO adao = new AdminDAO();
		List memberList = adao.getMemberList();
		
		//저장
		request.setAttribute("memberList", memberList);
		
		//이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/memberList.jsp");
		
		return forward;
	}
	
	
}
