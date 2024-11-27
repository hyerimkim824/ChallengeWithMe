package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class RefundGuideAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐥 환불 가이드 페이지로 이동하는 로직이에요!
        try {
            // 만약 데이터베이스에서 환불 정보를 로드해야 한다면 여기서 처리 가능!
            // 예: request.setAttribute("refundInfo", refundData);

            // 환불 가이드 페이지로 이동! 🐇
            return "support/refundGuide.jsp"; 
        } catch (Exception e) {
            // 🐰 문제가 생겼다면 여기서 예외를 처리해요!
            e.printStackTrace();
            request.setAttribute("error", "환불 가이드를 불러오는 중 오류가 발생했어요! 🐇");
            return "support/notfound.jsp"; // 오류 페이지로 이동
        }
    }
}
