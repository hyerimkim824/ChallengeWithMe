package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;

public class ChangePrefAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		Long us_num = (Long)session.getAttribute("us_num");
		String selectedIds = request.getParameter("selectedIds");
		
		MyPageDAO dao = MyPageDAO.getInstance();
		dao.updatePref(selectedIds, us_num);
		
		return "mypage/changeprefform.jsp";
	}

}
