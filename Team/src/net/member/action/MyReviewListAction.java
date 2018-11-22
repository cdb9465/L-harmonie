package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MyReviewListAction   implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// MemberDAO mdao 객체 생성
		MemberDAO mdao = new MemberDAO();

		List<MemberBean> memberlist = mdao.listMember();
				
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/list.jsp");
		
		return forward;
	}

}
