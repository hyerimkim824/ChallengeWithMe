package kr.mychallenge.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengeMakeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		// 로그인 된 경우
		MyChallengeDAO dao = MyChallengeDAO.getInstance();

		if (us_num == null) {
			// 로그인 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
		}
		
		Map<String,Integer> partTable1 = dao.getListPartInfo(us_num,"시작 전");
		Map<String,Integer> partTable2 = dao.getListPartInfo(us_num,"진행 중");
		Map<String,Integer> partTable3 = dao.getListPartInfo(us_num,"포기");
		Map<String,Integer> partTable4 = dao.getListPartInfo(us_num,"완료");
		
		
		List<MyChallengeVO> ch_list = null; 
		
		ch_list = dao.getListPart(us_num);
		
		request.setAttribute("ch_list", ch_list);
		
		List<MyChallengeVO> ptct_list = null; 
		ptct_list = dao.getGenInfo(us_num);
		request.setAttribute("ptct_list", ptct_list);

		
		
		return "mychallenge/myChallengeMake.jsp";
	}

}
