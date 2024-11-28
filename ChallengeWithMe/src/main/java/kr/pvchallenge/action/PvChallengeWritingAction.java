package kr.pvchallenge.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class PvChallengeWritingAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		
		ArrayList<String> wise = new ArrayList<String>();
		
		wise.add("공부 안하면 더울 때 더운데서 일하고 추울 때 추운데서 일한다.");
		wise.add("시작은 반이 아니다. 시작일뿐이다.");
		wise.add("늦었다고 생각할 때가 정말 늦은 것이다. 당장 시작해라.");
		wise.add("가는 말이 고우면 얕본다");
		wise.add("참일 인 세번이면 호구다.");
		wise.add("헌신하면 헌신짝된다.");
		wise.add("일찍 일어나는 새가 피곤하다.");
		wise.add("일찍 일어난 벌레는 잡아 먹힌다.");
		wise.add("내 너 그럴줄 알았다. 알았으면 제발 미리 말을 해줘라!");
		wise.add("성공은 1%의 재능과 99%의 빽");		
		
		session.setAttribute("wiselist", wise);
		
		
		return "pvchallenge/pvChallengeWriting.jsp";
	}

}
