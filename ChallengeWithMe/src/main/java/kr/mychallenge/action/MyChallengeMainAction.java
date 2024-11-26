package kr.mychallenge.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;

public class MyChallengeMainAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");

		if (us_num == null) {
			// 로그인 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
		}

		// 로그인 된 경우
		MyChallengeDAO dao = MyChallengeDAO.getInstance();

		// 회원번호별 챌린지 참여 개수 정보
		Long partNum = dao.participateNum(us_num); // participateNum 호출

		request.setAttribute("partNum", partNum);
		
		/*달성률
		 *   
		 */
		 
		//String ch_start = (String)session.getAttribute("20");
		//String ch_end = (String)session.getAttribute("30");
		
		List<Integer> list = null;
		
		
		list = dao.AchieveOne(us_num);
		System.out.println(list);
		
		
		request.setAttribute("list", list);
		request.setAttribute("listLength", (int)list.size());
		
		/*달성률
		 * 
		 */
		
		List<Integer> list2 = null;
		
		
		list2 = dao.preference(us_num);
		System.out.println(list);
		
		
		request.setAttribute("list_prefer", list2);
		
		
		
		
		
		 

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