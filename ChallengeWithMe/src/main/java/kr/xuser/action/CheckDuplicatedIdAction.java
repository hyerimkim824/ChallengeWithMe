package kr.xuser.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.util.StringUtil;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class CheckDuplicatedIdAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		XuserDAO dao = XuserDAO.getInstance();
		XuserVO xuser = dao.checkUser(id);
		
		Map<String, String> Ajax = new HashMap<String, String>();
		if(xuser == null) { // 아이디 미중복
			Ajax.put("result", "idNotFound");
		}else { // 아이디 중복
			Ajax.put("result", "idDuplicated");
		}
		return StringUtil.parseJSON(request, Ajax);
	}
	
}
