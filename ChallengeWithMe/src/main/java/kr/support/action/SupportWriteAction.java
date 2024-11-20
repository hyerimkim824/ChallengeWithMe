package kr.support.action;

import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.nio.file.Paths;

import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class SupportWriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        // 🐇 1. 세션에서 로그인 정보 확인
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("us_num");
        if (userNum == null) {
            request.setAttribute("error", "로그인이 필요합니다. 🐰");
            return "redirect:/xuser/loginForm.jsp";
        }
        // 🐇 2. 요청 방식(GET/POST)에 따라 처리 분기
        if (request.getMethod().equalsIgnoreCase("GET")) {
            // GET 요청인 경우 작성 폼으로 이동
            return "support/supportWrite.jsp";
        }

        // POST 요청인 경우 데이터 처리
        // 🐇 3. 요청 파라미터에서 데이터 가져오기
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String type = request.getParameter("type"); // 문의 유형

        // 🐥 4. 유효성 검사
        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("error", "문의 제목을 입력해주세요. 🐇");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
        if (content == null || content.trim().isEmpty()) {
            request.setAttribute("error", "문의 내용을 입력해주세요. 🐇");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
        if (type == null || type.trim().isEmpty()) {
            request.setAttribute("error", "문의 유형을 선택해주세요. 🐇");
            return "support/invalidAccess.jsp"; // 에러 페이지로 이동
        }

        // 🐇 5. **파일 첨부 처리** (파일이 있으면 업로드)
        String filePath = null;
        Part filePart = request.getPart("sup_img");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePath = "/uploaded_files/" + fileName; // 파일 경로 수정
            filePart.write("/webapp/WEB-INF/views/support" + filePath);  // 실제 파일 저장 경로 수정
        }

        // 🐇 6. **SupportVO 객체 생성** 및 데이터 설정
        SupportVO support = new SupportVO();
        support.setSup_title(title.trim());
        support.setSup_content(content.trim());
        support.setSup_pick(type); // 문의 유형
        support.setUs_num(userNum); // 작성자 번호
        support.setSup_img(filePath); // **첨부된 파일 경로 저장**
        support.setSup_visi(true); // 예시로 '공개' 설정, 필요에 따라 수정

        // 🐇 7. **DAO를 통해 데이터베이스에 저장**
        SupportDAO dao = SupportDAO.getInstance();
        try {
            // 데이터베이스에 문의 저장
            dao.createInquiry(support);

            // 🐰 등록 후 새로 고침해서 최신 데이터를 보여주기
            List<SupportVO> inquiryList = dao.getInquiryHistory(userNum, 1, 10); // 1페이지, 10개 항목
            request.setAttribute("inquiryList", inquiryList); // 새로고침된 문의 내역을 request에 저장

        } catch (SQLException e) {
            e.printStackTrace(); // 디버깅용
            request.setAttribute("error", "데이터베이스 처리 중 오류가 발생했습니다. 🐇");
            return "support/invalidAccess.jsp"; // 서버 오류 페이지로 이동
        }

        // 문의 목록 페이지로 리다이렉트
        return "redirect:/support/list.do";  // **리다이렉트** 후 더 이상 처리할 필요 없음
    }
}
