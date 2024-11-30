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
		
		
		
		return "mychallenge/myChallengePartDetail.jsp";
		
	}

}
 