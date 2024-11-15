package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class MyPageAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) { // 로그인X
			return "redirect:/xuser/loginForm.do";
		}
		// 로그인O
		MyPageDAO dao = MyPageDAO.getInstance();
		XuserVO xuser = dao.getMyInfo(us_num);
		
		// 선호 카테고리
		MyPageDAO dao2 = MyPageDAO.getInstance();
		List<String> preName = dao2.pref(us_num);
		
		// 뱃지 정보
		MyPageDAO dao3 = MyPageDAO.getInstance();
		List<Integer> bgInfo = dao3.getBadgeInfo(us_num);
		
		request.setAttribute("bgInfo", bgInfo);
		request.setAttribute("preName", preName);
		request.setAttribute("xuser", xuser);
		
		return "/mypage/mypage.jsp";
	}

}
