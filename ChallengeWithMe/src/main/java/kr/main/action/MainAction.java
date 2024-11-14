package kr.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

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
      
      
      
      
      //JSP 경로 반환
      return "main/main.jsp";
   }
}


