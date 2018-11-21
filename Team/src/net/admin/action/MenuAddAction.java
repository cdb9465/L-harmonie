package net.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.db.AdminDAO;
import net.menu.db.MenuBean;

public class MenuAddAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ServletContext context = request.getServletContext();
		String filePath = context.getRealPath("/upload");	//request.getRealPath() 같음
		int maxSize = 5*1024*1024; //5M
		
		// MultipartRequest multi 객체생성
		MultipartRequest multi = 
				new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
//		String category = multi.getParameter("category");
//		String name = multi.getParameter("name");
//		String file = multi.getParameter("file");
//		String content = multi.getParameter("content");
		
		// MenuBean mnb 자바빈 객체생성
		MenuBean mnb = new MenuBean();
		
		// set 메서드 호출 <= 파라미터 가져오기
		mnb.setCategory(multi.getParameter("category"));
		mnb.setName(multi.getParameter("name"));
		mnb.setContent(multi.getParameter("content"));	

		//updload폴더에 업로드된 파일 이름 가져오기
		mnb.setFile(multi.getFilesystemName("file"));
		
		AdminDAO adao = new AdminDAO();
		adao.insertMenu(mnb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./store/menu.jsp");	//가상주소 변경 해야함
		
		return forward;
	}

}
