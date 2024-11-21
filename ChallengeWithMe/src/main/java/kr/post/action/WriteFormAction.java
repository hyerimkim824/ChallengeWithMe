package kr.post.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;


public class WriteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.jsp";
		}
		
		MyPageDAO dao = MyPageDAO.getInstance();
		XuserVO user = dao.getMyInfo(us_num);
		
		String us_img = user.getImg();
		String us_nickname = user.getNickname();
		
		request.setAttribute("us_img", us_img);
		request.setAttribute("us_nickname", us_nickname);


		return "post/writeForm.jsp";
	}


}


