package kr.xuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("logid");
		String pwd = request.getParameter("logpwd");
		
		XuserDAO dao = XuserDAO.getInstance();
		XuserVO xuser = dao.checkUser(id);
		boolean check = false;
		
		if(xuser != null) {
			// 비밀번호 일치 체크
			check = xuser.isCheckedPassword(pwd);
			// 계정정지 상태 표시
			request.setAttribute("ban", xuser.getBan());
		}
		
		if(check) { // 성공
			// 로그인 처리
			HttpSession session = request.getSession();
			session.setAttribute("us_num", xuser.getUs_num());
			session.setAttribute("us_nickname", xuser.getNickname());
			session.setAttribute("us_id", xuser.getId());
			session.setAttribute("us_ban", xuser.getBan());
			session.setAttribute("us_img", xuser.getImg());
			session.setAttribute("admin", xuser.getAdmin());
			session.setAttribute("us_wallet", xuser.getWallet());
			
			return "redirect:/main/main.do";
		}
		return "xuser/login.jsp";
	}

}
