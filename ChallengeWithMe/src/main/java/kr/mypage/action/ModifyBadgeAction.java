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

public class ModifyBadgeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> mapAjax = new HashMap<String, String>();
		request.setCharacterEncoding("utf-8");
		long bg_num = Long.parseLong(request.getParameter("bg_num"));
		
		
		MyPageDAO dao = MyPageDAO.getInstance();
		BadgeVO badge = new BadgeVO();
		String img = FileUtil.uploadFile(request, "bg_img");
		
		badge.setBg_num(bg_num);
		badge.setBg_img(img);
		badge.setBg_name(request.getParameter("bg_name"));
		badge.setBg_desc(request.getParameter("bg_desc"));
		
		dao.updateBadge(badge, bg_num);
		
		mapAjax.put("result", "success");
		return StringUtil.parseJSON(request, mapAjax);
	}

}
