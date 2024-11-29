package kr.pvchallenge.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.util.FileUtil;
import kr.util.StringUtil;

public class UpdateMyPvPhotoAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		Map<String, String> mapAjax = new HashMap<String,String>();
		HttpSession session = request.getSession();
		
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num==null) {
			mapAjax.put("result","logout");
		}
		else {
			//로그인 된 경우
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			//파일 업로드 처리
			String photo = FileUtil.uploadFile(request,"photo");
			
		PvChallengeDAO dao = PvChallengeDAO.getInstance();
		
		dao.insertPvImg(photo, us_num);
		
		//이전 파일 삭제 처리
		String user_photo = (String)session.getAttribute("user_photo");
		
		FileUtil.removeFile(request, user_photo);
		
		//현재 파일로 세션 정보 갱신
		session.setAttribute("user_photo", photo);
		
		mapAjax.put("result", "success");
	}
	//JSON 데이터로 변환
	return StringUtil.parseJSON(request, mapAjax);
		
	}

} 
