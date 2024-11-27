package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.FeedBackVO;
import kr.support.vo.SupportVO;
public class FeedBackDetailAction implements Action {

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
        FeedBackVO feedback = dao.getFeedBackById(supNum);

        if (feedback == null) {
            // 문의가 존재하지 않을 경우
            return "support/notfound.jsp"; // 데이터가 없다는 페이지로 이동
        }

     // 3. 비공개 문의일 경우 비밀번호 확인
        if (feedback.getSup_visi() == 1) { // 비공개 게시글
            String supPwdParam = request.getParameter("sup_pwd");
            
            if (supPwdParam == null || supPwdParam.isEmpty()) {
                // 비밀번호가 입력되지 않은 경우
                request.setAttribute("error", "비공개 게시글의 비밀번호를 입력해주세요. 🐇");
                return "support/feedBackDetail.jsp"; // 비밀번호 입력 페이지로 이동
            }

            // 비밀번호를 String으로 처리
            boolean isValid = false;
            try {
                isValid = dao.validatePrivatePwd(supNum, supPwdParam); // 비밀번호 확인 (String 타입 사용)
                
                if (!isValid) {
                    // 비밀번호가 틀린 경우
                    request.setAttribute("error", "비밀번호가 일치하지 않습니다. 🐇");
                    return "support/feedBackDetail.jsp"; // 비밀번호 오류 페이지로 이동
                }
            } catch (Exception e) {
                request.setAttribute("error", "비밀번호 오류가 발생했습니다. 🐇");
                return "support/feedBackDetail.jsp"; // 오류 처리 페이지로 이동
            }
        }

        // 4. 문의의 첨부 파일 경로 가져오기
        String filePath = dao.getFilePath(supNum); // 파일 경로를 DAO에서 가져옵니다.
        
        
        
        // 5. JSP에서 사용할 수 있도록 요청 객체에 파일 경로 전달
        request.setAttribute("filePath", filePath);  // 파일 경로를 JSP로 전달

        // 6. 요청 객체에 문의 데이터를 설정
        request.setAttribute("feedback", feedback);

        // 7. 수정 페이지로 이동하는 URL 설정
        request.setAttribute("updateUrl", "FeedBackUpdateForm.do?sup_num=" + supNum); // 수정 URL을 전달

        // 8. 상세 페이지로 이동
        return "support/feedBackDetail.jsp"; // 문의 상세 페이지로 이동
    }
}
