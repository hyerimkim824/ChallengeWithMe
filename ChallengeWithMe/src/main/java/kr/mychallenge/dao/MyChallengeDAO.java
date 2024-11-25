package kr.mychallenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.mychallenge.vo.MyChallengeVO;
import kr.util.DBUtil;

//마이 챌린지 메인 페이지 DAO
public class MyChallengeDAO {
	//싱글턴 패턴
	private static MyChallengeDAO instance = new MyChallengeDAO();
	
	public static MyChallengeDAO getInstance() {
		return instance;
	}
	private MyChallengeDAO() {}
	
	/*//프로필 사진 넣기 & 수정
	public void updateMyPhoto(String us_img, long us_num)throws Exception{
	
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문
			sql
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
	}
	*/
	//참가수(연간누적)
	public long participateNum(long us_num)throws Exception{
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int total = 0;
		
		try {
			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT COUNT(*) FROM chall WHERE us_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 바인딩
			pstmt.setLong(1, us_num);
			
			//SQL문 실행
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                total = rs.getInt(1);
            }
			
			
		}catch(Exception e){
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return total;
		
		
	
	}
	//참가수(한달 평균)
	
	
	
	//달성률(그래프)
	
	//선호도
	
	//전체 챌린지 표시
	
	//챌린지 디테일 정보 2 (마이챌린지 표 만들기)
	//챌린지 디테일 정보 3(챌린지 리포트 보기)-> javascript로 구현할 가능성이 높음
	

}
