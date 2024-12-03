package kr.mychallenge.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengePartAction implements Action{

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
			
			
			
			List<MyChallengeVO> part_list = null; 
			
			part_list = dao.getPartInfo(us_num);
			
			request.setAttribute("part_list", part_list);
			
			//int ch_num = session.getParameter("ch_num");
			
			 
			//MyChallengeVO img = dao.getImage(1);
		 	 
			
			
		
			
			
			
			
		
		}
		
		return "mychallenge/myChallengePart.jsp";
	}
}
