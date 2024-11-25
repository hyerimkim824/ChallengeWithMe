package kr.participant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.participant.vo.ParticipantVO;
import kr.util.DBUtil;

public class ParticipantDAO {
	private static ParticipantDAO instance = new ParticipantDAO();

	public static ParticipantDAO getInstance() {
		return instance;
	}
	private ParticipantDAO() {}
	
	public void joinChallenge(ParticipantVO vo, String status) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO participant (us_num, ch_num, p_stat, p_date) VALUES (?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, vo.getUs_num());
			pstmt.setLong(2, vo.getCh_num());
			pstmt.setString(3, status);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	public boolean isJoined(long us_num, long ch_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT us_num, ch_num FROM participant WHERE us_num=? AND ch_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return false;
	}
	
}
