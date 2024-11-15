package kr.support.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.support.dao.SupportDAO;
import kr.support.vo.FeedBackVO;
import kr.controller.Action;

public class FeedBackList implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🌟 요청 데이터 인코딩 설정! 🐥
        request.setCharacterEncoding("UTF-8");

        try {
            // 🐇 페이지 번호 가져오기 (기본값: 1)
            String pageParam = request.getParameter("page");
            int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
            int pageSize = 10; // 한 페이지에 보여줄 피드백 개수

            // 🐇 DAO 인스턴스 호출
            SupportDAO dao = SupportDAO.getInstance();

            // 🐥 전체 피드백 목록 가져오기
            List<FeedBackVO> feedbackList = dao.getFeedBackList(page, pageSize);

            // 🐥 총 피드백 개수 가져오기
            int totalFeedbackCount = dao.getFeedBackCount();
            int totalPages = (int) Math.ceil((double) totalFeedbackCount / pageSize);

            // 🌟 데이터를 request 속성에 저장! 🎉
            request.setAttribute("feedbackList", feedbackList); // 피드백 리스트
            request.setAttribute("currentPage", page); // 현재 페이지 번호
            request.setAttribute("totalPages", totalPages); // 전체 페이지 수

            // 🐇 피드백 리스트 페이지로 이동
            return "support/feedbackList.jsp";

        } catch (NumberFormatException e) {
            // 🐥 잘못된 페이지 번호가 입력된 경우 처리
            request.setAttribute("error", "페이지 번호는 숫자여야 합니다! 🐇");
            e.printStackTrace();
            return "error/invalidPage.jsp";

        } catch (Exception e) {
            // 🐥 일반적인 예외 처리
            request.setAttribute("error", "피드백 데이터를 가져오는 중 오류가 발생했습니다! 🐥");
            e.printStackTrace();
            return "error/500.jsp";
        }
    }
}
