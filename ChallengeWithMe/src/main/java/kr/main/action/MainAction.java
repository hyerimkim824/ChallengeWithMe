package kr.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.participant.dao.ParticipantDAO;

public class MainAction implements Action{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      HttpSession session = request.getSession();
      Long user_num = (Long)session.getAttribute("us_num");
      
      int admin = 0;
      
      if(user_num != null) {
         admin = (int)session.getAttribute("admin");
      }
      
      request.setAttribute("us_num", user_num);
      request.setAttribute("admin", admin);
      
      ChallengeDAO chall_dao = ChallengeDAO.getInstance();
      
      
      List<ChallengeVO> chall_list = chall_dao.showPopularChallenge(0);
      List<ChallengeVO> official_list = chall_dao.showPopularChallenge(1);
      
      request.setAttribute("chall_list", chall_list);
      request.setAttribute("official_list", official_list);
      
      //JSP 경로 반환
      return "main/main.jsp";
   }
}


