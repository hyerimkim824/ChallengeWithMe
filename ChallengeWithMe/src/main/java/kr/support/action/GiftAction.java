package kr.support.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.vo.XuserVO;

public class GiftAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            // 🐇 세션 가져오기
            HttpSession session = request.getSession();

            // 🐰 로그인 상태 확인
            Long us_num = (Long) session.getAttribute("us_num");
            if (us_num == null) {
                // 로그인하지 않은 경우 오류 처리
                request.setAttribute("error", "로그인이 필요한 서비스입니다.");
                return "support/login_required.jsp"; // 로그인 필요 페이지로 이동
            }

            // 🐇 로그인된 사용자 정보 가져오기
            MyPageDAO dao = MyPageDAO.getInstance();
            XuserVO xuser = dao.getMyInfo(us_num);
            if (xuser == null) {
                // 사용자 정보가 없는 경우
                request.setAttribute("error", "사용자 정보를 확인할 수 없습니다.");
                return "support/error.jsp"; // 오류 페이지로 이동
            }

            // 사용자 정보를 JSP에 전달
            request.setAttribute("xuser", xuser);

            // 🐥 선물 데이터 준비
            List<Gift> gifts = new ArrayList<>();
            gifts.add(new Gift("기프트 카드", "쇼핑, 외식, 엔터테인먼트까지 다양한 선택이 가능한 기프트 카드입니다.", 10000, "images/Netflix.png"));
            gifts.add(new Gift("최신 전자제품", "챌린지 성공으로 최신 스마트 기기와 가전제품을 구매해보세요.", 300000, "images/electronics.png"));
            gifts.add(new Gift("특별한 꽃다발", "소중한 사람에게 감사와 사랑의 마음을 꽃으로 전하세요.", 20000, "images/Flower.png"));
            gifts.add(new Gift("소중한 기부", "상금을 모아 도움이 필요한 사람들에게 나눔의 손길을 건네보세요.", 10000, "images/donation.png"));

            // 선물 데이터를 JSP에 전달
            request.setAttribute("gifts", gifts);

            // 🐇 고객센터 메인 페이지로 이동
            return "support/gift.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "고객센터 메인 페이지 로드 중 오류가 발생했습니다. 🐇");
            return "support/notfound.jsp"; // 오류 페이지로 이동
        }
    }
}
