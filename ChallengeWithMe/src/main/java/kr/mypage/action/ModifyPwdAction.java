package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class ModifyPwdAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String cpwd = request.getParameter("cpwd");
		
		String us_id = (String)session.getAttribute("us_id");
		
		XuserDAO dao = XuserDAO.getInstance();
		XuserVO xuser = dao.checkUser(id);
		MyPageDAO dao2 = MyPageDAO.getInstance();
		boolean check = false;
		
		if(xuser!=null && id.equals(us_id)) {
			check = xuser.isCheckedPassword(pwd);
		}
		if(check) {
			dao2.updatePwd(cpwd, us_num);
		}
		
		request.setAttribute("check", check);
		
		return "mypage/modifyPwd.jsp";
	}

}
