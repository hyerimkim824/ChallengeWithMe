package kr.pvchallenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.pvchallenge.dao.PvChallengeDAO;
import kr.pvchallenge.vo.PvChallengeVO;

public class PvChallengePhotoAction implements Action {
	@Override
	    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	        // 세션에서 사용자 번호(us_num)를 가져옴
	        HttpSession session = request.getSession();
	        Long us_num = (Long) session.getAttribute("us_num");
	
	        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	        if (us_num == null) {
	            return "redirect:/xuser/loginForm.do";
	        }
	
	        // 사용자 번호를 이용하여 도전 정보 조회
	        PvChallengeDAO dao = PvChallengeDAO.getInstance();
	        PvChallengeVO challengeInfo = dao.getPvInfoAll(us_num);
	/*
	        // 도전 정보가 없으면 오류 페이지로 리다이렉트
	        if (challengeInfo == null) {
	            request.setAttribute("errorMessage", "도전 정보가 없습니다.");
	            return "pvchallenge/errorPage.jsp";  // 필요한 경우 오류 페이지로 이동
	        }
	
	        // 조회된 도전 데이터를 JSP로 전달
	        System.out.println(challengeInfo.getCh_num());
	        System.out.println(challengeInfo.getAh_img());
	
	        // 세션에 도전 정보 저장
	        session.setAttribute("ah_num", challengeInfo.getAh_num());
	        session.setAttribute("ch_num", challengeInfo.getCh_num());
	        session.setAttribute("ch_proved1", challengeInfo.getCh_proved());  // 이 값이 유효한지 확인 필요
	        session.setAttribute("ah_date", challengeInfo.getAh_date());
	        session.setAttribute("ah_img", challengeInfo.getAh_img());
	
	        request.setCharacterEncoding("utf-8");
	
	        // 도전 번호를 파라미터에서 가져옴
	        String chNumParam = request.getParameter("ch_num");
	        if (chNumParam == null) {
	            // ch_num이 없다면 오류 처리
	            request.setAttribute("errorMessage", "도전 번호가 없습니다.");
	            return "pvchallenge/errorPage.jsp";  // 오류 페이지로 이동
	        }
	
	*/
	       // long ch_num = Long.parseLong(chNumParam);  // 파라미터에서 도전 번호 추출
	        
	        
	
	        // PvChallengeVO 객체 생성 및 필드 설정
	        PvChallengeVO pvchall = new PvChallengeVO();
	       
	        pvchall.setAh_img("11");  // challengeInfo에서 이미지 값 설정
	        pvchall.setCh_proved1(0);  // 처음에는 증명값 0
	        pvchall.setUs_num(us_num);  // 사용자 번호
	        pvchall.setCh_num(Long.parseLong(request.getParameter("ch_num")));  // 도전 번호
	        pvchall.setCh_proved2(0);  // 기본값 0
	        pvchall.setCh_proved3(0);  // 기본값 0
	        pvchall.setCh_proved4(0);  // 기본값 0
	        pvchall.setCh_proved5(0);  // 기본값 0
	        
	        
	        
	        // PvChallengeDAO에 도전 정보 삽입
	        dao.insertPv(pvchall);
	        return "pvchallenge/pvChallengePhoto.jsp";
	       // 정상 처리 후 페이지로 이동
	    }
	
}
 