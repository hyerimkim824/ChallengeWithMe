package kr.challenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.challenge.vo.ChallengeVO;
import kr.util.DBUtil;

public class ChallengeDAO {
	private static ChallengeDAO instance = new ChallengeDAO();

	public static ChallengeDAO getInstance() {
		return instance;
	}
	private ChallengeDAO() {}
	
	//사용자가 개설한 챌린지 목록
	public List<ChallengeVO> getList() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		ResultSet rs = null;
		List<ChallengeVO> list = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM chall";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ChallengeVO>();
			
			while(rs.next()) {
				ChallengeVO vo = new ChallengeVO();
				vo.setCate_num(rs.getLong("cate_num"));
				vo.setCh_title(rs.getString("ch_title"));
				vo.setCh_desc(rs.getString("ch_desc"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_img(rs.getString("ch_img"));
				vo.setCh_min(rs.getInt("ch_min"));
				vo.setCh_person(rs.getInt("ch_person"));
				vo.setCh_visi(rs.getInt("ch_visi"));
				vo.setTrans_bal(rs.getInt("trans_bal"));
				vo.setOfficial(rs.getInt("official"));
				vo.setCh_status(rs.getString("ch_status"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCate_num(rs.getLong("cate_num"));
				
				list.add(vo);
				
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
	}
}
