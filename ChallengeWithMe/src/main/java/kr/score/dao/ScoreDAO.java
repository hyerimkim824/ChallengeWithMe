package kr.score.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.challenge.dao.ChallengeDAO;
import kr.challenge.vo.ChallengeVO;
import kr.score.vo.ScoreVO;
import kr.util.DBUtil;

public class ScoreDAO {
	private static ScoreDAO instance = new ScoreDAO();

	public static ScoreDAO getInstance() {
		return instance;
	}
	private ScoreDAO() {};

	public boolean checkUser(long us_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT us_num FROM user_score WHERE us_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return false;
	}
	
	
	
	public ScoreVO getScoreInfo(long us_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ScoreVO vo = null;

		try {
			conn = DBUtil.getConnection();

			// SQL 작성
			sql = "SELECT " +
					"(SELECT COUNT(*) FROM participant WHERE us_num = ?) AS join_num, " +
					"(SELECT COUNT(*) FROM participant WHERE us_num = ? AND p_stat = 'finished') AS complete_num, " +
					"(SELECT COUNT(*) FROM chall WHERE us_num = ?) AS create_num, " +
					"(SELECT NVL(SUM(trans_bal), 0) FROM trans WHERE from_num = ?) AS spend_amount, " +
					"(SELECT NVL(SUM(charge_bal), 0) FROM charge WHERE us_num = ?) AS charge_amount, " +
					"(SELECT COUNT(*) FROM participant WHERE us_num = ? AND p_stat = 'giveup') AS quit_amount " +
					"FROM DUAL";

			pstmt = conn.prepareStatement(sql);

			// 파라미터 설정
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, us_num);
			pstmt.setLong(3, us_num);
			pstmt.setLong(4, us_num);
			pstmt.setLong(5, us_num);
			pstmt.setLong(6, us_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new ScoreVO();
				
				vo.setUs_num(us_num);
				vo.setJoin_num(rs.getInt("join_num"));
				vo.setComplete_num(rs.getInt("complete_num"));
				vo.setCreate_num(rs.getInt("create_num"));
				vo.setSpend_amount(rs.getInt("spend_amount"));
				vo.setCharge_amount(rs.getInt("charge_amount"));
				vo.setQuit_amount(rs.getInt("quit_amount"));
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return vo;
	}
	
	public void updateScoreInfo(ScoreVO vo) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE user_score SET us_score=?, join_num = ?,complete_num = ?,create_num = ?,charge_amount = ?,"
					+ "spend_amount = ?,quit_amount = ? WHERE us_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			int score = calculateScore(vo);
			
			pstmt.setInt(1, score);
			pstmt.setInt(2, vo.getJoin_num());
			pstmt.setInt(3, vo.getComplete_num());
			pstmt.setInt(4, vo.getCreate_num());
			pstmt.setInt(5, vo.getCharge_amount());
			pstmt.setInt(6, vo.getSpend_amount());
			pstmt.setInt(7, vo.getQuit_amount());
			pstmt.setLong(8, vo.getUs_num());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	
	}
	
	public void CreateScore(ScoreVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO user_score (us_num, us_score, join_num, complete_num, create_num, charge_amount, spend_amount, quit_amount) VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, vo.getUs_num());
			pstmt.setInt(2, vo.getUs_score());
			pstmt.setInt(3, vo.getJoin_num());
			pstmt.setInt(4, vo.getComplete_num());
			pstmt.setInt(5, vo.getCreate_num());
			pstmt.setInt(6, vo.getCharge_amount());
			pstmt.setInt(7, vo.getSpend_amount());
			pstmt.setInt(8, vo.getQuit_amount());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	
	
	public int calculateScore(ScoreVO vo) throws Exception {
		
		int join_score = vo.getJoin_num();
		int complete_score = vo.getComplete_num() * 3;
		int create_num = vo.getCreate_num();
		int spend_amount = vo.getSpend_amount() / 1000;
		int quit_amount = vo.getQuit_amount() * 5;
		int charge_amount = vo.getCharge_amount() / 700;
		//인증에 대한 점수도 후에 구현
		int sum = join_score + complete_score + create_num + spend_amount + charge_amount;
		
		int score = sum >= quit_amount ? sum - quit_amount : 0;
		
		return score;
	}

}
