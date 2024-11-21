package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;

public class ChallengeDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long ch_num = Long.parseLong(request.getParameter("ch_num"));
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		ChallengeVO chall = dao.getChallengeDetail(ch_num);
		
		request.setAttribute("chall", chall);
		
		return "challenge_detail.jsp?";
	}
	
	
}
