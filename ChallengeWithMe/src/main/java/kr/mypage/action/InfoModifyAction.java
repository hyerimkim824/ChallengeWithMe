package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class InfoModifyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		String gen = "남";
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		request.setCharacterEncoding("utf-8");
		XuserVO xuser = new XuserVO();
		xuser.setUs_num(us_num);
		xuser.setNickname(request.getParameter("nick"));
		xuser.setEmail(request.getParameter("email"));
		if(gen.equals(request.getParameter("gender"))) {
			xuser.setGen(0);
		}else {
			xuser.setGen(1);
		}
		xuser.setBirth(request.getParameter("birth"));
		xuser.setTel(request.getParameter("tel"));
		xuser.setZipcode(request.getParameter("zipcode"));
		xuser.setAddress1(request.getParameter("address1"));
		xuser.setAddress2(request.getParameter("address2"));
		
		MyPageDAO dao = MyPageDAO.getInstance();
		dao.updateXuser(xuser);
		XuserVO xuser2 = dao.getMyInfo(us_num);
		
		// 선호 카테고리
		MyPageDAO dao2 = MyPageDAO.getInstance();
		List<String> preName = dao2.pref(us_num);
				
		// 뱃지 정보
		MyPageDAO dao3 = MyPageDAO.getInstance();
		List<Integer> bgInfo = dao3.getBadgeInfo(us_num);
				
		request.setAttribute("bgInfo", bgInfo);
		request.setAttribute("preName", preName);
		request.setAttribute("xuser", xuser2);
		
		return "mypage/mypage.jsp";
	}
		
}
