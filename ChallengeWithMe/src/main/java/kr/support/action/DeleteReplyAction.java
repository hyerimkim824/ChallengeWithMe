package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.support.dao.SupportDAO;

public class DeleteReplyAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인 정보 확인 🐇
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("user_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않으면 로그인 필요 페이지로 이동 🥕
            return "support/loginRequired.jsp";
        }

        // 2. 삭제할 답변 번호 가져오기 🐰
        String supNumParam = request.getParameter("sup_num");
        if (supNumParam == null || supNumParam.isEmpty()) {
            return "support/invalidAccess.jsp"; // 답변 번호가 없으면 에러 처리
        }

        long supNum = Long.parseLong(supNumParam);

        // 3. DAO를 통해 답변 데이터 가져오기 🐇
        SupportDAO dao = SupportDAO.getInstance(); // DAO 싱글톤 인스턴스 사용
        long replyWriter = dao.getWriterId(supNum); // 답변 작성자 ID 가져오기

        if (replyWriter != userNum) {
            // 작성자와 로그인한 사용자가 다르면 권한 없음 페이지로 이동 🥕
            return "support/unauthorized.jsp";
        }

        // 4. 답변 삭제 처리 🐰
        dao.deleteSupport(supNum);

        // 5. 삭제 성공 후 상세 페이지로 이동 🐇
        String redirectURL = "support/Detail.do?sup_num=" + request.getParameter("parent_sup_num");
        return "redirect:" + redirectURL; // 원래 문의 상세 페이지로 리다이렉트
    }
}
