package kr.challenge.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.category.dao.CategoryDAO;
import kr.category.vo.CategoryVO;
import kr.challenge.dao.ChallengeDAO;
import kr.challenge.dao.ChallengeLikeDAO;
import kr.challenge.vo.ChallengeLikeVO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.util.PagingUtil;

public class ChallengeOfficialListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Long us_num = (Long)session.getAttribute("us_num");
		int admin = (int)session.getAttribute("admin");
		
		if (us_num == null) {
	        return "redirect:/xuser/registerXuserForm.do";
	    }
		
		//페이지 정보 
		String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) pageNum = "1";
		
	    //검색 정보
	    String keyfield = request.getParameter("keyfield");
	    String keyword = request.getParameter("keyword");
	    
	    //챌린지 vo 초기화
	    ChallengeDAO chall_dao = ChallengeDAO.getInstance();
	    List<ChallengeVO> chall_list = null;
	    
	    //챌린지 개수 + 페이지 
	    int count = chall_dao.getListCount(keyfield, keyword, null, 1, 0);
	    PagingUtil page = new PagingUtil(keyfield, keyword, Integer.parseInt(pageNum), count, 3, 10, "challengeOfficialList.do");
	    
	    //챌린지 좋아요 정보
	    ChallengeLikeDAO like_dao = ChallengeLikeDAO.getInstance();
	    List<ChallengeLikeVO> like_list = like_dao.checkLike();
	    
	    if (count > 0) {
	    	
	        chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, null, 1, 0);
	    }else {
	        chall_list = new ArrayList<>(); 
	    }

	    for (ChallengeVO vo : chall_list) {
	        for (ChallengeLikeVO vo2 : like_list) {
	            if (vo2.getCh_num() == vo.getCh_num() && vo2.getUs_num() == us_num) {
	                vo.setHeart_status(true);
	            }
	        }
	        
	    }
	    
	    System.out.println("count: " + count + "--------------------------------------------");
	    request.setAttribute("chall", chall_list);
	    request.setAttribute("count", count);
	    request.setAttribute("page", page.getPage());
	    
	    
		return "challenge/challenge_officialList.jsp";
	}

}
