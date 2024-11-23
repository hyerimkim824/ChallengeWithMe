package kr.post.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.FileUtil;

public class DeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num==null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.do";
		
		}else {//로그인이 된 경우
			long post_num = Long.parseLong(request.getParameter("post_num"));
			
			PostDAO dao = PostDAO.getInstance();
			PostVO db_post = dao.getpost(post_num);
			
			if(us_num != db_post.getUs_num()) {
				//로그인한 회원번호와 작성자 회원번호가 불일치
				return "common/notice.jsp";
			}
			
			dao.deleteFile(post_num);
			dao.deletePost(post_num);
			
			//파일 삭제
			FileUtil.removeFile(request, db_post.getPost_img());
			
			request.setAttribute("notice_msg", "삭제가 완료되었습니다.");
			request.setAttribute("notice_url", request.getContextPath()+"/post/list.do");
		
			
		
		}
		return "common/alert_view.jsp";
		
		
	}

}
