package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

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
		
		MyPageDAO mp_dao = MyPageDAO.getInstance();
		XuserVO mp_vo = mp_dao.getMyInfo(us_num);
		
		String us_nickname = mp_vo.getNickname();
		
		request.setAttribute("chall", chall);
		request.setAttribute("us_nickname", us_nickname);
		
		return "/challenge/challenge_modifyForm.jsp";
	}

}
