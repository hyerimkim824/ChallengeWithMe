package kr.mypage.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.badge.vo.BadgeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.util.FileUtil;
import kr.util.StringUtil;

public class AdminBadgeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> mapAjax = new HashMap<String, String>();
		request.setCharacterEncoding("utf-8");
		
		BadgeVO badge = new BadgeVO();
		badge.setBg_img(FileUtil.uploadFile(request, "photo"));
		badge.setBg_name(request.getParameter("bg_name"));
		badge.setBg_desc(request.getParameter("bg_desc"));
		
		MyPageDAO dao = MyPageDAO.getInstance();
		dao.insertBadge(badge);
		
		mapAjax.put("result", "success");
		return StringUtil.parseJSON(request, mapAjax);
	}
}
