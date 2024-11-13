package kr.xuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class MyPageAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) { // 로그인X
			return "redirect:/xuser/loginForm.do";
		}
		// 로그인O
		XuserDAO dao = XuserDAO.getInstance();
		XuserVO xuser;
		return null;
	}

}
