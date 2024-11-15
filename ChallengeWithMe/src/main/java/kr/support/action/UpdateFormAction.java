package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;
import kr.controller.Action;
import kr.util.StringUtil;

public class UpdateFormAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인된 사용자 정보 확인 🐇
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("user_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않은 경우 🐰
            return "support/loginRequired.jsp"; // 로그인 필요 안내 페이지로 이동
        }

        // 2. 요청에서 수정하려는 문의 번호를 가져오기 🐇
        String supNumParam = request.getParameter("sup_num");
        if (supNumParam == null || supNumParam.isEmpty()) {
            return "support/notFound.jsp"; // 잘못된 접근 처리
        }

        long supNum = Long.parseLong(supNumParam);

        // 3. DAO를 통해 문의 데이터 가져오기 🐰
        SupportDAO dao = SupportDAO.getInstance(); // 싱글톤 인스턴스 사용
        SupportVO support = dao.getSupportById(supNum);

        if (support == null) {
            // 문의가 존재하지 않을 경우 🐇
            return "support/notFound.jsp"; // 데이터가 없다는 페이지로 이동
        }

        if (!userNum.equals(support.getUs_num())) {
            // 로그인된 사용자와 작성자가 다를 경우 🐇
            return "support/unauthorized.jsp"; // 권한 없음 페이지로 이동
        }

        // 4. 제목 및 내용을 HTML 이스케이프 처리 🐰
        support.setSup_title(StringUtil.parseQuot(support.getSup_title()));
        support.setSup_content(StringUtil.parseQuot(support.getSup_content()));

        // 5. 요청 객체에 문의 데이터를 설정 🐇
        request.setAttribute("support", support);

        // 6. 수정 폼 페이지로 이동 🐰
        return "support/updateForm.jsp";
    }
}
