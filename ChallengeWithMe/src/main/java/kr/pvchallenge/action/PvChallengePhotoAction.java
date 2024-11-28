package kr.pvchallenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.pvchallenge.vo.PvChallengeVO;

public class PvChallengePhotoAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // 세션에서 사용자 번호(us_num)를 가져옴
        HttpSession session = request.getSession();
        Long us_num = (Long) session.getAttribute("us_num");
        
        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        if (us_num == null) {
            return "redirect:/xuser/loginForm.do";
        }

        // 사용자 번호를 이용하여 도전 정보 조회
        PvChallengeDAO dao = PvChallengeDAO.getInstance();
        PvChallengeVO challengeInfo = dao.getPvInfo(us_num);
        
        // 도전 정보가 없으면 오류 페이지로 리다이렉트
        if (challengeInfo == null) {
            request.setAttribute("errorMessage", "도전 정보가 없습니다.");
            return "pvchallenge/errorPage.jsp";  // 필요한 경우 오류 페이지로 이동
        }
        
        // 조회된 도전 데이터를 JSP로 전달
        System.out.println(challengeInfo.getCh_num());
        System.out.println(challengeInfo.getAh_img());
        session.setAttribute("ch_num", challengeInfo.getCh_num());
        session.setAttribute("ch_proved", challengeInfo.getCh_proved());
        session.setAttribute("ah_date", challengeInfo.getAh_date());
        session.setAttribute("ah_img", challengeInfo.getAh_img());
        
        // 도전 사진 페이지로 이동
        return "pvchallenge/pvChallengePhoto.jsp";
    }
}
 