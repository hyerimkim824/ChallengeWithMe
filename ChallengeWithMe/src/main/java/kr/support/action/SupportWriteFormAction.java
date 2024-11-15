package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class SupportWriteFormAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인 정보 확인 🐇
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("user_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않으면 로그인 필요 안내 페이지로 이동 🥕
            return "support/loginRequired.jsp";
        }

        // 2. 작성 폼으로 이동 🐰
        return "support/supportWrite.jsp"; // JSP로 이동 (문의 작성 화면)
    }
}
