package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class DetailAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String supNumParam = request.getParameter("sup_num");
        if (supNumParam == null || supNumParam.trim().isEmpty()) {
            return "support/invalidAccess.jsp";
        }

        long supNum;
        try {
            supNum = Long.parseLong(supNumParam);
        } catch (NumberFormatException e) {
            return "support/invalidAccess.jsp";
        }

        SupportDAO dao = SupportDAO.getInstance();
        SupportVO support = dao.getSupportById(supNum);
        if (support == null) {
            return "support/notfound.jsp";
        }

        request.setAttribute("support", support);
        return "support/detail.jsp";
    }
}
