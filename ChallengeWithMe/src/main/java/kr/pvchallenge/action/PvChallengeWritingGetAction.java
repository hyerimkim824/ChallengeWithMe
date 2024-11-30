package kr.pvchallenge.action;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;

import kr.controller.Action;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.util.StringUtil;

public class PvChallengeWritingGetAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    // 요청 데이터 인코딩 설정
	    request.setCharacterEncoding("utf-8");

	    // 세션에서 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    Long us_num = (Long) session.getAttribute("us_num");
	    Long ch_num = (Long) session.getAttribute("ch_num");

	    // 랜덤 명언 리스트 생성
	    List<String> wise = Arrays.asList(
 	        "시작은 반이 아니다. 시작일뿐이다.",
	        "늦었다고 생각할 때가 정말 늦은 것이다. 당장 시작해라.",
	        "가는 말이 고우면 얕본다",
	        "참일 인 세번이면 호구다.",
	        "헌신하면 헌신짝된다.",
	        "일찍 일어나는 새가 피곤하다.",
	        "일찍 일어난 벌레는 잡아 먹힌다.",
	        "내 너 그럴줄 알았다. 알았으면 제발 미리 말을 해줘라!",
	        "성공은 1%의 재능과 99%의 빽"
	    );

	    // 결과를 담을 Map 생성
	    Map<String, String> mapAjax = new HashMap<String, String>();
	    // 로그인 확인
	    if (us_num == null ) {
	        // 로그인하지 않은 경우
	        mapAjax.put("result", "logout");
	    }else {
	        // 랜덤 명언 선택
	        Random random = new Random();
	        int ran_num = random.nextInt(wise.size()); // 인덱스 범위 제한
	        String ran_wise = wise.get(ran_num);
	        
	         // 명언 추가
	        mapAjax.put("ran_wise", ran_wise);

	        System.out.println("Random Index: " + ran_num); // 디버그용 로그

	        
	        // 클라이언트에서 전달된 사용자 이름 가져오기
	        String username = request.getParameter("wise");
	        System.out.println(username);

	        // 사용자 입력과 명언 비교
	        if (ran_wise.equals(username)) {
	            mapAjax.put("result", "success");

	            // DB 업데이트
	            PvChallengeDAO dao = PvChallengeDAO.getInstance();
	            dao.updatePvInfo3(us_num, ch_num);
	            
	        } else {
	          mapAjax.put("result", "fail");
	        }

	      
	    }
	   

	    // JSON 결과 반환
	    return StringUtil.parseJSON(request, mapAjax);
	}

} 
