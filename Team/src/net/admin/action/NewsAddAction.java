package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.db.AdminDAO;
import net.news.db.NewsBean;

public class NewsAddAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// filePath 얻기
		ServletContext context = request.getServletContext();
		String filePath = context.getRealPath("/upload");	//request.getRealPath() 같음
		
		// maxSize 설정
		int maxSize = 5*1024*1024; //5M
		
		// MultipartRequest multi 객체생성
		MultipartRequest multi = 
				new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		// request 파라미터 가져오기
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");

		//updload폴더에 업로드된 파일 이름 가져오기
		String file = multi.getFilesystemName("file");
		
		// NewsBean nb 자바빈 객체생성
		NewsBean nb = new NewsBean();
		
		// set 메서드 호출
		nb.setTitle(title);
		nb.setContent(content);
		nb.setFile(file);
		
		// AdminDAO insertNews(NewsBean) 메서드 호출
		AdminDAO adao = new AdminDAO();
		adao.insertNews(nb);
		
		// 이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./news/news.jsp");
		
		return forward;
	}

}
