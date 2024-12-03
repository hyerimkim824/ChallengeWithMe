package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class ChallengeGameConfirmAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			request.setAttribute("notice_msg", "계정 접속이 끊어졌습니다. 다시 로그인 해주세요");
			request.setAttribute("notice_url", "redirect:/xuser/login.do");
			
			return "../common/alert_view.jsp";
		}
		
		String confirmed = request.getParameter("confirmed");
		
		//confirmed가 1인 경우 게임 성공으로 인증 성공
		//confirmed가 0이거나 null인 경우 인증 실패
		//애초에 게임 성공을 못하면 action 파일로 못들어오게 막아놔서 confirmed는 1일 것임
		System.out.println(confirmed);
		
		request.setAttribute("notice_msg", "인증이 완료되었습니다");
		request.setAttribute("notice_url", "redirect:/mychallenge/myChallengeMain.do");
		
		return "../common/alert_view.jsp";
	}
	
}
