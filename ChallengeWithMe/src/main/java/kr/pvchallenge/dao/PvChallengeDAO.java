package kr.pvchallenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.pvchallenge.vo.PvChallengeVO;
import kr.util.DBUtil;

public class PvChallengeDAO {
	
	//싱글턴 패턴
	private static PvChallengeDAO instance = new PvChallengeDAO();
	public static PvChallengeDAO getInstance() {
		return instance;
	}
	private PvChallengeDAO() {}
	
	public void insertPv(PvChallengeVO pvchall) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    int result = 0;

	    try {
	        conn = DBUtil.getConnection();

	        // 중복 확인
	        String checkSql = "SELECT COUNT(*) FROM auth WHERE us_num = ? AND TRUNC(ah_date) = TRUNC(SYSDATE)";
	        pstmt = conn.prepareStatement(checkSql);
	        pstmt.setLong(1, pvchall.getUs_num()); // us_num 값 바인딩
	        rs = pstmt.executeQuery();

	        if (rs.next() && rs.getInt(1) > 0) {
	            result = 1; // 이미 데이터가 존재하면 result를 1로 설정
	        }

	        // 기존 Statement 닫기
	        pstmt.close();

	        if (result != 1) { // 중복이 아닐 경우 데이터 삽입
	            // 삽입 SQL
	            sql = "INSERT INTO auth (ah_num, ah_img, ch_proved1, ah_date, us_num, ch_num, ch_proved2, ch_proved3, ch_proved4, ch_proved5) "
	                + "VALUES (auth_seq.nextval, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);

	            // ?에 데이터 바인딩
	            pstmt.setString(1, pvchall.getAh_img());
	            pstmt.setInt(2, pvchall.getCh_proved1());
	            pstmt.setLong(3, pvchall.getUs_num()); // us_num 바인딩
	            pstmt.setLong(4, pvchall.getCh_num()); // ch_num 바인딩
	            pstmt.setInt(5, pvchall.getCh_proved2());
	            pstmt.setInt(6, pvchall.getCh_proved3());
	            pstmt.setInt(7, pvchall.getCh_proved4());
	            pstmt.setInt(8, pvchall.getCh_proved5());

	            // 삽입
	            pstmt.executeUpdate();
	        }
	    } catch (Exception e) {
	        throw new Exception("Error while inserting PvChallenge data: " + e.getMessage(), e);
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }
	}
	
	
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
	
	//모든 정보 읽기
public PvChallengeVO getPvInfoAll(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PvChallengeVO pvchall = null;
		String sql = null;
		
		try {
			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//sql문 실행
			sql = "SELECT * FROM AUTH WHERE us_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, us_num);
			
			//SQL문 실행
			rs = pstmt.executeQuery();
		
			
			while(rs.next()) {
				
				pvchall = new PvChallengeVO();
		
				pvchall.setCh_num(rs.getLong("ch_num"));
				pvchall.setCh_proved(rs.getInt("ch_proved1"));
				pvchall.setAh_date(rs.getString("ah_date"));
				pvchall.setAh_img(rs.getString("ah_img"));
				pvchall.setCh_proved(rs.getInt("ch_proved2"));
				pvchall.setCh_proved(rs.getInt("ch_proved3"));
				pvchall.setCh_proved(rs.getInt("ch_proved4"));
				pvchall.setCh_proved(rs.getInt("ch_proved5"));

				
			}

			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return pvchall;
	}
	
	public PvChallengeVO getPvInfo(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PvChallengeVO pvchall = null;
		String sql = null;
		
		try {
			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//sql문 실행
			sql = "SELECT CHALL.ch_num, ch_proved1, ah_date, ah_img FROM CHALL INNER JOIN AUTH ON CHALL.us_num = AUTH.us_num"
					+ " WHERE CHALL.us_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, us_num);
			
			//SQL문 실행
			rs = pstmt.executeQuery();
		
			
			while(rs.next()) {
				
				pvchall = new PvChallengeVO();
		
				pvchall.setCh_num(rs.getLong("ch_num"));
				pvchall.setCh_proved(rs.getInt("ch_proved1"));
				pvchall.setAh_date(rs.getString("ah_date"));
				pvchall.setAh_img(rs.getString("ah_img"));
			}

			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return pvchall;
	}
	
		public void updatePvInfo(long us_num, long ch_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "UPDATE auth SET ch_proved1=1 WHERE us_num=? AND ch_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, us_num);
			pstmt.setLong(2, ch_num);
	
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
	}
		
		public void updatePvInfo3(long us_num, long ch_num)throws Exception{
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				//커넥션 풀로부터 커넥션을 할당
				conn = DBUtil.getConnection();
				//sql문 작성
				sql = "UPDATE auth SET ch_proved3=1 WHERE us_num=? AND ch_num=?";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setLong(1, us_num);
				pstmt.setLong(2, ch_num);
		
				//SQL문 실행
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				DBUtil.executeClose(null, pstmt, conn);
			}
			
		}
		
		
		
	
}
 