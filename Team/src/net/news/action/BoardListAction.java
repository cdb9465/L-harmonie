package net.news.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.news.action.Action;
import net.news.action.ActionForward;
import net.news.db.NewsDAO;
import net.news.db.NewsBean;

public class BoardListAction implements Action{	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NewsListAction execute()");
		
		NewsDAO ndao = new NewsDAO();
		//count=getBoardCount() 함수 호출
		int count=ndao.getNewsCount();
		
		
		//데이터 있으면 boardList getBoardList(시작행,가져올글개수)
		List<NewsBean> newsList=null;
		if(count!=0) {
			newsList = ndao.getNewsList();
		}

		request.setAttribute("count", count);
		request.setAttribute("newsList", newsList);
		
		//이동 ./board/list.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./news/news.jsp");
		return forward;
	}
}
