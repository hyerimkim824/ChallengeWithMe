package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class UpdateMyPhotoFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		MyPageDAO dao = MyPageDAO.getInstance();
		
		XuserVO xuser = dao.getMyInfo(us_num);
		request.setAttribute("xuser", xuser);
		return "mypage/UpdateMyPhoto.jsp";
	}

}
