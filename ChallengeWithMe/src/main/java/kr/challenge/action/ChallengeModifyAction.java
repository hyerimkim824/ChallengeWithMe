package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.util.FileUtil;

public class ChallengeModifyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		
		Long ch_num = Long.parseLong(request.getParameter("ch_num"));
		
		String ch_desc = request.getParameter("ch_desc");
		String auth_desc = request.getParameter("auth_desc");
		
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		ChallengeVO vo = dao.getChallengeDetail(ch_num);
		
		vo.setCh_desc(ch_desc);
		vo.setAuth_desc(auth_desc);
		vo.setCh_img(FileUtil.uploadFile(request, "img"));
		
		dao.updateChallenge(vo);
		
		request.setAttribute("notice_msg", "수정이 완료되었습니다");
		request.setAttribute("notice_url", "../challenge/challengeDetail.do?ch_num="+ch_num);
		 
		return "../views/common/alert_view.jsp";
	}

}
