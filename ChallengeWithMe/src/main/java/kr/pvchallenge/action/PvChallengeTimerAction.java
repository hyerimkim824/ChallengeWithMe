package kr.pvchallenge.action;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.pvchallenge.vo.PvChallengeVO;
import kr.util.StringUtil;

public class PvChallengeTimerAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			Map<String, String> mapAjax = new HashMap<String, String>();
		
		HttpSession session = request.getSession();
		
		Long us_num = 
				(Long)session.getAttribute("us_num");
		
		PvChallengeDAO dao = PvChallengeDAO.getInstance();

		if(us_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");}
		else {
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			//자바빈 생성
			PvChallengeVO pvchall = new PvChallengeVO();
			
			// 현재 시간 (LocalTime 객체)
	        LocalTime now = LocalTime.now();
	        
	        // 시간 형식 지정 (HH:mm)
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
	        
	        // LocalTime을 문자열로 변환
	        String timeString = now.format(formatter);
	       
	
			String st_time = timeString;
			
			System.out.println(st_time);
			mapAjax.put("st_time",st_time);
			
		}
		
		//JSON 데이터로 변환
		return StringUtil.parseJSON(request, mapAjax);
	}

}
 