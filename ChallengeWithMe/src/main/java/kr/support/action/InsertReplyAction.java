package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.controller.Action;
import kr.support.dao.ReplyDAO;
import kr.support.vo.ReplyVO;

public class InsertReplyAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인 정보 확인 🐇
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("user_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않은 경우 로그인 페이지로 이동 🥕
            return "support/loginRequired.jsp";
        }

        // 2. 요청 파라미터에서 댓글 데이터 가져오기 🐰
        String supNumParam = request.getParameter("sup_num");
        String replyContent = request.getParameter("reply_content");

        if (supNumParam == null || supNumParam.trim().isEmpty() || replyContent == null || replyContent.trim().isEmpty()) {
            // 필수 데이터가 없을 경우 에러 페이지로 이동 🐇
            request.setAttribute("error", "필수 데이터가 누락되었습니다.");
            return "support/emptyField.jsp";
        }

        long supNum;
        try {
            supNum = Long.parseLong(supNumParam);
        } catch (NumberFormatException e) {
            // 잘못된 문의 번호 형식인 경우 🐇
            request.setAttribute("error", "잘못된 문의 번호 형식입니다.");
            return "support/invalidAccess.jsp";
        }

        // 3. ReplyVO 객체 생성 및 데이터 설정 🐰
        ReplyVO reply = new ReplyVO();
        reply.setSup_num(supNum);               // 문의 번호
        reply.setUs_num(userNum);               // 작성자 번호
        reply.setReply_content(replyContent.trim()); // 댓글 내용

        // 4. DAO를 통해 댓글 저장 🐇
        ReplyDAO dao = new ReplyDAO();
        dao.insertReply(reply);

        // 5. 댓글 저장 완료 후 해당 문의 상세 페이지로 리다이렉트 🐇
        return "redirect:/support/Detail.do?sup_num=" + supNum;
    }
}
