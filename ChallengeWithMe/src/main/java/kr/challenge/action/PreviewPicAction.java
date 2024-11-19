package kr.challenge.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.util.FileUtil;
import kr.util.StringUtil;

public class PreviewPicAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,String> mapAjax = new HashMap<String,String>();
        HttpSession session = request.getSession();
        Long user_num = (Long)session.getAttribute("us_num");
        if(user_num == null) {//로그인이 되지 않은 경우
            mapAjax.put("result", "logout");
        }else {//로그인 된 경우
            //전송된 데이터 인코딩 처리
            request.setCharacterEncoding("utf-8");
            //파일 업로드 처리
            String photo = FileUtil.uploadFile(request, "photo");

            //이전 파일 삭제 처리
            String user_photo = (String)session.getAttribute("user_photo");
            FileUtil.removeFile(request, user_photo);

            //현재 파일로 세션 정보 갱신    ->       새 정보
            session.setAttribute("user_photo", photo);

            mapAjax.put("result", "success");
        }
		
		return StringUtil.parseJSON(request, mapAjax);
	}

}
