package kr.post.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.StringUtil;

public class DetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long post_num = Long.parseLong(request.getParameter("post_num"));
		
		PostDAO dao = PostDAO.getInstance();
		//조회수 증가
		dao.viewcount(post_num);

		PostVO post = dao.getpost(post_num);
		
		if(post == null) {
			System.out.println("post는 null");
		}
		//HTML 태그를 허용하지 않음
		//post.setPost_title(StringUtil.useNoHtml(post.getPost_title()));
		//HTML 태그를 허용하지 않으면서 줄바꿈 처리
		//post.setPost_content(StringUtil.useBrNoHtml(post.getPost_content()));

		request.setAttribute("post", post);

		return "post/detail.jsp";
	}

}
