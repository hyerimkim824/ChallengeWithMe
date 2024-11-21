package kr.challenge.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.category.dao.CategoryDAO;
import kr.category.vo.CategoryVO;
import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;

public class ChallengeListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category = request.getParameter("category");
		
		ChallengeDAO chall_dao = ChallengeDAO.getInstance();
		List<ChallengeVO> chall_list = null;
		if(category == null || category.equals("0")) {
			chall_list = chall_dao.getList();
		}
		
		else {
			int cat_num = Integer.parseInt(category);
			chall_list = chall_dao.getList(cat_num);
			
			CategoryDAO cat_dao = CategoryDAO.getInstance();
			CategoryVO cat_vo = cat_dao.getDetail(cat_num);
			String cat_name = cat_vo.getCate_name();
			
			request.setAttribute("cat_name", cat_name);
		}
			
		request.setAttribute("chall_list", chall_list);
	
		
		return "/challenge/challenge_list.jsp";
	}

}
