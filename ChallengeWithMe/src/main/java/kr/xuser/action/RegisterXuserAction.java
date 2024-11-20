package kr.xuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class RegisterXuserAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 데이터 인코딩
		request.setCharacterEncoding("utf-8");
		String gen = "남";
		
		// 자바빈 생성
		XuserVO xuser = new XuserVO();
		xuser.setId(request.getParameter("id"));
		xuser.setPasswd(request.getParameter("pwd"));
		xuser.setNickname(request.getParameter("nick"));
		xuser.setEmail(request.getParameter("email"));
		xuser.setName(request.getParameter("name"));
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
		
		XuserDAO dao = XuserDAO.getInstance();
		dao.insertUser(xuser);
		
		// JSP 경로 반환
		return "main/main.jsp";
	}

}
