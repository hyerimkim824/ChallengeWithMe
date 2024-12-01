package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.util.FileUtil;

public class ChallengeCreateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/loginForm.do";
		}
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println(us_num);
		System.out.println("1.제목: " + request.getParameter("chc_title"));
		System.out.println("2.소개: " + request.getParameter("chc_desc"));
		System.out.println("3.시작일: " + request.getParameter("start"));
		System.out.println("4.종료일: " + request.getParameter("end"));
		System.out.println("5.이미지: " + request.getPart("img"));
		System.out.println("6.최소인원: " + request.getParameter("min"));
		System.out.println("7.카테고리: " + request.getParameter("cate_num"));
		System.out.println("8.공개여부: " + request.getParameter("visi"));
		System.out.println("9.예치금: " + request.getParameter("chc_price"));
		System.out.println("10.최대인원: " + request.getParameter("max"));
		System.out.println("11.인증주기: " + request.getParameter("chc_authd"));
		System.out.println("12.인증방법: " + request.getParameter("ah_num"));
		System.out.println("13.참가코드: " + request.getParameter("join_code"));
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		
		String title = request.getParameter("chc_title");
		String desc = request.getParameter("chc_desc"); 
		String start = request.getParameter("start");
		String end = request.getParameter("end");
	
		int min = Integer.parseInt(request.getParameter("min"));
		int person = 0;
		int visi = Integer.parseInt(request.getParameter("visi"));
		int trans_bal = Integer.parseInt(request.getParameter("chc_price"));
		int official = Integer.parseInt(request.getParameter("official")); 

		Long user_num =  us_num;
		int cate_num =  Integer.parseInt(request.getParameter("cate_num"));
		int max = Integer.parseInt(request.getParameter("max"));
		int ch_like = 0; 
		int ch_view = 0; 
		int ch_authd = Integer.parseInt(request.getParameter("chc_authd")); 
		int ahDetail_num = Integer.parseInt(request.getParameter("ah_num"));
		String auth_desc = request.getParameter("auth_desc");
		String join_code = request.getParameter("join_code");
		
		
		ChallengeVO vo = new ChallengeVO();
		
		vo.setCh_title(title);
		vo.setCh_desc(desc);
		vo.setCh_start(start);
		vo.setCh_end(end);
		vo.calDate_diff();
		vo.setCh_img(FileUtil.uploadFile(request, "img"));
		vo.setCh_min(min);
		vo.setCh_person(person);
		vo.setCh_visi(visi);
		vo.setTrans_bal(trans_bal);
		vo.setOfficial(official);
		
		vo.setUs_num(user_num);
		vo.setCate_num(cate_num);
		vo.setCh_max(max);
		vo.setCh_like(ch_like);
		vo.setCh_view(ch_view);
		vo.setCh_authd(ch_authd);
		vo.setAh_num(ahDetail_num);
		vo.setAuth_desc(auth_desc);
		if(visi == 1) {
			vo.setJoin_code(join_code);
		}
		
		dao.createChallenge(vo);
		
		
		return "/challenge/challenge_create.jsp";
	}

}
