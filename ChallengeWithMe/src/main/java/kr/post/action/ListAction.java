package kr.post.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.PagingUtil; 

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null)pageNum = "1";
		
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		PostDAO dao = PostDAO.getInstance();
		int count = dao.getPostCount(keyfield,keyword);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,Integer.parseInt(pageNum),count,5,10,"list.do");
		List<PostVO> list = null;
		 
		if(count>0) {
			list = dao.getListPost(page.getStartRow(), page.getEndRow(), keyfield, keyword);
		}
			
		request.setAttribute("count", count);
		request.setAttribute("post", list);
		request.setAttribute("page", page.getPage());
		
		return "/post/list.jsp";
	}

}
