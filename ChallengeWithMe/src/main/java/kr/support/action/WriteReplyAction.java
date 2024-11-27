package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.ReplyVO;

public class WriteReplyAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 세션에서 로그인 정보 확인 🐰
        HttpSession session = request.getSession();
        Long userNum = (Long) session.getAttribute("user_num");

        if (userNum == null) {
            // 로그인이 되어 있지 않은 경우 로그인 필요 페이지로 이동 🐇
            return "support/loginRequired.jsp";
        }

        // 2. 요청 파라미터에서 댓글 데이터 가져오기 🐰
        String supNumParam = request.getParameter("sup_num");
        String replyContent = request.getParameter("reply_content");

        if (supNumParam == null || supNumParam.trim().isEmpty()) {
            // 문의 번호가 비어있는 경우 에러 처리 🐇
            return "support/emptyField.jsp";
        }

        if (replyContent == null || replyContent.trim().isEmpty()) {
            // 댓글 내용이 비어있는 경우 에러 처리 🐇
            return "support/emptyReply.jsp";
        }

        long supNum = Long.parseLong(supNumParam);

        // 3. 댓글 객체 생성 및 데이터 설정 🐰
        ReplyVO reply = new ReplyVO();
        reply.setSup_num(supNum);       // 문의 번호 설정
        reply.setUs_num(userNum);       // 작성자 ID 설정
        reply.setReply_content(replyContent.trim()); // 댓글 내용 설정

        // 4. DAO를 통해 댓글 저장 🐇
        SupportDAO dao = SupportDAO.getInstance(); // 싱글톤 DAO 인스턴스 사용
        dao.insertReply(reply); // 댓글 저장

        System.out.println("🐰 댓글이 성공적으로 저장되었습니다: " + replyContent);

        // 5. 댓글 작성 완료 후 해당 문의 상세 페이지로 리다이렉트 🐰
        return "redirect:/support/Detail.do?sup_num=" + supNum;
    }
}
