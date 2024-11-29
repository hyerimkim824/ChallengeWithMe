package kr.mychallenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import kr.mychallenge.vo.MyChallengeAccountVO;
import kr.util.DBUtil;

public class MyChallengeAccountDAO {
	
	//싱글턴 패턴
	private static MyChallengeAccountDAO instance = new MyChallengeAccountDAO();
	
	public static MyChallengeAccountDAO getInstance() {
		return instance;
	}
	
	private MyChallengeAccountDAO() {}
	
	//가계부 등록
	public void insertAccount(MyChallengeAccountVO myaccount)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "INSERT INTO account (ac_num,ac_date,ac_content,ac_income,ac_outcome,"
					+ "ac_bal,ac_card,ac_money,acmemo) VALUES(ac_seq.nextval,SYSDATE,?,?,?,?,?,?,?)";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터 바인딩
			
			pstmt.setString(1, myaccount.getAc_content());
			pstmt.setDouble(2, myaccount.getAc_income());
			pstmt.setDouble(3, myaccount.getAc_outcome());
			pstmt.setDouble(4, myaccount.getAc_bal());
			pstmt.setInt(5,myaccount.getAc_card());
			pstmt.setInt(6,myaccount.getAc_money());
			pstmt.setString(7,myaccount.getAc_memo());
			
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		
	}
	
	//날짜별 총 구매 금액
	
	
	//전체 가계부 목록(or 테이블) - 날짜만 나오도록
	public List<MyChallengeAccountVO> getListAccount(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyChallengeAccountVO> list = null;
	
		String sql = null;
		
		try {
			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT ac_date FROM account JOIN AUTH USING(ah_date) WHERE us_num=? ORDER BY ac_date DESC";
	
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
		
		
	}
	
	
	//가계부 상세(날짜를 누르면 상세페이지로)
	
	public MyChallengeAccountVO getAccount(MyChallengeAccountVO mychall)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyChallengeAccountVO mychallsaved = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM account WHERE us_num=? AND ac_date=?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, mychall.getUs_num());
			pstmt.setString(2, mychall.getAc_date());
			
			//SQL문 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mychallsaved = new MyChallengeAccountVO();
				mychallsaved.setAc_date(rs.getString("ac_date"));
				mychallsaved.setAc_content(rs.getString("ac_content"));
				mychallsaved.setAc_income(rs.getDouble("ac_income"));
				mychallsaved.setAc_outcome(rs.getDouble("ac_outcome"));
				mychallsaved.setAc_bal(rs.getDouble("ac_bal"));
				mychallsaved.setAc_card(rs.getInt("ac_card"));
				mychallsaved.setAc_money(rs.getInt("ac_money"));
				mychallsaved.setAc_memo(rs.getString("ac_memo"));
			
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}		
	
		return mychallsaved;
	}
	
	//가계부 수정(개별 값 수정)
	//가계부 삭제
	
	
	

}
