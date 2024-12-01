package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.participant.dao.ParticipantDAO;
import kr.score.action.RefreshUserScore;

public class ChallengeQuitAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		Long ch_num = Long.parseLong(request.getParameter("ch_num"));
		
		if(us_num == null) {
			return "redirect:/xuser.loginForm.do";
		}
		
		ParticipantDAO part_dao = ParticipantDAO.getInstance();
		
		boolean isJoined = part_dao.isJoined(us_num, ch_num);
		
		if(isJoined) {
			part_dao.quitChallenge(us_num, ch_num);
		}
		
		RefreshUserScore us_score = new RefreshUserScore();
		us_score.refresh(us_num);
		
		request.setAttribute("notice_msg", "탈퇴가 완료되었습니다.");
		request.setAttribute("notice_url", "redirect:/challenge/challengeList.do");
		
		return "../common/alert_view.jsp";
	}

}
