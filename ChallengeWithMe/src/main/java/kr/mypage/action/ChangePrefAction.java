package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;

public class ChangePrefAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String selectedIds = request.getParameter("selectedIds");
		MyPageDAO dao = MyPageDAO.getInstance();
		
		return null;
	}

}
