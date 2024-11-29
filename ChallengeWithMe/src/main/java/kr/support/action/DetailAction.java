package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class DetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 요청에서 문의 번호를 가져오기
        String supNumParam = request.getParameter("sup_num");
        
        if (supNumParam == null || supNumParam.isEmpty()) {
            return "support/notfound.jsp"; // 잘못된 접근 처리
        }

        long supNum = Long.parseLong(supNumParam);

        // 2. DAO를 통해 문의 데이터 가져오기
        SupportDAO dao = SupportDAO.getInstance();
        SupportVO support = dao.getSupportById(supNum);

        if (support == null) {
            // 문의가 존재하지 않을 경우
            return "support/notfound.jsp"; // 데이터가 없다는 페이지로 이동
        }

     

        // 4. 문의의 첨부 파일 경로 가져오기
        String filePath = dao.getFilePath(supNum); // 파일 경로를 DAO에서 가져옵니다.
        
        
        
        // 5. JSP에서 사용할 수 있도록 요청 객체에 파일 경로 전달
        request.setAttribute("filePath", filePath);  // 파일 경로를 JSP로 전달

        // 6. 요청 객체에 문의 데이터를 설정
        request.setAttribute("support", support);

        // 7. 수정 페이지로 이동하는 URL 설정
        request.setAttribute("updateUrl", "SupportUpdateForm.do?sup_num=" + supNum); // 수정 URL을 전달

        // 8. 상세 페이지로 이동
        return "support/detail.jsp"; // 문의 상세 페이지로 이동
    }
}
