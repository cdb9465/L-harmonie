package net.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import net.admin.db.PageBean;
import net.member.db.MemberBean;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberListAction execute()");
		
		//페이징
		//한페이지 글개수 pageSize
		int pageSize = 10;
		
		//pageNum 가져오기 없으면 1
		String pageNum =request.getParameter("pageNum");
		if(pageNum == null){pageNum = "1";}
		
		//현재페이지 currentPage
		int currentPage = Integer.parseInt(pageNum);
		
		//startRow  시작페이지 endRow 끝페이지
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
				
		//getMemberList() 호출
		AdminDAO adao = new AdminDAO();
		List<MemberBean> memberList = null;
		
		int count = adao.getMemberCount();
		if(count != 0)
			memberList = adao.getMemberList();
		
		//pageCount
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		
		//pageBlock 5
		int pageBlock = 5;
		
		//startPage 
		int startPage = ((currentPage-1)/pageBlock)*pageBlock +1;
		
		//endPage 계산 pb보다 작을 경우 마지막페이지는 페이지 수만큼
		int endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		
		//pageBean 담기
		PageBean pb = new PageBean();
		pb.setCount(count);
		pb.setPageNum(pageNum);
		pb.setPageCount(pageCount);
		pb.setPageBlock(pageBlock);
		pb.setStartPage(startPage);
		pb.setEndPage(endPage);
		
		//저장
		request.setAttribute("pb", pb);
		request.setAttribute("memberList", memberList);
		
		//이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/memberList.jsp");
		
		return forward;
	}
	
	
}
