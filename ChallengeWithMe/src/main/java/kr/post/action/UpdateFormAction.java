package kr.post.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.StringUtil;

public class UpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.do";
		}
		
		long post_num = Long.parseLong(request.getParameter("post_num"));
		
		PostDAO dao = PostDAO.getInstance();
		PostVO post = dao.getpost(post_num);
		if(us_num != post.getUs_num()) {
			//로그인한 회원번호와 작성자 회원번호 불일치
			return "common/notice.jsp";
		}
		//큰 따옴표 처리(수정폼의 input 태그에만 명시)
		post.setPost_title(StringUtil.parseQuot(post.getPost_title()));
		
		request.setAttribute("post", post);
		
		return "post/updateForm.jsp";
	}

}
