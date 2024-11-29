package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class LoginaAcountAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐥 로그인 및 계정 관련 자주 묻는 질문 페이지로 이동
        try {
          

            return "support/loginAcount.jsp"; // JSP 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "데이터 처리 중 오류가 발생했습니다. 🐇");
            return "error/500.jsp"; // 오류 페이지로 이동
        }
    }
}
