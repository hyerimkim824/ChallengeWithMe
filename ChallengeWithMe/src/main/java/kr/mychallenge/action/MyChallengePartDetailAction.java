package kr.mychallenge.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengePartDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		HttpSession session = request.getSession(true); // 세션 가져오기 (없으면 새로 생성)
		Long us_num = (Long)session.getAttribute("us_num");
		// 로그인 된 경우
		MyChallengeDAO dao = MyChallengeDAO.getInstance();
		

		if (us_num == null) {
					// 로그인 되지 않은 경우
					return "redirect:/xuser/registerXuserForm.do";
		}
		// URL 파라미터로 전달된 ch_num 값을 받아옴
		String chNumStr = request.getParameter("ch_num");

		if (chNumStr != null) {
		    // ch_num이 존재하면 세션에 저장
		    session.setAttribute("ch_num", Long.parseLong(chNumStr));
		} else {
		    // ch_num이 없다면 예외 처리
		    throw new IllegalArgumentException("ch_num parameter is missing.");
		}
		
List<MyChallengeVO> ch_list = null; 
		
		ch_list = dao.getListCh(us_num);
		
		request.setAttribute("ch_list", ch_list);
	
	//저반적인 참여정보 테이블을 위한 객체
	Map<String,Integer> partTable1 = dao.getListPartInfo(us_num,"before");
	Map<String,Integer> partTable2 = dao.getListPartInfo(us_num,"ongoing");
	Map<String,Integer> partTable3 = dao.getListPartInfo(us_num,"failed");
	Map<String,Integer> partTable4 = dao.getListPartInfo(us_num,"giveup");
	Map<String,Integer> partTable5 = dao.getListPartInfo(us_num,"completed");
	
	request.setAttribute("partTable1",partTable1);
	request.setAttribute("partTable2",partTable2);
	request.setAttribute("partTable3",partTable3);
	request.setAttribute("partTable4",partTable4);
	request.setAttribute("partTable5",partTable5);
 

		    Long chNum = Long.parseLong(chNumStr);
		  
		    System.out.println(chNum);
		    // 비즈니스 로직 처리
		   // 뷰 페이지 리턴
		
		MyChallengeVO mychall = dao.getDetailChall(chNum);
		
		request.setAttribute("mychall", mychall);
		
		
		//달성률
		Map<String, Integer> list_month = dao.achieveMonth(us_num);
		request.setAttribute("list_month", list_month);
		//String ch_start = (String)session.getAttribute("20");
		//String ch_end = (String)session.getAttribute("30");
		
		List<Integer> list = null;
		
		list = dao.achieveOne(us_num,"2024-11-10","2024-11-25");
		request.setAttribute("list", list);
		System.out.println(list);
		
		
		return "mychallenge/myChallengePartDetail.jsp";
		
	}
}
 