package kr.xuser.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.util.StringUtil;
import kr.xuser.dao.XuserDAO;

public class CheckDuplicatedNickAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String nick = request.getParameter("nick");
		
		XuserDAO dao = XuserDAO.getInstance();
		boolean check = dao.checkNick(nick);

		Map<String, String> Ajax = new HashMap<String, String>();
		if(check) { // 닉네임 중복
			Ajax.put("result", "nickDuplicated");
		}else { // 닉네임 미중복
			Ajax.put("result", "nickNotFound");
		}
		return StringUtil.parseJSON(request, Ajax);
	}
	
}
