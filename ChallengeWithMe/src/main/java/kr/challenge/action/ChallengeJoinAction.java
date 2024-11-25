package kr.challenge.action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.participant.dao.ParticipantDAO;
import kr.participant.vo.ParticipantVO;

public class ChallengeJoinAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		 HttpSession session = request.getSession(); Long us_num =
		 (Long)session.getAttribute("us_num");
		 
		 if(us_num == null) { return "redirect:/xuser/registerXuserForm.do"; }
		 
		 Long ch_num = Long.parseLong(request.getParameter("ch_num"));
		 
		 ChallengeDAO c_dao = ChallengeDAO.getInstance(); 
		 ChallengeVO c_vo = c_dao.getChallengeDetail(ch_num);
		 
		 ParticipantDAO p_dao = ParticipantDAO.getInstance(); 
		 ParticipantVO p_vo = new ParticipantVO();
		 
		 p_vo.setUs_num(us_num); p_vo.setCh_num(ch_num);
		  
		 LocalDate today = LocalDate.now(); DateTimeFormatter formatter =
		 DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 문자열 형식 
		 
		 LocalDate start_date = LocalDate.parse(c_vo.getCh_start(), formatter); 
		 
		 LocalDate end_date = LocalDate.parse(c_vo.getCh_end(), formatter);
		  
		 String p_stat = null;
		 
		 if(today.compareTo(start_date) < 0) { p_stat = "시작 전"; }else
		 if(today.compareTo(start_date) >= 0 && today.compareTo(end_date) < 0) {
		 p_stat = "진행 중"; }else { p_stat = "완료"; }
		 
		 p_vo.setUs_num(us_num); p_vo.setCh_num(ch_num); p_vo.setP_stat(p_stat);
		 p_vo.setP_date(String.valueOf(today));
		 
		 p_dao.joinChallenge(p_vo, p_stat);
		 
		
		return "/challenge/challenge_join.jsp";
	}

}
