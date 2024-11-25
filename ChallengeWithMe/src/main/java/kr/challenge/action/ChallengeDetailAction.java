package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class ChallengeDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		long ch_num = Long.parseLong(request.getParameter("ch_num"));
		ChallengeVO chall = dao.getChallengeDetail(ch_num);
		dao.plusView(chall);
		
		String[] auth_name = {"사진 인증", "시간 인증", "문구 인증", "QR 인증", "게임 인증", "가계부 인증", "줌 인증"};
		
		MyPageDAO mp_dao = MyPageDAO.getInstance();
		
		XuserVO user = mp_dao.getMyInfo(chall.getUs_num());
		
		String us_nickname = user.getNickname();
		
		request.setAttribute("chall", chall);
		request.setAttribute("us_nickname", us_nickname);
		request.setAttribute("auth_name", auth_name);
		return "/challenge/challenge_detail.jsp?";
	}
	
	
}
