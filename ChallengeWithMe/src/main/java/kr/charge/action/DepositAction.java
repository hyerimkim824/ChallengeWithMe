package kr.charge.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.charge.dao.ChargeDAO;
import kr.charge.vo.ChargeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class DepositAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			 request.setAttribute("notice_msg", "로그인 접속이 끊어졌습니다. 다시 로그인 해주세요");
			 request.setAttribute("notice_url", "../xuser/login.do");
			 
			 return "../views/common/alert_view.jsp";
		}
		
		ChargeDAO charge_dao = ChargeDAO.getInstance();
		
		MyPageDAO mp_dao = MyPageDAO.getInstance();
		XuserVO x_vo = mp_dao.getMyInfo(us_num);
		 
		String curr_bal = x_vo.getWallet();
		
		List<ChargeVO> list = charge_dao.getChargeRecordByUser(us_num);
		
		request.setAttribute("list", list);
		request.setAttribute("curr_bal", curr_bal);
		return "/charge/deposit.jsp";
	}

}
