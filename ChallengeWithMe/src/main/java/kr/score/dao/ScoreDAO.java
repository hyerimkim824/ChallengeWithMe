package kr.score.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.score.vo.ScoreVO;
import kr.util.DBUtil;

public class ScoreDAO {
private static ScoreDAO instance = new ScoreDAO();
	
	public static ScoreDAO getInstance() {
		return instance;
	}
	private ScoreDAO() {};
	
	
	public ScoreVO getScoreInfo(long us_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ScoreVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new ScoreVO();
				vo.setUs_num(rs.getLong("us_num"));
				vo.setUs_score(rs.getInt("us_score"));
				vo.setJoin_num(rs.getInt("join_num"));
				vo.setComplete_num(rs.getInt("complete_num"));
				vo.setCreate_num(rs.getInt("create_num"));
				vo.setCharge_amount(rs.getInt("charge_amount"));
				vo.setSpend_amount(rs.getInt("spend_amount"));
				vo.setQuit_amount(rs.getInt("quit_amount"));
				
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return vo;
		
	}
	
}
