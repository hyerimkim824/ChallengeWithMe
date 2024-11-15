package kr.support.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;
import kr.controller.Action;

public class FaqListAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐇 DAO 인스턴스 가져오기 (싱글톤 방식으로 사용 중이에요~!)
        SupportDAO dao = SupportDAO.getInstance();

        try {
            // 🐰 페이지 번호와 크기 설정
            int page = 1; // 기본 페이지는 첫 번째 페이지! 🐣
            int pageSize = 10; // 한 페이지에 보여줄 FAQ 개수
            String pageParam = request.getParameter("page");

            // 🐥 사용자가 페이지 번호를 입력했으면 가져오고, 없으면 기본값!
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
                if (page <= 0) {
                    throw new NumberFormatException("페이지 번호는 1 이상이어야 해요! 🐇");
                }
            }

            // 🐰 FAQ 데이터 가져오기
            List<SupportVO> faqList = dao.getFAQList(page, pageSize);

            // 데이터가 비어 있으면 귀여운 빈 리스트로 초기화 🐥
            if (faqList == null) {
                faqList = new ArrayList<>();
            }

            // 🐰 전체 FAQ 개수와 페이지 계산
            int totalFAQCount = dao.getFAQCount(); // 전체 FAQ 데이터의 개수만 계산
            int totalPages = (int) Math.ceil((double) totalFAQCount / pageSize); // 전체 페이지 수

            // 🐰 데이터 전달을 위해 request 속성에 저장
            request.setAttribute("faqList", faqList); // FAQ 데이터 저장! 📄
            request.setAttribute("currentPage", page); // 현재 페이지 번호 저장! 🐥
            request.setAttribute("totalPages", totalPages); // 전체 페이지 수 저장! 🐇

            // 🐰 FAQ 페이지로 이동
            return "/support/faqList.jsp";

        } catch (NumberFormatException e) {
            // 🐥 숫자로 변환하는 중 오류가 발생했어요!
            e.printStackTrace();
            request.setAttribute("error", "페이지 번호는 숫자로 입력해야 해요! 🐇");
            return "support/invalidPage.jsp"; // 잘못된 페이지 번호에 대한 귀여운 에러 페이지로 이동

        } catch (Exception e) {
            // 🐥 일반적인 오류 처리
            e.printStackTrace();
            request.setAttribute("error", "FAQ 데이터를 가져오는 중 문제가 발생했어요! 🐣");
            return "error/500.jsp"; // 귀여운 서버 에러 페이지로 이동
        }
    }
}
