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
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("1." + request.getParameter("chc_title"));
		System.out.println("2." + request.getParameter("chc_desc"));
		System.out.println("3." + request.getParameter("start"));
		System.out.println("4." + request.getParameter("end"));
		System.out.println("5." + request.getParameter("img"));
		System.out.println("6." + request.getParameter("min"));
		System.out.println("7." + request.getParameter("0"));
		System.out.println("8." + request.getParameter("visi"));
		System.out.println("9." + request.getParameter("chc_price"));
		System.out.println("10." + request.getParameter("max"));
		System.out.println("11." + request.getParameter("chc_authd"));
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		String title = request.getParameter("chc_title");
		String desc = request.getParameter("chc_desc"); 
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String img = request.getParameter("img"); 
		int min = Integer.parseInt(request.getParameter("min"));
		int person = 0;
		int visi = Integer.parseInt(request.getParameter("visi"));
		int trans_bal = Integer.parseInt(request.getParameter("chc_price"));
		int official = 0; 
		String ch_status = "before";
		Long user_num =  us_num;
		Long cate_num =  0L; 
		int max = Integer.parseInt(request.getParameter("max")); 
		int ch_like = 0; 
		int ch_view = 0; 
		String ch_authd = request.getParameter("chc_authd"); 
		
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
		
		
		return "/challenge_create.jsp";
	}

}
