package kr.challenge.action;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class ChallengeGameAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			request.setAttribute("notice_msg", "로그인이 필요합니다");
			request.setAttribute("notice_url", "redirect:/xuser/login.do");
			
			return "../common/alert_view.jsp";
		}
		
		Integer game_num = Integer.parseInt(request.getParameter("game_num"));
		request.setAttribute("game_num", game_num);
		
		
		
		return "/challenge/challenge_game.jsp";
	}
	
	

}
