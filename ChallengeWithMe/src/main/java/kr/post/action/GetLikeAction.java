package kr.post.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostLikeVO;
import kr.util.StringUtil;

public class GetLikeAction implements Action{

	@Override 
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 *  좋아요 Action 구현의 기본 흐름
		 *	
		1. 사용자가 좋아요 버튼을 클릭 (클라이언트에서 요청 발생).
		2. 좋아요 요청 데이터 전달 (게시글 번호와 사용자 번호).
		3.서버에서 요청 처리: 사용자가 이미 좋아요를 눌렀는지 확인. 눌렀다면 좋아요를 취소, 누르지 않았다면 좋아요 추가.
		4. 결과를 클라이언트로 반환: 성공 여부와 현재 좋아요 상태 (좋아요 취소 또는 추가 결과).
		5. UI 업데이트: 클라이언트에서 결과를 받아 화면에 반영.
		 */
		request.setCharacterEncoding("utf-8");
		
		long post_num = Long.parseLong(request.getParameter("post_num"));
		
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Long us_num=(Long)session.getAttribute("us_num");
		PostDAO dao = PostDAO.getInstance();
		if(us_num==null) {
			mapAjax.put("result", "logout");
		}else {
			PostLikeVO postlike = dao.selectLike(new PostLikeVO(post_num,us_num));
			
			if(postlike!=null) {
				mapAjax.put("status", "yesLike");
			}else {
				mapAjax.put("status", "noLike");
			}
		}
		//좋아요 개수
		mapAjax.put("count",dao.getLikeCount(post_num));
		
		return StringUtil.parseJSON(request, mapAjax);
	}

}
