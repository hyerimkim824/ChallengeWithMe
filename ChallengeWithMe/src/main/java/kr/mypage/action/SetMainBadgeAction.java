package kr.mypage.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.util.StringUtil;

public class SetMainBadgeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		Map<String, String> mapAjax = new HashMap<String, String>();
		
		Long us_num = (Long)session.getAttribute("us_num");
		Long bg_num = Long.parseLong(request.getParameter("bg_num"));
		
		MyPageDAO dao = MyPageDAO.getInstance();
		dao.setMainBadge(us_num, bg_num);
		
        mapAjax.put("result", "success");

        return StringUtil.parseJSON(request, mapAjax);
	}

}
