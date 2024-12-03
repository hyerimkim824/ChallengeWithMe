package kr.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.participant.dao.ParticipantDAO;
import kr.score.dao.ScoreDAO;
import kr.score.vo.ScoreVO;
import kr.xuser.vo.XuserVO;

public class MainAction implements Action{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      HttpSession session = request.getSession();
      Long us_num = (Long)session.getAttribute("us_num");
      
      int admin = 0;
      
      if(us_num != null) {
         admin = (int)session.getAttribute("admin");
      }
      
      request.setAttribute("us_num", us_num);
      request.setAttribute("admin", admin);
      
      ChallengeDAO chall_dao = ChallengeDAO.getInstance();
      
      
      List<ChallengeVO> chall_list = chall_dao.showPopularChallenge(0);
      List<ChallengeVO> official_list = chall_dao.showPopularChallenge(1);
      
      request.setAttribute("chall_list", chall_list);
      request.setAttribute("official_list", official_list);
      
      if(us_num != null) {
    	  MyPageDAO mp_dao = MyPageDAO.getInstance();
          XuserVO x_vo = mp_dao.getMyInfo(us_num);
          
          request.setAttribute("xuser", x_vo);
          
          ScoreDAO score_dao = ScoreDAO.getInstance();
          ScoreVO score_vo = score_dao.getScoreInfo(us_num);
          int score = score_dao.calculateScore(score_vo);
          score_vo.setUs_score(score);
          
          request.setAttribute("score_vo", score_vo);
          
          int rank = 1;
          if(score_vo.getUs_score() <= 30) {
        	  rank = 1;
          }else if(score_vo.getUs_score() > 30 && score_vo.getUs_score() <= 60) {
        	  rank = 2;
          }else if(score_vo.getUs_score() > 60 && score_vo.getUs_score() <= 100) {
        	  rank = 3;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200) {
        	  rank = 4;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200){
        	  rank = 5;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200){
        	  rank = 6;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200){
        	  rank = 7;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200){
        	  rank = 8;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200){
        	  rank = 9;
          }else if(score_vo.getUs_score() > 100 && score_vo.getUs_score() <= 200){
        	  rank = 10;
          }
          
          List<Integer> bgInfo = mp_dao.getBadgeInfo(us_num);
          int bgInfoSize = bgInfo.size();
          String bg_img = mp_dao.getMainBadge(us_num);
          
          request.setAttribute("rank", rank);
          request.setAttribute("bgInfo", bgInfoSize);
          request.setAttribute("bg_img", bg_img);
      }
      //JSP 경로 반환
      return "main/main.jsp";
   }
}


