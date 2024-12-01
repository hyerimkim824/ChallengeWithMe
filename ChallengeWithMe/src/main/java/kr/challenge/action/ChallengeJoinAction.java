package kr.challenge.action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.adminWallet.vo.AdminWalletVO;
import kr.adminWalletDAO.AdminWalletDAO;
import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.participant.dao.ParticipantDAO;
import kr.participant.vo.ParticipantVO;
import kr.score.action.RefreshUserScore;
import kr.trans.dao.TransDAO;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class ChallengeJoinAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		 HttpSession session = request.getSession(); 
		 Long us_num = (Long)session.getAttribute("us_num");
		 
		 if(us_num == null) { return "redirect:/xuser/registerXuserForm.do"; }
		 
		 Long ch_num = Long.parseLong(request.getParameter("ch_num"));
		 String price = request.getParameter("price");
		 
		 
		 ChallengeDAO c_dao = ChallengeDAO.getInstance(); 
		 ChallengeVO c_vo = c_dao.getChallengeDetail(ch_num);
		 
		 //거래 정보
		 AdminWalletDAO adminW_dao = AdminWalletDAO.getInstance();
		 AdminWalletVO adminW_vo = adminW_dao.getAdminWallet();
		 
		 TransDAO trans_dao = TransDAO.getInstance();
		 boolean adminHasBal = adminW_dao.updateBalance(adminW_vo, true, Integer.parseInt(price));
		 
		 
		 
		 
		 LocalDate today = LocalDate.now(); DateTimeFormatter formatter =
		 DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 문자열 형식 
		 
		 
		 
		 if(c_vo.getCh_status().equals("finished")) {
			 request.setAttribute("notice_msg", "이미 종료된 챌린지입니다");
			 request.setAttribute("notice_url", "../challenge/challengeList.do");
			 
			 return "../views/common/alert_view.jsp";
		 }
		 
		 if(adminHasBal) {
			 trans_dao.setTransaction(99, us_num, ch_num, Integer.parseInt(price), 0);
		 }else {
			 request.setAttribute("notice_msg", "관리자 계정의 잔고가 부족합니다. 고객센터에 문의하세요");
			 request.setAttribute("notice_url", "../main/main.do");
			 
			 return "../views/common/alert_view.jsp";
		 }
		 
		//유저 잔고 정보
		 XuserDAO x_dao = XuserDAO.getInstance();
		 MyPageDAO mp_dao = MyPageDAO.getInstance();
		 XuserVO x_vo = mp_dao.getMyInfo(us_num);
		 
		 String curr_bal = x_vo.getWallet();
		 Integer left_bal = Integer.parseInt(curr_bal) - Integer.parseInt(price);
		 
		 String bal = String.valueOf(left_bal);
		 x_dao.updateWallet(us_num, bal);
		 
		 //참여 정보
		 ParticipantDAO p_dao = ParticipantDAO.getInstance(); 
		 ParticipantVO p_vo = new ParticipantVO();
		 
		 p_vo.setUs_num(us_num); 
		 p_vo.setCh_num(ch_num); 
		 p_vo.setP_stat(c_vo.getCh_status());
		 p_vo.setP_date(String.valueOf(today));
		 
		 
		 
		 
		 //참가 데이터베이스 참가기록 추가
		 p_dao.joinChallenge(p_vo, c_vo.getCh_status());
		 //챌린지 데이터베이스 참가자 수 + 1
		 c_dao.updatePeopleNum(c_vo, true);
		 
		 RefreshUserScore us_score = new RefreshUserScore();
		 us_score.refresh(us_num);
		 
		
		 request.setAttribute("notice_msg", "챌린지 참가 완료");
		 request.setAttribute("notice_url", "../challenge/challengeDetail.do?ch_num="+ch_num);
		 
		 return "../views/common/alert_view.jsp";
	}

}
