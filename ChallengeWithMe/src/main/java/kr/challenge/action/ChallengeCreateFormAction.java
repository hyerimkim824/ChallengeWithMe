package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;

public class ChallengeCreateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/loginForm.do";
		}
		
		/*
		 * ChallengeVO vo = new ChallengeVO();
		 * vo.setCh_title(request.getParameter("chc_title"));
		 * vo.setCh_desc(request.getParameter("chc_desc"));
		 * vo.setCh_start(request.getParameter("start"));
		 * vo.setCh_end(request.getParameter("end")); vo.setCh_img(null);
		 * vo.setCh_min(Integer.parseInt(request.getParameter("min")));
		 * vo.setCh_person(0);
		 * vo.setTrans_bal(Integer.parseInt(request.getParameter("chc_price")));
		 * vo.setOfficial(0); vo.setCh_status(null); vo.setUs_num(us_num);
		 * vo.setCate_name(null);
		 * vo.setCh_max(Integer.parseInt(request.getParameter("max")));
		 * vo.setCh_authd(request.getParameter("chc_authd"));
		 */
/*
		pstmt.setString(1, vo.getCh_title());
		pstmt.setString(2, vo.getCh_desc());
		pstmt.setString(3, vo.getCh_start());
		pstmt.setString(4, vo.getCh_end());
		pstmt.setString(5, vo.getCh_img());
		pstmt.setInt(6, vo.getCh_min());
		pstmt.setInt(7, vo.getCh_person());
		pstmt.setInt(8, vo.getTrans_bal());
		pstmt.setInt(9, vo.getOfficial());
		pstmt.setString(10, vo.getCh_status());
		pstmt.setLong(11, vo.getUs_num());
		pstmt.setLong(12, vo.getCate_num());
		pstmt.setInt(13, vo.getCh_max());
		pstmt.setString(14, vo.getCh_authd());
		
*/
		
		return "challenge/challenge_createForm.jsp";
	}

}
