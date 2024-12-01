package kr.score.action;

import kr.score.dao.ScoreDAO;
import kr.score.vo.ScoreVO;

public class RefreshUserScore {
	
	public void refresh(long us_num) throws Exception{
		ScoreDAO score_dao = ScoreDAO.getInstance();
		 ScoreVO score_vo = score_dao.getScoreInfo(us_num);
		
		 int score = score_dao.calculateScore(score_vo);
		 score_vo.setUs_score(score);
		 
		 boolean hasUserScore = score_dao.checkUser(us_num);
		 
		 if(hasUserScore) {
			 score_dao.updateScoreInfo(score_vo);
		 }else {
			 score_dao.CreateScore(score_vo);
		 }
	}
}
