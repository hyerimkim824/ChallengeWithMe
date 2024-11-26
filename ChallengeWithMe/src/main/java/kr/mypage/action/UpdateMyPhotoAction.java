package kr.mypage.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.util.FileUtil;
import kr.util.StringUtil;
import kr.xuser.vo.XuserVO;

public class UpdateMyPhotoAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> mapAjax = new HashMap<String, String>();
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			mapAjax.put("result", "logout");
		}else {
			request.setCharacterEncoding("utf-8");
			
			String photo = FileUtil.uploadFile(request, "photo");
			
			MyPageDAO dao = MyPageDAO.getInstance();
			dao.updateImg(photo, us_num);
			
			String user_photo = (String)session.getAttribute("user_photo");
			FileUtil.removeFile(request, user_photo);
			
			session.setAttribute("user_photo", photo);
			mapAjax.put("result", "success");
		}
			return StringUtil.parseJSON(request, mapAjax);
	}

}
