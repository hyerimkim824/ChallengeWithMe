package kr.challenge.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

public class ChallengeListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
	    Long us_num = (Long)session.getAttribute("us_num");
	    String join_code = request.getParameter("ch_code");
	    
	    if (us_num == null) {
	        return "redirect:/xuser/registerXuserForm.do";
	    }
	    String visi = request.getParameter("visi");
	    
	    Integer visiChecked = null;
	    if(visi == null || visi == "") {
	    	visiChecked = 0;
	    }else {
	    	visiChecked = Integer.parseInt(visi);
	    }
	    
	    String status = request.getParameter("status");
	    if(status == null || status == "") {
	    	status = null;
	    }
	    
	    
	    String category = request.getParameter("category");
	    if(category == null || category == "") {
	    	category = null;
	    }
	    String pageNum = request.getParameter("pageNum");

	    if (pageNum == null) pageNum = "1";

	    String keyfield = request.getParameter("keyfield");
	    String keyword = request.getParameter("keyword");

	    System.out.println("==============================================1. category: " + category);

	    ChallengeDAO chall_dao = ChallengeDAO.getInstance();
	    List<ChallengeVO> chall_list = null;

	    int count = 0;
	    
	    if (category != null && status != null) {
	        count = chall_dao.getListCount(keyfield, keyword, category, 0, visiChecked, status);
	        System.out.println("==============================================1");
	    }
	    // 카테고리만 null인 경우
	    else if (category == null && status != null) {
	        count = chall_dao.getListCount(keyfield, keyword, null, 0, visiChecked, status);
	        System.out.println("==============================================2");
	        System.out.println(status);
	    }
	    // 챌린지 상태만 null인 경우
	    else if (category != null && !category.isEmpty() && status == null) {
	        count = chall_dao.getListCount(keyfield, keyword, category, 0, visiChecked, null);
	        System.out.println("==============================================3");
	    }
	    // 둘 다 null인 경우
	    else {
	        count = chall_dao.getListCount(keyfield, keyword, null, 0, visiChecked, null);
	        System.out.println("==============================================4");
	    }
	    
	    PagingUtil page = new PagingUtil(keyfield, keyword, Integer.parseInt(pageNum), count, 15, 10, "challengeList.do");

	    ChallengeLikeDAO like_dao = ChallengeLikeDAO.getInstance();
	    List<ChallengeLikeVO> like_list = like_dao.checkLike();

	    if (count > 0) {
	        if (category == null || category.isEmpty()) {
	            category = null; // category가 비어 있으면 null로 설정
	        }

	        // 전체 카테고리 검색을 위한 처리
	        if (category != null) {
	            int cat_num = Integer.parseInt(category); // category가 null이 아니면 숫자로 변환
	            CategoryDAO cat_dao = CategoryDAO.getInstance();
	            CategoryVO cat_vo = cat_dao.getDetail(cat_num);
	            String cat_name = cat_vo.getCate_name();
	            request.setAttribute("cat_name", cat_name);
	        }

	        // 전체 카테고리 또는 특정 카테고리 필터에 따른 목록 불러오기
	        chall_list = new ArrayList<>(); 
	        
	        //카테고리와 챌린지 상태 모두 null이 아닌 경우
		    if(category != null && (status != null && !status.isEmpty())) {
		    	chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, category, 0, visiChecked, status);
		    }
		    //카테고리만 null인 경우
		    else if(category == null && (status != null && !status.isEmpty())) {
		    	chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, null, 0, visiChecked, status);
		    }
		    //챌린지 상태만 null인 경우
		    else if(category != null && !category.isEmpty() && (status == null || status.isEmpty())) {
		    	chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, category, 0, visiChecked, null);
		    }
		    //둘다 null인 경우
		    else {
		    	chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, null, 0, visiChecked, null);
		    }
	    
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
	    
	    if(join_code != null) {
	    	ChallengeVO pv_chall = chall_dao.getPrivateChallenge(join_code);
	    	request.setAttribute("join_code", join_code);
	    	request.setAttribute("pv_chall", pv_chall);
	    }
	    
	    
	    
	    request.setAttribute("visi_checked", visiChecked);
	    request.setAttribute("status", status);
	    request.setAttribute("category", category);
	    request.setAttribute("count", count);
	    request.setAttribute("chall_list", chall_list);
	   
	    request.setAttribute("page", page.getPage());
	    
	    return "/challenge/challenge_list.jsp";
	}

}