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
        // 요청에서 검색 키워드와 현재 페이지 번호 가져오기
        String keyword = request.getParameter("keyword"); // 검색 키워드
        String pageNum = request.getParameter("pageNum"); // 현재 페이지 번호

        // 기본 페이지 번호 설정
        int currentPage = 1;
        if (pageNum != null) {
            try {
                currentPage = Integer.parseInt(pageNum); // 페이지 번호 숫자로 변환
                if (currentPage <= 0) {  // 페이지 번호가 0 이하이면 1로 설정
                    currentPage = 1;
                }
            } catch (NumberFormatException e) {
                // 잘못된 페이지 번호 형식일 경우 예외 처리
                request.setAttribute("error", "잘못된 페이지 번호입니다. 🐇");
                return "support/invalidPage.jsp";  // 잘못된 페이지 번호 처리
            }
        }

        // 한 페이지에 표시할 데이터 개수와 페이지 수 설정
        int rowCount = 10; // 한 페이지에 표시할 데이터 개수
        int pageCount = 10; // 하단에 표시할 페이지 개수

        // DAO 인스턴스
        SupportDAO dao = SupportDAO.getInstance();

        // 검색 키워드가 null이거나 비어있는 경우 빈 결과 반환
        if (keyword == null || keyword.trim().isEmpty()) {
            request.setAttribute("error", "검색어를 입력해주세요! 🐇");
            return "support/emptyField.jsp"; // 검색어 입력을 유도하는 에러 페이지로 리다이렉트
        }

        // 전체 게시글 수 가져오기 (페이지네이션 계산용)
        int totalCount = dao.getSupportCount();

        PagingUtil totalPages = new PagingUtil(page,totalCount,20,pageSize,"Search.do");
        List<SupportVO> list = dao.getAllSupports(totalPages.getStartRow(), totalPages.getEndRow());
  

        // 페이징 처리
        PagingUtil paging = new PagingUtil(pageCount, currentPage, totalCount, rowCount, keyword, "Search.do");

        // 페이징된 결과 데이터 가져오기
        List<SupportVO> searchList = dao.searchSupports(keyword, paging.getStartRow(), paging.getEndRow());

        // 결과 데이터를 JSP로 전달
        request.setAttribute("searchList", searchList); // 검색된 데이터 리스트
        request.setAttribute("pagingHtml", paging.getPage()); // 페이징 UI HTML
        request.setAttribute("totalCount", totalCount); // 검색된 전체 개수

        // 결과를 표시할 JSP 페이지 반환
        return "/WEB-INF/views/support/searchResult.jsp";  // 검색 결과 페이지로 리턴
    }
}
