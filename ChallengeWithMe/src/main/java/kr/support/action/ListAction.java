package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;
import kr.controller.Action;

import java.util.List;

public class ListAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 사용자에게 보여줄 페이지 번호를 받아오기!
        String pageParam = request.getParameter("page");
        int page = (pageParam == null) ? 1 : Integer.parseInt(pageParam);

        // 한 페이지에 몇 개의 항목을 보여줄지 설정! 🐇
        int pageSize = 10;

        // DAO를 이용해서 데이터 가져오기!
        SupportDAO dao = SupportDAO.getInstance(); // DAO 싱글톤 인스턴스 사용
        List<SupportVO> list = dao.getAllSupports(page, pageSize);

        // 전체 게시글 수 가져오기 (페이지네이션 계산용)
        int totalCount = dao.getSupportCount();

        // 총 페이지 수 계산하기! 🐰
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // 뷰에 필요한 데이터를 request에 저장하기!
        request.setAttribute("inquiryList", list);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 리스트 페이지로 이동! 🐇
        return "support/inquiryList.jsp";
    }
}
