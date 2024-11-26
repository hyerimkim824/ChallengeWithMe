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

public class WriteLikeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		
		HttpSession session = request.getSession();		
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else {//로그인이 된 경우
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			//전송된 데이터 반환
			String postNumStr = request.getParameter("post_num");
			if (postNumStr == null || postNumStr.isEmpty()) {
			    System.out.println("post_num 값이 전달되지 않았습니다."); // 디버깅 로그
			    mapAjax.put("result", "error");
			    mapAjax.put("message", "post_num is missing");
			    return StringUtil.parseJSON(request, mapAjax);
			}
			//long post_num = Long.parseLong(postNumStr);
			long post_num = Long.parseLong(request.getParameter("post_num"));
			
			System.out.println("전달된 post_num 값: " + post_num); // 전달된 post_num 값 로그 출력
			
			PostLikeVO likeVO = new PostLikeVO();
			likeVO.setPost_num(post_num);
			likeVO.setUs_num(us_num);

			PostDAO dao = PostDAO.getInstance();
			//좋아요 등록 여부 체크
			PostLikeVO db_like = dao.selectLike(likeVO);
			
			System.out.println("좋아요 등록 호출 준비: post_num = " + post_num + ", us_num = " + us_num); // 확인

			dao.insertLike(likeVO); // 여기에서 insertLike 호출
			System.out.println("좋아요 등록 호출 완료"); // 이 메시지가 출력되지 않으면 insertLike 내부에서 문제 발생
			
			
			if(db_like!=null) {//좋아요가 눌러져있는 경우
				//좋아요 삭제
				dao.deletetLike(likeVO);
				mapAjax.put("status", "nolike");
			}else {//좋아요가 눌러있지 않은 경우
				mapAjax.put("status", "yeslike");
			}
			
			mapAjax.put("result", "success");
			//갯수 반환 안되면 dao에서 좋아요 목록 작업 해서 그거로 넣어야함
			mapAjax.put("count", dao.getLikeCount(post_num));
			System.out.println("좋아요 개수: " + dao.getLikeCount(post_num));
		}
		
		return StringUtil.parseJSON(request, mapAjax);
	}

}
