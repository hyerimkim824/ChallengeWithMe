package kr.mychallenge.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengePartDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션을 가져옴 (새로운 세션이 없으면 생성됨)
		HttpSession session = request.getSession(true);

		
		    String chNumObj =(String) session.getAttribute("ch_num");
		    if (chNumObj == null) {
		        throw new IllegalArgumentException("ch_num is not set in the session");
		    }

		    Long chNum = Long.parseLong(chNumObj);
		  
		    System.out.println(chNum);
		    // 비즈니스 로직 처리*/
		   // 뷰 페이지 리턴
		MyChallengeDAO dao = MyChallengeDAO.getInstance();
		MyChallengeVO mychall = dao.getDetailChall(chNum);
		
		request.setAttribute("mychall", mychall);
		
		return "mychallenge/myChallengePartDetail.jsp";
		
	}

}
 