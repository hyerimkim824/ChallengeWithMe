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

public class DeleteReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		long com_num = Long.parseLong(request.getParameter("com_num"));
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		PostDAO dao = PostDAO.getInstance();
		PostCommVO db_reply = dao.getReplyPost(com_num);
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(us_num!=null && us_num == db_reply.getUs_num()){
			//로그인한 회원번호와 작성자 회원번호가 일치
			dao.deleteReplyPost(com_num);
			mapAjax.put("result", "success");
		}else {
			//로그인한 회원번호와 작성자 회원번호가 불일치
			mapAjax.put("result", "wrongAccess");
		}
		//JSON 데이터로 변환
		return StringUtil.parseJSON(request, mapAjax);
	}

}
