package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class MyBirdAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            // 🐇 세션 가져오기
            HttpSession session = request.getSession();
            
            // 🐰 로그인 상태 확인 (예: 세션에 "us_nickname"이 설정되어 있는지 확인)
            Long us_num = (long)session.getAttribute("us_num");
            XuserVO xuser = new XuserVO();
            
            // 로그인된 사용자 정보 확인 (디버깅용)
			System.out.println("로그인된 사용자 닉네임: " + us_num);
            MyPageDAO dao = MyPageDAO.getInstance();
            xuser = dao.getMyInfo(us_num);
            
            request.setAttribute("xuser", xuser);
            // 🐥 나의 새 페이지로 이동
            return "support/myBird.jsp"; // JSP 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "고객센터 메인 페이지 로드 중 오류가 발생했습니다. 🐇");
            return "support/notfound.jsp"; // 오류 페이지로 이동
        }
    }
}