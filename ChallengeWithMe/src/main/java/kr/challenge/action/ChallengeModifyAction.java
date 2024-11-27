package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.controller.Action;

public class ChallengeModifyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		
		Long ch_num = Long.parseLong(request.getParameter("ch_num"));
		
		String ch_desc = request.getParameter("ch_desc");
		String auth_desc = request.getParameter("auth_desc");
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		dao.updateChallenge(ch_desc, auth_desc, ch_num);
		
		return "challenge/challenge_list.jsp";
	}

}
