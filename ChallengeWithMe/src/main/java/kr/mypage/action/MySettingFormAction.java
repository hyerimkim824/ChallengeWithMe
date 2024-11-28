package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class MySettingFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) { // 로그인이 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
			
		}
		request.setCharacterEncoding("utf-8");
		
		MyPageDAO dao = MyPageDAO.getInstance();
		XuserVO xuser = dao.getMyInfo(us_num);
		
		List<String> like = dao.selectChallLike(us_num);
		List<Long> ch_num = dao.getLikeChallNum(us_num);
		
		request.setAttribute("xuser", xuser);
		request.setAttribute("like", like);
		request.setAttribute("ch_num", ch_num);
		
		String alarm = request.getParameter("alarm");
		if(alarm != null) {
			dao.updateAlarm(us_num, Integer.parseInt(request.getParameter("alarm")));
		}
		
		return "mypage/mysetting.jsp";
	}
	
}
