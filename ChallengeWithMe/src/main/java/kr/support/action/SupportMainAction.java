package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class SupportMainAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐥 챌린지 사용 가이드 페이지로 이동
        try {
            // 챌린지 사용 관련 데이터 로드가 필요한 경우 처리 (예: 도움말 콘텐츠)
            // request.setAttribute("challengeGuide", guideContent);

            return "support/supportMain.jsp"; // JSP 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "챌린지 도움말 로드 중 오류가 발생했습니다. 🐇");
            return "support/notfound.jsp"; // 오류 페이지로 이동
        }
    }
}
