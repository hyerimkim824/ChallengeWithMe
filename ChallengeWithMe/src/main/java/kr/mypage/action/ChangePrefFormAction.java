package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.category.dao.CategoryDAO;
import kr.category.vo.CategoryVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class ChangePrefFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		MyPageDAO dao = MyPageDAO.getInstance();
		CategoryDAO dao2 = CategoryDAO.getInstance();
		
		List<CategoryVO> list = null;
		
		list = dao2.getList();
		XuserVO xuser = dao.getMyInfo(us_num);
		
		request.setAttribute("list", list);
		request.setAttribute("xuser", xuser);
		return "mypage/changeprefform.jsp";
	}

}
