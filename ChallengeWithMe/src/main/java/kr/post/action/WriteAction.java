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
			//return "redirect: 로그인 창 주소 적어야함 
		}
		//로그인이 된 경우
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//자바빈(VO) 생성
		PostVO post = new PostVO();
		post.setTitle(request.getParameter("title"));
		//post.setDate(request.getParameter("date"));
		post.setUs_nickname(request.getParameter("us_nickname"));
		post.setUs_img(FileUtil.uploadFile(request, "us_img"));
		post.setUs_num(us_num);//회원번호
		
		PostDAO dao = PostDAO.getInstance();
		dao.insertPost(post);
		
		request.setAttribute("notice_msg", "작성이 완료되었습니다.");
		request.setAttribute("notice_url", request.getContextPath()+"/post/list.do");
		
		
		return "common/alert_view.jsp";
	}

}
