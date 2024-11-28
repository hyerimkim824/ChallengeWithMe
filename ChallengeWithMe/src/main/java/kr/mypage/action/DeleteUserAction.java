package kr.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.util.FileUtil;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class DeleteUserAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		String us_id = (String)session.getAttribute("us_id");
		XuserDAO dao = XuserDAO.getInstance();
		MyPageDAO dao2 = MyPageDAO.getInstance();
		XuserVO xuser = dao.checkUser(id);
		boolean check = false;
		
		// 사용자가 입력한 아이디가 존재하고 로그인한 아이디와 일치하는지 체크
		// 입력한 이메일과 저장된 이메일이 일치 여부 체크
		if(xuser !=null && id.equals(us_id) && email.equals(xuser.getEmail())) {
			// 비밀번호 일치 여부 체크
			check = xuser.isCheckedPassword(pwd);
		}
		if(check) { // 인증 성공
			// 회원정보 삭
			dao2.deleteUser(us_num);
			// 프로필 사진 삭제
			FileUtil.removeFile(request, xuser.getImg());
			// 로그아웃
			session.invalidate();
		}
		request.setAttribute("check", check);
		return "mypage/deleteUser.jsp";
	}

}
