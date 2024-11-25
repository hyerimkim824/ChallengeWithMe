package kr.challenge.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.dao.ChallengeLikeDAO;
import kr.challenge.vo.ChallengeLikeVO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.util.StringUtil;

public class ChallengeLikeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		Map<String, Object> mapAjax = new HashMap<String, Object>();
		
		if(us_num == null) {
			mapAjax.put("result", "logout");
		}
		else {
			mapAjax.put("result", "success");
			long ch_num = Long.parseLong(request.getParameter("ch_num"));
			ChallengeLikeDAO like_dao = ChallengeLikeDAO.getInstance();
			ChallengeDAO chall_dao = ChallengeDAO.getInstance();
			ChallengeVO chall_vo = chall_dao.getChallengeDetail(ch_num);
			
			boolean isliked = like_dao.checkLikeByUser(us_num, ch_num);
			
			if(isliked==true) {
				mapAjax.put("myLike", "undo");
				like_dao.deleteLike(us_num, ch_num);
				chall_dao.minusLike(chall_vo);
			}
			else {
				mapAjax.put("myLike", "do");
				like_dao.addLike(us_num, ch_num);
				chall_dao.plusLike(chall_vo);
			}
		}

		return StringUtil.parseJSON(request, mapAjax);
	}

}
