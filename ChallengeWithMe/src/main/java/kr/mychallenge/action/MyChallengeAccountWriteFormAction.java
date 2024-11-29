package kr.mychallenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class MyChallengeAccountWriteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long user_num = (Long)session.getAttribute("us_num");
		if(user_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.do";
		}
		//로그인이 된 경우
		return "mychallenge/myAccountbookWriteForm.jsp";
	}

}
