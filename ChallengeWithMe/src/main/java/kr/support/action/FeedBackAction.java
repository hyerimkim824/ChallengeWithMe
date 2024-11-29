package kr.support.action;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.controller.Action;
import kr.support.dao.FeedBackDAO;
import kr.support.dao.SupportDAO;
import kr.support.vo.FeedBackVO;
import kr.support.vo.SupportVO;
import kr.util.FileUtil;

public class FeedBackAction implements Action {

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
            return "support/feedBack.jsp";
        }

        // POST 요청인 경우 데이터 처리
        // 🐇 3. 요청 파라미터에서 데이터 가져오기
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String type = request.getParameter("type"); // 문의 유형
        String visi = request.getParameter("visibility"); // 공개 여부 추가
        String supPwd = request.getParameter("sup_pwd"); // 비공개 비밀번호
        

        // 🐥 4. 유효성 검사
        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("error", "피드백 제목을 입력해주세요. 🐇");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
        if (content == null || content.trim().isEmpty()) {
            request.setAttribute("error", "피드백 내용을 입력해주세요. 🐇");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
        if (type == null || type.trim().isEmpty()) {
            request.setAttribute("error", "문의 유형을 선택해주세요. 🐇");
            return "support/emptyField.jsp"; // 에러 페이지로 이동
        }
    
        // 🐇 6. **FeedBackVO 객체 생성** 및 데이터 설정
        FeedBackVO feedback = new FeedBackVO();
        feedback.setSup_title(title.trim());
        feedback.setSup_pick(type); // 문의 유형
        feedback.setSup_content(content.trim());
        feedback.setUs_num(userNum); // 작성자 번호
        feedback.setSup_img(FileUtil.uploadFile(request, "sup_img")); // **첨부된 파일 경로 저장**

        boolean isPublic = !"1".equals(visi); // 공개 여부를 체크 (1이면 비공개, 아니면 공개)

        if (isPublic) {
        	feedback.setSup_visi(0); // 공개
        	feedback.setSup_pwd(0); // 공개 상태에서는 비밀번호를 0으로 설정
        } else {
        	feedback.setSup_visi(1); // 비공개
            if (supPwd != null && !supPwd.trim().isEmpty()) {
                try {
                    long password = Long.parseLong(supPwd); // 비밀번호를 long 타입으로 변환
                    feedback.setSup_pwd(password); // 비공개 비밀번호 설정
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "비공개 비밀번호는 숫자 4자리로 입력해주세요. 🐇");
                    return "support/emptyField.jsp"; // 비밀번호가 숫자가 아닐 때 에러 처리
                }
            } else {
                request.setAttribute("error", "비공개 비밀번호를 입력해주세요. 🐇");
                return "support/emptyField.jsp"; // 비밀번호 미입력 시 에러 처리
            }
        }

        // 🐇 7. **DAO를 통해 데이터베이스에 저장**
        FeedBackDAO dao = FeedBackDAO.getInstance();
        try {
            // 데이터베이스에 문의 저장
            dao.saveFeedBack(feedback);
        } catch (SQLException e) {
            e.printStackTrace(); // 디버깅용
            request.setAttribute("error", "데이터베이스 처리 중 오류가 발생했습니다. 🐇");
            return "support/invalidAccess.jsp"; // 서버 오류 페이지로 이동
        }

        // 문의 목록 페이지로 리다이렉트
        return "redirect:/support/FeedBackList.do";  // **리다이렉트** 후 더 이상 처리할 필요 없음
    }
}
