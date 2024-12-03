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
		int ongoingCount1 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 01);
		request.setAttribute("ongoingCount1", ongoingCount1);
		
		int ongoingCount2 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 02);
		request.setAttribute("ongoingCount2", ongoingCount2);
		int ongoingCount3 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 03);
		request.setAttribute("ongoingCount3", ongoingCount3);
		int ongoingCount4 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 04);
		request.setAttribute("ongoingCount4", ongoingCount4);
		int ongoingCount5 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 05);
		request.setAttribute("ongoingCount5", ongoingCount5);
		int ongoingCount6 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 06);
		request.setAttribute("ongoingCount6", ongoingCount6);
		int ongoingCount7 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 07);
		request.setAttribute("ongoingCount7", ongoingCount7);
		int ongoingCount8 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 8);
		request.setAttribute("ongoingCount8", ongoingCount8);
		int ongoingCount9 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 9);
		request.setAttribute("ongoingCount9", ongoingCount9);
		int ongoingCount10 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 10);
		request.setAttribute("ongoingCount10", ongoingCount10);
		int ongoingCount11 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 11);
		request.setAttribute("ongoingCount11", ongoingCount11);
		int ongoingCount12 = dao.getOngoingCountForSpecificMonth(us_num, 2024, 12);
		request.setAttribute("ongoingCount12", ongoingCount12);
		
		// 회원번호별 챌린지 참여 개수 정보*/
	
		
		
		/*달성률
		 *   
		 */
		Map<String, Integer> list_month = dao.achieveMonth(us_num);
		// StringBuilder로 HTML 테이블 생성
		StringBuilder table = new StringBuilder();
		table.append("<table border='1' id='autoTable' >");

		for (Map.Entry<String, Integer> entry : list_month.entrySet()) {
		    table.append("<tr>")
		         .append("<td>").append(entry.getKey()).append("</td>")
		          .append("<td>").append(entry.getValue()).append("</td>")
		         .append("</tr>");
		}
 
		table.append("</table>");

		// 결과를 JSP로 전달
		request.setAttribute("tableHTML", table.toString());
	
		
		
		
		
		
		 
		//String ch_start = (String)session.getAttribute("20");
		//String ch_end = (String)session.getAttribute("30");
		
		List<Integer> list = null;
	
		list = dao.achieveOne(us_num,"2024-11-10","2024-11-25");
		
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("listLength", (int)list.size());
		

		
		//선호도 조사
		List<Integer> pref_list = null;
		pref_list = dao.preference(us_num);
		request.setAttribute("pref_list", pref_list);
		request.setAttribute("pref_list_length", pref_list.size());
		
		
		
		
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