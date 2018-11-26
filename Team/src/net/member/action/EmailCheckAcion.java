package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class EmailCheckAcion implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EmailCheckAcion execute()");
		
		String email = request.getParameter("email");
		MemberDAO mdao = new MemberDAO();
		int re = mdao.checkEmail(email);

		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(re);
		out.close();
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./MemberJoin.me");
		return forward;

		
	}
}
