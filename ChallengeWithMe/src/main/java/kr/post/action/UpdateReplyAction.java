package kr.post.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostCommVO;
import kr.util.StringUtil;

public class UpdateReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		//댓글 번호
		long com_num = Long.parseLong(request.getParameter("com_num"));
		
		PostDAO dao = PostDAO.getInstance();
		PostCommVO db_reply = dao.getReplyPost(com_num);
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		if(us_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(us_num!=null && us_num==db_reply.getUs_num()) {
			//로그인한 회원번호 == 작성자 회원번호
			//자바빈(VO) 생성
			PostCommVO reply = new PostCommVO();
			reply.setCom_num(com_num);
			reply.setCom_content(request.getParameter("com_content"));
			reply.setUs_img(request.getParameter("us_img"));
			reply.setUs_nickname(request.getParameter("us_nickname"));
			
			//댓글 수정
			dao.modifyReplyPost(reply);
			mapAjax.put("result", "success");
		}else {//로그인한 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		
		//JSON 데이터로 변환
		return StringUtil.parseJSON(request, mapAjax);
	}
	

}
