package kr.post.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.FileUtil;

public class WriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		//로그인이 된 경우
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		
	    
		//자바빈(VO) 생성
		PostVO post = new PostVO();
		post.setPost_title(request.getParameter("post_title"));
		post.setPost_content(request.getParameter("post_content"));
		//post.setDate(request.getParameter("date"));
		post.setUs_nickname(request.getParameter("us_nickname"));
		post.setPost_img(FileUtil.uploadFile(request, "post_img"));
		post.setUs_num(us_num);//회원번호
		
		//글자 20byte초과시 입력제한수 -> 이거 아닌가?
		String postTitle = request.getParameter("post_title");
		if (postTitle.length() > 20) {
			request.setAttribute("notice_msg", "제목 글자 입력수가 초과되었습니다.");
		}
		
		PostDAO dao = PostDAO.getInstance();
		dao.insertPost(post, us_num);
		
		request.setAttribute("notice_msg", "작성이 완료되었습니다.");
		request.setAttribute("notice_url", request.getContextPath()+"/post/list.do");
		
		
		return "common/alert_view.jsp";
	}

}
