package kr.post.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.FileUtil;
import kr.util.StringUtil;
import kr.xuser.vo.XuserVO;

public class DeleteFileAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> mapAjax = new HashMap<String,String>();

		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");

		if(us_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");

		}else {//로그인이 된 경우
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");

			//전송된 데이터 반환
			long post_num = Long.parseLong(request.getParameter("post_num"));

			PostDAO Dao = PostDAO.getInstance();
			PostVO db_post = Dao.getpost(post_num);

			//MyPageDAO dao = MyPageDAO.getInstance();
			//XuserVO user = dao.getMyInfo(us_num);

			//로그인한 회원번호와 작성자 회원번호 일치 여부 체크
			if(us_num!=db_post.getUs_num()) {
				mapAjax.put("result", "wrongAccess");
			
			}else if(us_num==db_post.getUs_num()){
				Dao.deleteFile(post_num);
				mapAjax.put("result", "success");
				//파일 삭제
				FileUtil.removeFile(request, db_post.getPost_img());
			}
		}
		//JSON 데이터로 변환
		return StringUtil.parseJSON(request, mapAjax);
	}

}
