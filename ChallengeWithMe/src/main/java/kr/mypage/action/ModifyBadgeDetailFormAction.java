package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.badge.vo.BadgeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;

public class ModifyBadgeDetailFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		long bg_num = Long.parseLong(request.getParameter("bg_num"));
		
		MyPageDAO dao = MyPageDAO.getInstance();
		BadgeVO badge = dao.modifyBadge(bg_num);
		
		request.setAttribute("badge", badge);
		return "mypage/modifybadgeform.jsp";
	}

}
