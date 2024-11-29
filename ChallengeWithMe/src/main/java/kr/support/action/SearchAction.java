package kr.support.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;
import kr.util.PagingUtil;

public class SearchAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 검색 키워드와 현재 페이지 번호 가져오기
        String keyword = request.getParameter("keyword"); // 검색 키워드
        String pageNum = request.getParameter("pageNum"); // 현재 페이지 번호

        // 기본 페이지 번호 설정
        int currentPage = (pageNum == null) ? 1 : Integer.parseInt(pageNum);

        // 한 페이지에 표시할 데이터 개수 설정
        int pageSize = 10;

        // DAO 인스턴스 생성
        SupportDAO dao = SupportDAO.getInstance();

        // 1. 검색 키워드 유효성 검사
        if (keyword == null || keyword.trim().isEmpty()) {
            // 키워드가 없거나 빈 문자열인 경우 처리
            request.setAttribute("error", "검색어를 입력해주세요! 🐇");
            return "support/emptyField.jsp"; // 검색어 입력 유도 페이지로 이동
        }

        // 검색 키워드 공백 제거
        keyword = keyword.trim();

        // 2. 검색된 게시글 총 개수 가져오기
        int totalCount = 0;
        try {
            totalCount = dao.getSearchSupportCount(keyword); // 검색 키워드 기준 게시글 수 조회
            System.out.println("totalCount:" + totalCount);
        } catch (Exception e) {
            // 데이터베이스 오류 처리
            e.printStackTrace();
            request.setAttribute("error", "검색 개수를 가져오는 중 오류가 발생했습니다! 🐇");
            return "support/error.jsp"; // 오류 페이지로 이동
        }

        // 검색 결과가 없을 경우 처리
        if (totalCount == 0) {
            request.setAttribute("message", "검색 결과가 없습니다. 🐇");
            request.setAttribute("keyword", keyword); // 입력된 키워드 반환
            return "support/notfound.jsp"; // 검색 결과 없음 페이지로 이동
        }

        // 3. 페이징 처리
        PagingUtil paging = new PagingUtil(currentPage, totalCount, pageSize, 10, "Search.do", "&keyword=" + keyword);

        // 4. 검색된 게시글 가져오기
        List<SupportVO> searchList = null;
        try {
            searchList = dao.searchSupports(keyword, paging.getStartRow(), paging.getEndRow());
        } catch (Exception e) {
            // 데이터베이스 오류 처리
            e.printStackTrace();
            request.setAttribute("error", "검색 결과를 가져오는 중 오류가 발생했습니다! 🐇");
            return "support/notfound.jsp"; // 오류 페이지로 이동
        }

        // 5. 검색 결과 JSP에 전달
        request.setAttribute("searchList", searchList); // 검색된 게시글 리스트
        request.setAttribute("pagingHtml", paging.getPage()); // 페이징 HTML
        request.setAttribute("totalCount", totalCount); // 검색된 게시글 총 개수

        // 6. 검색 결과 페이지 반환
        return "support/searchResult2.jsp"; // 검색 결과 페이지로 이동
    }
}
