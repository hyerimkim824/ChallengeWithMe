package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class AdminBadgeFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		Integer admin = (Integer)session.getAttribute("admin");
		if(admin < 1) {
			return "redirect:/main/main.do";
		}
		return "mypage/adminbadge.jsp";
	}

}
