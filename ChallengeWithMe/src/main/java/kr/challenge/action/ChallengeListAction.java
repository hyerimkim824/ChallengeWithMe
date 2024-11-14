package kr.challenge.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;

public class ChallengeListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ChallengeDAO chall_dao = ChallengeDAO.getInstance();
		
		List<ChallengeVO> chall_list = chall_dao.getList();
		
		request.setAttribute("chall_list", chall_list);
		
	    System.out.println("리스트 크기: " + chall_list.size());
		
		return "/challenge/challenge_list.jsp";
	}

}
