package kr.challenge.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class ChallengeCreateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/loginForm.do";
		}
		
		MyPageDAO dao = MyPageDAO.getInstance();
		
		XuserVO user = dao.getMyInfo(us_num);
		
		String us_nickname = user.getNickname();
		String us_img = user.getImg();
		
		request.setAttribute("us_nickname", us_nickname);
		request.setAttribute("us_img", us_img);
		
		ChallengeDAO chall_dao = ChallengeDAO.getInstance();
		String join_code = chall_dao.createRandomCode();
		
		request.setAttribute("join_code", join_code);

		return "challenge/challenge_createForm.jsp";
		
		
	}
	

}
