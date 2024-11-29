package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.util.PagingUtil;
import kr.controller.Action;
import kr.support.dao.FeedBackDAO;
import kr.support.vo.FeedBackVO;
import java.util.List;

public class FeedBackListAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 사용자에게 보여줄 페이지 번호를 받아오기
        String pageParam = request.getParameter("pageNum");
        int page = (pageParam == null) ? 1 : Integer.parseInt(pageParam);

        // 한 페이지에 몇 개의 항목을 보여줄지 설정
        int pageSize = 10;

        // SupportDAO를 이용해서 데이터 가져오기
        FeedBackDAO dao =FeedBackDAO.getInstance();

        // 전체 게시글 수 가져오기 (피드백 개수 계산용)
        int totalCount = dao.getFeedBackCount();
        System.out.println("totalCount : " +totalCount);
        // 페이징 처리: 시작 행과 가져올 행 수 설정
        PagingUtil pagingUtil = new PagingUtil(page, totalCount, 20, pageSize, "FeedBackList.do");

        // 전체 피드백 목록 가져오기
        List<FeedBackVO> feedbackList = dao.getFeedBackList(pagingUtil.getStartRow(), pagingUtil.getEndRow()); 

        // 세션에서 로그인한 사용자 정보 가져오기
        HttpSession session = request.getSession();
        Long userNum = (Long)session.getAttribute("us_num");

        if (userNum == null) {
            request.setAttribute("error", "로그인 후에 확인 가능합니다! 🐇");
            return "support/loginRequired.jsp"; // 로그인 필요 안내 페이지로 이동
        }
        
     // 비공개 게시물의 경우 작성자 본인만 확인할 수 있도록 표시
        for (FeedBackVO feedBack : feedbackList) {
            if (feedBack.getSup_visi() == 1 && feedBack.getUs_num() != userNum) {
                // 비공개 게시물이고 작성자가 아닌 경우
                feedBack.setSup_content("작성자 본인만 확인할 수 있는 게시물입니다.");
            }
        }
        
        // 팝업창에서 전달된 비밀번호 확인 로직 추가
        String supNumParam = request.getParameter("sup_num"); // 게시글 번호
        String supPwd = request.getParameter("sup_pwd"); // 팝업창에서 입력된 비밀번호

        if (supNumParam != null && supPwd != null) {
            long supNum = Long.parseLong(supNumParam); // 게시글 번호 파싱
            boolean isPasswordValid = dao.validatePrivatePwd(supNum, supPwd); // 비밀번호 확인 로직 호출

            if (isPasswordValid) {
                // 비밀번호가 맞으면 상세 페이지로 이동
                return "redirect:/support/FeedBackDetail.do?sup_num=" + supNum;
            } else {
                // 비밀번호가 틀리면 에러 메시지를 추가하고 리스트로 복귀
                request.setAttribute("error", "비밀번호가 일치하지 않습니다! 🐇");
                return "support/feedBackList.jsp"; // 팝업에서 바로 리스트로 복귀
            }
        }
        // 뷰에 필요한 데이터를 request에 저장
        request.setAttribute("feedbackList", feedbackList); // 피드백 리스트
        request.setAttribute("currentPage", page); // 현재 페이지 번호
        request.setAttribute("totalPages", pagingUtil.getPage()); // 전체 페이지 수

        // 리스트 페이지로 이동
        return "support/feedBackList.jsp"; // 피드백 목록 페이지로 리턴
    }
}

