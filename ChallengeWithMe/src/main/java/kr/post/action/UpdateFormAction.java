package kr.post.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.StringUtil;
import kr.xuser.vo.XuserVO;

public class UpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
			
		}else {//로그인이 된 경우
			//detail.jsp onclick에서 post_num을 받아왔기 때문에 parameter값으로 post_num사용 가능
			long post_num = Long.parseLong(request.getParameter("post_num"));
			
			PostDAO Dao = PostDAO.getInstance();
			PostVO post = Dao.getpost(post_num);

			MyPageDAO dao = MyPageDAO.getInstance();
			XuserVO user = dao.getMyInfo(us_num);

			//큰 따옴표 처리(수정폼의 input 태그에만 명시)
			post.setPost_title(StringUtil.parseQuot(post.getPost_title()));

			String us_img = user.getImg();
			String us_nickname = user.getNickname();

			request.setAttribute("us_img", us_img);
			request.setAttribute("us_nickname", us_nickname);
			request.setAttribute("post", post);
			
		}
			return "/post/updateForm.jsp";
	}

}
