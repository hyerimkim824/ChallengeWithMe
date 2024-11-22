package kr.post.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.FileUtil;
import kr.xuser.vo.XuserVO;

public class UpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//폼에서 수정 된 데이터 저장-> 로그인일치 여부 확인, 오라클에 저장되있는 값을 변경해야하니까 postVO 객체 생성->기존 파일 삭제
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.do";
		}
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		long post_num = Long.parseLong(request.getParameter("post_num"));
		
		PostDAO dao = PostDAO.getInstance();
		PostVO db_post = dao.getpost(post_num);
		
		
		
		//로그인한 회원번호와 작성자 회원번호 일치 여부 체크
		if(us_num != db_post.getUs_num()) {
			return "common/notice.jsp";
		}
		
		//글 수정
		PostVO post = new PostVO();
		post.setPost_num(post_num);
		post.setPost_content(request.getParameter("post_content"));
		post.setPost_img(request.getParameter("post_img"));
		//수정 날짜 작성 유무 생각해보기 post.setPost_modifydate(request.get);
		post.setPost_title(request.getParameter("post_title"));
	
		dao.modifyPost(post);
		
		if(post.getPost_img()!=null && !"".equals(post.getPost_img())) {
			//새 파일로 교체할 때 원래 파일 제거
			FileUtil.removeFile(request, db_post.getPost_img());
		}
		
		return "redirect:/post/detail.do?post_num="+post_num;
	}


}













