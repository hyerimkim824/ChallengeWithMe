package kr.challenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.challenge.vo.ChallengeLikeVO;
import kr.util.DBUtil;

public class ChallengeLikeDAO {
	
	private static ChallengeLikeDAO instance = new ChallengeLikeDAO();

	public static ChallengeLikeDAO getInstance() {
		return instance;
	}
	private ChallengeLikeDAO() {}
		
	public List<ChallengeLikeVO> checkLike() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ChallengeLikeVO> list = new ArrayList<ChallengeLikeVO>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM chall_like";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChallengeLikeVO vo = new ChallengeLikeVO();
				
				vo.setCh_num(rs.getLong("ch_num"));
				vo.setUs_num(rs.getLong("us_num"));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public boolean checkLikeByUser(long us_num, long ch_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ChallengeLikeVO vo = new ChallengeLikeVO();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM chall_like WHERE us_num=? AND ch_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCh_num(rs.getLong("ch_num"));
				
				return true;
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return false;
	}
	
	public void addLike(long us_num, long ch_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO chall_like SET(us_num, ch_num) VALUES(?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
			
			pstmt.executeUpdate();
					
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	public void deleteLike(long us_num, long ch_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE chall_like WHERE us_num=? AND ch_num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
			
			pstmt.executeUpdate();
					
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
}
