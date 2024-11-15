package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.support.dao.SupportDAO;
import kr.support.vo.FeedBackVO;
import kr.controller.Action;

public class FeedBackAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 요청 데이터 인코딩 설정 🐇
        request.setCharacterEncoding("UTF-8");

        try {
            // 🐥 피드백 내용과 사용자 ID 가져오기
            String feedbackContent = request.getParameter("feedback_content");
            String userIdParam = request.getParameter("user_id");

            // 🐥 유효성 검사
            if (feedbackContent == null || feedbackContent.isEmpty() || userIdParam == null || userIdParam.isEmpty()) {
                request.setAttribute("error", "모든 필드를 입력해야 합니다! 🐰");
                return "support/error.jsp"; // 필수 데이터 누락 시 에러 페이지로 이동
            }

            // 🐥 파라미터 데이터 변환
            int userId = Integer.parseInt(userIdParam);

            // 🐇 피드백 객체 생성 및 데이터 설정
            FeedBackVO feedback = new FeedBackVO();
            feedback.setFeedback_content(feedbackContent.trim());
            feedback.setUser_id(userId);
            feedback.setFeedback_date(new java.sql.Date(System.currentTimeMillis())); // 작성 날짜 설정

            // 🐇 DAO를 통해 피드백 저장
            SupportDAO dao = SupportDAO.getInstance();
            dao.saveFeedBack(feedback);

            // 🐥 성공 시 성공 페이지로 이동
            return "support/updateSuccess.jsp";

        } catch (NumberFormatException e) {
            // 🐰 데이터 형식 오류 처리
            request.setAttribute("error", "잘못된 데이터 형식입니다! 🐇");
            e.printStackTrace();
            return "support/emptField.jsp";

        } catch (Exception e) {
            // 🐰 일반적인 오류 처리
            request.setAttribute("error", "알 수 없는 오류가 발생했습니다! 🐇");
            e.printStackTrace();
            return "support/notfound.jsp";
        }
    }
}
