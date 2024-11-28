package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class MySettingAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) { // 로그인X
			return "redirect:/xuser/loginForm.do";
		}
		
		MyPageDAO dao = MyPageDAO.getInstance();
		XuserVO xuser = dao.getMyInfo(us_num);
		
		List<String> like = dao.selectChallLike(us_num);
		
		request.setAttribute("xuser", xuser);
		request.setAttribute("like", like);
		
		return "/mypage/mysetting.jsp";
	}

}
