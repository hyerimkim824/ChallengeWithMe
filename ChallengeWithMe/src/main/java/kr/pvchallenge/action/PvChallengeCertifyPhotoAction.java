package kr.pvchallenge.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.util.StringUtil;

public class PvChallengeCertifyPhotoAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // 전송된 데이터 인코딩 타입 지정
        request.setCharacterEncoding("utf-8");
        
        HttpSession session = request.getSession();
         
        // 세션에서 유저 번호와 챌린지 번호 가져오기
        Long us_num = (Long) session.getAttribute("us_num");
        Long ch_num = (Long) session.getAttribute("ch_num");
        
        // 결과를 담을 Map 생성
        Map<String, String> mapAjax = new HashMap<String, String>();
        
        // 로그인 체크
        if (us_num == null) {  // 로그인이 되지 않은 경우
            mapAjax.put("result", "logout");
        } else {
            // 세션에서 인증 이미지 가져오기
            String pv_img = (String) session.getAttribute("ah_img");
            
            System.out.println(pv_img);
            
            // 이미지가 없거나 기본 이미지일 경우 인증 실패 처리
            if (pv_img == null || pv_img.isEmpty() || pv_img.equals("0945acd9-bb8a-47a3-82b8-d8c9ceffb300.jpg")) {
                mapAjax.put("result", "fail");
            } else {
                // 인증 성공 처리
                mapAjax.put("result", "success");
                // 인증 성공 후 PvInfo 업데이트
                PvChallengeDAO dao = PvChallengeDAO.getInstance();
                dao.updatePvInfo(us_num, ch_num);
            }
        }
        
        // 결과 출력 (디버깅용)
        // System.out.println(mapAjax); // 필요에 따라 로깅으로 대체 가능
        
        // 결과를 JSON으로 변환하여 반환
        return StringUtil.parseJSON(request, mapAjax);
    }
}