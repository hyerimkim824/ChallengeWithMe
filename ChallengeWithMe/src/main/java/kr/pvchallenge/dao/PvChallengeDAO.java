package kr.pvchallenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.util.DBUtil;

public class PvChallengeDAO {
	
	//싱글턴 패턴
	private static PvChallengeDAO instance = new PvChallengeDAO();
	public static PvChallengeDAO getInstance() {
		return instance;
	}
	private PvChallengeDAO() {}
	
	//인증 사진 insert
	//우선 시작 시간 임의로 설정
	public void insertPvImg(String ah_img, long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "UPDATE auth SET ah_img=? WHERE us_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, ah_img);
			pstmt.setLong(2, us_num);
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
	}
	
	
	
	
}
 