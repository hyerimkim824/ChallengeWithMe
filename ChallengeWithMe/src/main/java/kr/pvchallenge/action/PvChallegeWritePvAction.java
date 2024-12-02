package kr.pvchallenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.controller.Action;
import kr.mychallenge.vo.MyChallengeVO;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.pvchallenge.vo.PvChallengeVO;

public class PvChallegeWritePvAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.do";
		}else{
		
		PvChallengeDAO dao = PvChallengeDAO.getInstance();
        PvChallengeVO challengeInfoAll= dao.getPvInfoAll(us_num);
		
      
		
		}
		return null;
	}

}
