package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;

public class ChallengeCreateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/loginForm.do";
		}
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		String title = request.getParameter("chc_title");
		String desc = request.getParameter("chc_desc");
		String start = request.getParameter("chc_start");
		String end = request.getParameter("chc_end");
		String img = request.getParameter("chc_img");
		int min = Integer.parseInt(request.getParameter("chc_min"));
		int person = Integer.parseInt(request.getParameter("chc_person"));
		int visi = Integer.parseInt(request.getParameter("chc_visi"));
		int trans_bal = Integer.parseInt(request.getParameter("chc_trans_bal"));
		int official = Integer.parseInt(request.getParameter("chc_official"));
		String ch_status = request.getParameter("chc_ch_status");
		Long user_num =  Long.parseLong(request.getParameter("chc_us_num"));
		Long cate_num =  Long.parseLong(request.getParameter("chc_cate_num"));
		int max = Integer.parseInt(request.getParameter("chc_max"));
		int ch_like = 0;
		int ch_view = 0;
		String ch_authd = request.getParameter("ch_authd");
		
		ChallengeVO vo = new ChallengeVO();
		
		vo.setCh_title(title);
		vo.setCh_desc(desc);
		vo.setCh_start(start);
		vo.setCh_end(end);
		vo.setCh_img(img);
		vo.setCh_min(min);
		vo.setCh_person(person);
		vo.setCh_visi(visi);
		vo.setTrans_bal(trans_bal);
		vo.setOfficial(official);
		vo.setCh_status(ch_status);
		vo.setUs_num(user_num);
		vo.setCate_num(cate_num);
		vo.setCh_max(max);
		vo.setCh_like(ch_like);
		vo.setCh_view(ch_view);
		vo.setCh_authd(ch_authd);
		
		dao.createChallenge(vo);
		
		return "challenge/challenge_create.jsp";
	}

}
