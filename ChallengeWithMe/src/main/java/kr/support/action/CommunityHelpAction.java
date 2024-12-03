package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class CommunityHelpAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐥 커뮤니티 사용 가이드 페이지로 이동
        try {

            return "/support/communityHelp.jsp"; // JSP 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "커뮤니티 도움말 로드 중 오류가 발생했습니다. 🐇");
            return "support/notfound.jsp"; // 오류 페이지로 이동
        }
    }
}
