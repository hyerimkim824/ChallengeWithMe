package kr.mychallenge.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;
import kr.mychallenge.vo.MyChallengeVO;

public class MyChallengePartAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		// 로그인 된 경우
		MyChallengeDAO dao = MyChallengeDAO.getInstance();

		if (us_num == null) {
			// 로그인 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
		}else {
			// 서블릿에서 part_list와 part_img를 함께 Map에 담아서 전달
			List<MyChallengeVO> partList = dao.getListPart(us_num);  // part_list
			List<MyChallengeVO> partImgList = dao.getImg(93);  // part_img (ch_img 정보를 담고 있는 리스트)

			Map<String, Object> data = new HashMap<>();
			data.put("part_list", partList);
			data.put("part_img_list", partImgList);

			request.setAttribute("data", data);}
		
		return "mychallenge/myChallengePart.jsp";
		}
}
