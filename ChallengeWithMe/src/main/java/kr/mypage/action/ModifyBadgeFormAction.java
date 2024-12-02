package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.badge.vo.BadgeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class ModifyBadgeFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) { // 로그인이 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
			
		}
		
		MyPageDAO dao = MyPageDAO.getInstance();
		XuserVO xuser = dao.getMyInfo(us_num);
		
		List<BadgeVO> list = null;
		list = dao.selectBadge();
		
		request.setAttribute("list", list);
		request.setAttribute("xuser", xuser);
		return "mypage/modifybadge.jsp";
	}
}
