package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.support.dao.SupportDAO;

public class DeleteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인 정보 확인 🐇
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("us_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않으면 로그인 필요 안내 페이지로 이동 🐰
            return "/support/loginRequired.jsp";
        }

        // 2. 삭제할 문의 번호 가져오기 🐇
        String supNumParam = request.getParameter("sup_num");
        if (supNumParam == null || supNumParam.trim().isEmpty()) {
            // 문의 번호가 없거나 잘못된 경우 에러 페이지로 이동 🐰
            return "support/invalidAccess.jsp";
        }

        long supNum;
        try {
            supNum = Long.parseLong(supNumParam);
        } catch (NumberFormatException e) {
            // 잘못된 번호 형식인 경우 에러 페이지로 이동 🐇
            return "support/invalidAccess.jsp";
        }

        // 3. DAO를 통해 작성자 정보 확인 🐇
        SupportDAO dao = SupportDAO.getInstance(); // DAO 싱글톤 인스턴스 사용
        long writerId = dao.getWriterId(supNum);

        if (writerId == -1) {
            // 해당 문의가 없는 경우 에러 페이지로 이동 🐰
            return "support/invalidAccess.jsp";
        }

        if (writerId != userNum) {
            // 작성자와 로그인한 사용자가 다를 경우 권한 없음 페이지로 이동 🐇
            return "support/unauthorized.jsp";
        }

        // 4. 문의 삭제 🐇
        boolean isDeleted = dao.deleteSupport(supNum);

        if (!isDeleted) {
            // 삭제 실패 시 에러 페이지로 이동 🐰
            return "deleteFailed.jsp";
        }

        // 5. 완료 후 문의 리스트 페이지로 이동 🐇
        return "redirect:/support/List.do";
    }
}
