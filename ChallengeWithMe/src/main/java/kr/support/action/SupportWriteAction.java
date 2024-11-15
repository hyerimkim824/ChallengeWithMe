package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class SupportWriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐇 1. 세션에서 로그인 정보 확인
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("us_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않으면 로그인 필요 안내 페이지로 이동 🐥
            request.setAttribute("error", "로그인이 필요합니다.");
            return "redirect:/xuser/loginForm.jsp";
        }
        // GET 요청인 경우, 작성 폼으로 이동 🐰
        return "support/supportWrite.jsp";
       

        // POST 요청인 경우 데이터 처리 🐥
        // 🐇 3. 요청 파라미터에서 데이터 가져오기
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String typeParam = request.getParameter("type"); // 문의 유형

        // 🐥 4. 유효성 검사
        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("error", "문의 제목을 입력해주세요.");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
        if (content == null || content.trim().isEmpty()) {
            request.setAttribute("error", "문의 내용을 입력해주세요.");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
        if (typeParam == null || typeParam.trim().isEmpty()) {
            request.setAttribute("error", "문의 유형을 선택해주세요.");
            return "support/invalidAccess.jsp"; // 에러 페이지로 이동
        }

        int type;
        try {
            type = Integer.parseInt(typeParam); // 문의 유형 파싱
        } catch (NumberFormatException e) {
            request.setAttribute("error", "유효하지 않은 문의 유형입니다.");
            return "support/invalidAccess.jsp"; // 에러 페이지로 이동
        }

        // 🐇 5. SupportVO 객체 생성 및 데이터 설정
        SupportVO support = new SupportVO();
        support.setSup_title(title.trim());
        support.setSup_content(content.trim());
        support.setSup_pick(type); // 문의 유형
        support.setUs_num(userNum); // 작성자 번호

        // 🐇 6. DAO를 통해 데이터베이스에 저장
        SupportDAO dao = SupportDAO.getInstance();
        try {
            dao.createInquiry(support);
        } catch (Exception e) {
            e.printStackTrace(); // 디버깅용
            request.setAttribute("error", "데이터베이스 처리 중 오류가 발생했습니다.");
            return "error/500.jsp"; // 서버 오류 페이지로 이동
        }

        // 🐇 7. 작성 완료 후 문의 리스트 페이지로 리다이렉트
        return "redirect:/support/List.do"; // 문의 리스트로 이동
    }
    }

