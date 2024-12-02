package kr.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.score.dao.ScoreDAO;
import kr.score.vo.ScoreVO;
import kr.xuser.vo.XuserVO;

public class MyPageAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		if(us_num == null) { // 로그인X
			return "redirect:/xuser/registerXuserForm.do";
		}
		// 로그인O
		MyPageDAO dao = MyPageDAO.getInstance();
		XuserVO xuser = dao.getMyInfo(us_num);
		xuser.setRank(dao.getAchiev(us_num));
		
		// 선호 카테고리
		List<String> preName = dao.pref(us_num);
		
		// 뱃지 정보
		List<Integer> bgInfo = dao.getBadgeInfo(us_num);
		
		// 챌린지 정보
		List<Integer> chall = dao.getChall(us_num);
		
		// 대표 뱃지
		String bg_img = dao.getMainBadge(us_num);
		
		// 랭크 점수
		ScoreDAO dao4 = ScoreDAO.getInstance();
		ScoreVO db_score = dao4.getScoreInfo(us_num);
		int score = dao4.calculateScore(db_score);
		db_score.setUs_score(score);
		dao4.updateScoreInfo(db_score);
		
		
		request.setAttribute("bg_img", bg_img);
		request.setAttribute("chall", chall);
		request.setAttribute("score", db_score);
		request.setAttribute("bgInfo", bgInfo);
		request.setAttribute("preName", preName);
		request.setAttribute("xuser", xuser);
		
		return "/mypage/mypage.jsp";
	}

}
