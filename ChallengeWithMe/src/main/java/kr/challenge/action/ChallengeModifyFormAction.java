package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;

public class ChallengeModifyFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		long ch_num = Long.parseLong(request.getParameter("ch_num"));
		ChallengeVO chall = dao.getChallengeDetail(ch_num);
		
		request.setAttribute("chall", chall);
		
		return "/challenge/challenge_modifyForm.jsp";
	}

}
