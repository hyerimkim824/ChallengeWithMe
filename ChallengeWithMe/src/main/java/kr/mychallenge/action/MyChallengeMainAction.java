package kr.mychallenge.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengeMainAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		// 로그인 된 경우
		MyChallengeDAO dao = MyChallengeDAO.getInstance();

		if (us_num == null) {
			// 로그인 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
		}else {
			
			
			List<MyChallengeVO> ch_list = null; 
			
			ch_list = dao.getListCh(us_num);
			
			request.setAttribute("ch_list", ch_list);
		
		//저반적인 참여정보 테이블을 위한 객체
		Map<String,Integer> partTable1 = dao.getListPartInfo(us_num,"시작 전");
		Map<String,Integer> partTable2 = dao.getListPartInfo(us_num,"진행 중");
		Map<String,Integer> partTable3 = dao.getListPartInfo(us_num,"포기");
		Map<String,Integer> partTable4 = dao.getListPartInfo(us_num,"완료");
		
		request.setAttribute("partTable1",partTable1);
		request.setAttribute("partTable2",partTable2);
		request.setAttribute("partTable3",partTable3);
		request.setAttribute("partTable4",partTable4);
		
		
	    //월별 참여 정보
		int ongoingCount = dao.getOngoingCountForSpecificMonth(us_num, 2024, 11);
		request.setAttribute("ongoingCount", ongoingCount);
		// 회원번호별 챌린지 참여 개수 정보
	
		
		
		/*달성률
		 *   
		 */
		Map<String, Integer> list_month = dao.achieveMonth(us_num);
		request.setAttribute("list_month", list_month);
		
		
		 
		//String ch_start = (String)session.getAttribute("20");
		//String ch_end = (String)session.getAttribute("30");
		
		List<Integer> list = null;
		
		
	
		
		list = dao.achieveOne(us_num,"2024-11-10","2024-11-25");
		System.out.println(list);
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("listLength", (int)list.size());
		

		
		// 사용자 입력 파라미터 받아오기
		
		 // 세션에서 ch_num을 가져옵니다.
	   
		}
		
		
		
		//전체 참여 및 개설리스트 보여주기
		
		List<MyChallengeVO> ch_list = null; 
		
		ch_list = dao.getListCh(us_num);
		
		request.setAttribute("ch_list", ch_list);
		
		
        List<MyChallengeVO> part_list = null; 
		
		ch_list = dao.getListCh(us_num);
		
		request.setAttribute("part_list", part_list);

		
		
	 

		return "mychallenge/myChallengeMain.jsp";
		
		
		


	}

	/*@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ItemDAO itemDao = ItemDAO.getInstance();
		List<ItemVO> itemList = itemDao.getListItem(1, 16, null, null, 1); //1 : 표시 상품만 바환


		request.setAttribute("itemList", itemList);

		//JSP 경로 반환
		return "main/main.jsp";*/

}