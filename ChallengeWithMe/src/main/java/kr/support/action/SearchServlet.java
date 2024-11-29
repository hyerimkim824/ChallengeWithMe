package kr.support.action;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청에서 검색 키워드와 페이지 번호 가져오기
        String keyword = request.getParameter("keyword");
        String pageParam = request.getParameter("page");

        // 페이지 계산 (기본값: 1페이지)
        int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int rowsPerPage = 10; // 한 페이지에 표시할 행 수
        int startRow = (page - 1) * rowsPerPage + 1;
        int endRow = page * rowsPerPage;

        // DAO 호출하여 검색 결과 가져오기
        List<SupportVO> results = null;
        try {
            SupportDAO dao = SupportDAO.getInstance();
            results = dao.searchSupports(keyword, startRow, endRow);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "검색 중 오류가 발생했습니다.");
        }

        // 검색 결과와 추가 데이터를 JSP로 전달
        request.setAttribute("results", results);
        request.setAttribute("keyword", keyword);
        request.setAttribute("page", page);

        // JSP로 포워드
        request.getRequestDispatcher("/WEB-INF/views/searchResult.jsp").forward(request, response);
    }
}
