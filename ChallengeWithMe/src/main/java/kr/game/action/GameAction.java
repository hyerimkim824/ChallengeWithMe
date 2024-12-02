package kr.game.action;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class GameAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		Integer game_num = Integer.parseInt(request.getParameter("game_num"));
		
		int[] firstNum = new int[5];
		int[] secondNum = new int[5];
		String[] operator = new String[5];
		int[] answer = new int[5];
		
		generateRandomExpressions(firstNum, secondNum, operator, answer);
		
		request.setAttribute("game_num", "game_num");
		request.setAttribute("num1", firstNum);
		request.setAttribute("num2", secondNum);
		request.setAttribute("operator", operator);
		request.setAttribute("answer", answer);
		
		return "/challenge/challenge_game.jsp";
	}
	
	public static void generateRandomExpressions(int[] firstNum, int[] secondNum, String[] operator, int[] answer) {
		Random random = new Random();
		String[] operators = {"*", "-", "/", "+"};

		for (int i = 0; i < 5; i++) {
			// 1부터 30까지의 랜덤 정수 생성
			firstNum[i] = random.nextInt(30) + 1;
			secondNum[i] = random.nextInt(30) + 1;

			// 연산자 랜덤 선택
			operator[i] = operators[random.nextInt(operators.length)];

			// 연산 수행
			switch (operator[i]) {
			case "*":
				answer[i] = firstNum[i] * secondNum[i];
				break;
			case "-":
				answer[i] = firstNum[i] - secondNum[i];
				break;
			case "/":
				// 0으로 나누지 않도록 보정
				if (secondNum[i] == 0) secondNum[i] = 1;
				answer[i] = firstNum[i] / secondNum[i];
				break;
			case "+":
				answer[i] = firstNum[i] + secondNum[i];
				break;
			}
		}
	}

}
 