package kr.charge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.charge.dao.ChargeDAO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.score.action.RefreshUserScore;
import kr.xuser.dao.XuserDAO;
import kr.xuser.vo.XuserVO;

public class ConfirmDepositAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) {
			 request.setAttribute("notice_msg", "로그인 접속이 끊어졌습니다. 다시 로그인 해주세요");
			 request.setAttribute("notice_url", "../xuser/login.do");
			 
			 return "../views/common/alert_view.jsp";
		}
		
		int money = Integer.parseInt(request.getParameter("money"));
		
		//유저 잔고 업데이트
		XuserDAO x_dao = XuserDAO.getInstance();
		MyPageDAO mp_dao = MyPageDAO.getInstance();
		XuserVO x_vo = mp_dao.getMyInfo(us_num);
		 
		String curr_bal = x_vo.getWallet();
		Integer updated_bal = Integer.parseInt(curr_bal) + money;
		 
		String bal = String.valueOf(updated_bal);
		x_dao.updateWallet(us_num, bal);
		
		ChargeDAO charge_dao = ChargeDAO.getInstance();
		charge_dao.createChargeRecord(us_num, money);
		
		
		RefreshUserScore us_score = new RefreshUserScore();
		us_score.refresh(us_num);
		
		request.setAttribute("notice_msg", "금액이 성공적으로 충전되었습니다");
		request.setAttribute("notice_url", "../main/main.do");
		 
		return "../views/common/alert_view.jsp";
	}

}
