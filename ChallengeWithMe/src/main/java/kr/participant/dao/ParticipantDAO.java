package kr.participant.dao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
			sql = "SELECT us_num, ch_num, p_stat FROM participant WHERE us_num=? AND ch_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				if(!rs.getString("p_stat").equals("giveup")) {
					return true;
				}
			}
			
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return false;
	}
	//전체 참가정보 받기
	public List<ParticipantVO> checkAll() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ParticipantVO> list = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM participant";
			pstmt = conn.prepareStatement(sql);
			
			list = new ArrayList<ParticipantVO>();
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				ParticipantVO vo = new ParticipantVO();
				vo.setCh_num(rs.getLong("ch_num"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setP_date(rs.getString("p_date"));
				vo.setP_stat(rs.getString("p_stat"));
				vo.setEnd_date(rs.getString("end_date"));
				
				list.add(vo);
			}
			
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	
	public void quitChallenge(long us_num, long ch_num)throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;


		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE participant SET p_stat=?, end_date=SYSDATE WHERE us_num=? AND ch_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "giveup");
			pstmt.setLong(2, us_num);
			pstmt.setLong(3, ch_num);

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}


	}
	
	public ParticipantVO getPartDetail(long us_num, long ch_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ParticipantVO vo = null;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT us_num, ch_num, p_stat FROM participant WHERE us_num=? AND ch_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				vo = new ParticipantVO();
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCh_num(rs.getLong("ch_num"));
				vo.setEnd_date(rs.getString("end_date"));
				vo.setP_stat(rs.getString("p_stat"));
				vo.setP_date(rs.getString("p_date"));
			}
			
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return vo;
	}
	
	
}
