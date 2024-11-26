package kr.post.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.post.dao.PostDAO;
import kr.post.vo.PostCommVO;
import kr.post.vo.PostVO;
import kr.util.StringUtil;
import kr.xuser.vo.XuserVO;

public class WriteReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WriteReplyAction - 요청 도달");

		//댓글 작성은 실시간으로 보여져야 하니까 멥 에이젝스 그거 쓰고 
		//세션에서 us_num 받아와서 로그인 유무 두가지로 나눠서 작성해야함
		Map<String,String> mapAjax = new HashMap<String,String>();

		HttpSession session = request.getSession();
		Long us_num =(Long)session.getAttribute("us_num");
		//디버깅
		System.out.println("WriteReplyAction - us_num: " + us_num);

		if(us_num==null) {//로그인이 되지 않은 경우
			//디버깅
			System.out.println("WriteReplyAction - 로그인이 필요합니다.");
			mapAjax.put("result", "logout");
		}else {//로그인이 된 경우
			//디버깅
			System.out.println("WriteReplyAction - 로그인 사용자입니다.");
			String postNumParam = request.getParameter("post_num");
			String comContentParam = request.getParameter("com_content");
			System.out.println("WriteReplyAction - post_num 파라미터: " + postNumParam);
			System.out.println("WriteReplyAction - com_content 파라미터: " + comContentParam);
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			//자바빈(VO)생성
			PostCommVO reply = new PostCommVO();
			//게시글 번호(Post_num), 사용자 번호(us_num)
			reply.setPost_num(us_num);
			reply.setCom_content(request.getParameter("com_content"));
			reply.setUs_img(request.getParameter("us_img"));
			reply.setUs_nickname(request.getParameter("us_nickname"));
			reply.setPost_num(Long.parseLong(request.getParameter("post_num")));

			try {
				PostDAO dao = PostDAO.getInstance();
				PostVO vo = dao.getpost(Long.parseLong(request.getParameter("post_num")));
				dao.insertPostReply(reply, us_num);

				mapAjax.put("result", "success");
				
				dao.updateCommentCount(vo, true);

			} catch (Exception e) {
				e.printStackTrace();
				//디버깅
				System.out.println("WriteReplyAction - 댓글 등록 중 예외 발생: " + e.getMessage());
			}
		}
		//JSON 데이터로 변환
		return StringUtil.parseJSON(request, mapAjax);

	}

}
