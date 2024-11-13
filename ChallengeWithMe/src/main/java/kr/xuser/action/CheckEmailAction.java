package kr.xuser.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.util.StringUtil;
import kr.xuser.dao.XuserDAO;

public class CheckEmailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		
		XuserDAO dao = XuserDAO.getInstance();
		boolean check = dao.checkEmail(email);
		
		Map<String, String> Ajax = new HashMap<String, String>();
		if(check) { // 이메일 중복
			Ajax.put("result", "emailDuplicated");
		}else { // 이메일 미중복
			Ajax.put("result", "emailNotFound");
		}
		return StringUtil.parseJSON(request, Ajax);
	}

}
