package net.news.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.news.action.Action;
import net.news.action.ActionForward;
import net.news.db.NewsBean;
import net.news.db.NewsDAO;

public class FileBoardWriteAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileBoardWriteAction execute()");
		
		//파일 경로
		ServletContext context = request.getServletContext();
		String filePath = context.getRealPath("/upload");
		
		//MultipartRequest multi 객체생성
		System.out.println(filePath);
		int maxSize=5*1024*1024; //5M
		MultipartRequest multi=
		new MultipartRequest(request,filePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		//BoardBean bb 객체생성
		NewsBean nb = new NewsBean();
		
		// multi 파라미터값 저장 => 자바빈 멤버변수 저장 
		nb.setTitle(multi.getParameter("title"));
		nb.setContent(multi.getParameter("content"));
		// upload폴더에 업로드된 파일 이름 가져오기
		nb.setFile(multi.getFilesystemName("file"));
		
		//BoardDAO bdao 객체생성
		NewsDAO ndao=new NewsDAO();
		
		// 메서드호출 insertBoard(폼파라미터 저장된 자바빈 주소)
		ndao.insertNews(nb);
		
		// 이동  ./BoardList.bo
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./NewsList.nw");
		return forward;
	}
}
