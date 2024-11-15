package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.support.dao.SupportDAO;

import java.io.File;

public class DeleteFileAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인 정보 확인 🐇
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("user_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않으면 로그인 필요 안내 페이지로 이동 🥕
            return "support/loginRequired.jsp";
        }

        // 2. 삭제할 파일이 속한 문의 번호 가져오기 🐰
        String supNumParam = request.getParameter("sup_num");
        if (supNumParam == null || supNumParam.isEmpty()) {
            return "support/invalidAccess.jsp"; // 문의 번호가 없으면 에러 처리
        }

        long supNum = Long.parseLong(supNumParam);

        // 3. DAO를 통해 문의 정보 가져오기 🐇
        SupportDAO dao = SupportDAO.getInstance(); // DAO 싱글톤 인스턴스 사용
        String filePath = dao.getFilePath(supNum); // 파일 경로 가져오기
        long writerId = dao.getWriterId(supNum);   // 작성자 ID 가져오기

        if (writerId != userNum) {
            // 작성자와 로그인한 사용자가 다르면 권한 없음 페이지로 이동 🥕
            return "support/unauthorized.jsp";
        }

        // 4. 서버에서 파일 삭제 처리 🐰
        if (filePath != null && !filePath.isEmpty()) {
            File file = new File(request.getServletContext().getRealPath("/") + filePath);
            if (file.exists()) {
                file.delete(); // 파일 삭제
            }
        }

        // 5. 데이터베이스에서 파일 경로 제거 🐇
        dao.deleteFilePath(supNum);

        // 6. 완료 후 상세 페이지로 리다이렉트 🐰
        return "redirect:/support/Detail.do?sup_num=" + supNum; // 원래 문의 상세 페이지로 이동
    }
}
