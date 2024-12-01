package kr.challenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.dao.ChallengeLikeDAO;
import kr.challenge.vo.ChallengeLikeVO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.participant.dao.ParticipantDAO;
import kr.xuser.vo.XuserVO;

public class ChallengeDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		
		
		ChallengeDAO dao = ChallengeDAO.getInstance();
		int admin = dao.checkAdmin(us_num);
		long ch_num = Long.parseLong(request.getParameter("ch_num"));
		ChallengeVO chall = dao.getChallengeDetail(ch_num);
		dao.plusView(chall);
		
		String[] auth_name = {"사진 인증", "시간 인증", "문구 인증", "QR 인증", "게임 인증", "가계부 인증"};
		String[] auth_detail = {"사진 올리기(일정 시간 내에 사진을 올리고 인증)",
								"시간 설정 버튼(온클릭 방식으로 눌러서 시작과 끝을 CHECK)",
								"문구따라쓰기(기상 미션 중 하나로 명언 따라쓰기)",
								"QR코드 : 일정 시간 내에 QR코드를 통해 인증",
								"간단한 아침 기상용게임(e.g 구구단 문제 등)",
								"간단한 가계부 작성(e.g 소비,저축,지출)"};
		
		String this_auth_name = auth_name[chall.getAh_num() - 1];
		String this_auth_detail = auth_detail[chall.getAh_num() - 1];
		MyPageDAO mp_dao = MyPageDAO.getInstance();
		
		XuserVO user = mp_dao.getMyInfo(chall.getUs_num());
		Integer us_bal = Integer.parseInt(user.getWallet());
		
		String us_nickname = user.getNickname();
		
		ChallengeLikeDAO like_dao = ChallengeLikeDAO.getInstance();
		boolean liked = like_dao.checkLikeByUser(us_num, ch_num);
		
		if(liked) {
			chall.setHeart_status(true);
		}else {
			chall.setHeart_status(false);
		}
		
		ParticipantDAO p_dao = ParticipantDAO.getInstance();
		
		boolean joined = p_dao.isJoined(us_num, ch_num);
		System.out.println("Joined는 " + joined + "상태입니다");
		
		request.setAttribute("us_bal", us_bal);
		request.setAttribute("chall", chall);
		request.setAttribute("us_nickname", us_nickname);
		request.setAttribute("auth_name", auth_name);
		request.setAttribute("joined", joined);
		request.setAttribute("this_auth_name", this_auth_name);
		request.setAttribute("this_auth_detail", this_auth_detail);
		request.setAttribute("admin", admin);
		
		
		return "/challenge/challenge_detail.jsp?";
	}
	
	
}
