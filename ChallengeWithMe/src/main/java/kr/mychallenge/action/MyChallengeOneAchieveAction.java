package kr.mychallenge.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;

public class MyChallengeOneAchieveAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		HttpSession session = request.getSession();
		String pageNum = request.getParameter("pageNum");
		
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/loginForm.do";
		}
		
		/*
		 * 관리자 관련
		 * Integer user_auth = 
				(Integer)session.getAttribute("user_auth");
		if(user_auth!=9) {//관리자로 로그인하지 않은 경우
			return "common/notice.jsp";
		}*/
		
		String ch_start = (String)session.getAttribute("ch_start");
		String ch_end = (String)session.getAttribute("ch_end");
		
		List<Integer> list = null;
		
		MyChallengeDAO dao = MyChallengeDAO.getInstance();
		
		list = dao.AchieveOne(us_num, ch_start, ch_end);
		
		request.setAttribute("list", list);
		request.setAttribute("listLength", list.size());
		
		return "mychallenge/myChallengeMain.jsp";
		
	}

}
