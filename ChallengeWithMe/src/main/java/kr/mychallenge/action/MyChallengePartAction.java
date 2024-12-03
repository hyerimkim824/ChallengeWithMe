package kr.mychallenge.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengePartAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		// 로그인 된 경우
		MyChallengeDAO dao = MyChallengeDAO.getInstance();

		if (us_num == null) {
			// 로그인 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
		}else {
			
			
			List<MyChallengeVO> part_list = null; 
			
			part_list = dao.getPartInfo(us_num);
			
			request.setAttribute("part_list", part_list);
			
			//int ch_num = session.getParameter("ch_num");
			
			 
			//MyChallengeVO img = dao.getImage(1);
		 	 
			
			
		
			
			
			
			
		
		}
		
		return "mychallenge/myChallengePart.jsp";
	}
}
