package kr.mychallenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class MyChallengeMainAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			
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