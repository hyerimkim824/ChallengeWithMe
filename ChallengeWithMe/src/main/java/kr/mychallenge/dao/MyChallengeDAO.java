package kr.mychallenge.dao;

import java.sql.Connection;

//마이 챌린지 메인 페이지 DAO
public class MyChallengeDAO {
	//싱글턴 패턴
	private static MyChallengeDAO instance = new MyChallengeDAO();
	
	public static MyChallengeDAO getInstance() {
		return instance;
	}
	private MyChallengeDAO() {}
	
	//프로필 사진 넣기 & 수정
	public void updateMyPhoto(String us_img, long us_num)throws Exception{
	
		
		Connection conn = null;
		//PreparedStatment pstmt = null;
		//String sql 
		
	}
	
	//챌린지 디테일 정보1 (참여 챌린지 및 개설 챌린지로 이동)
	//챌린지 디테일 정보 2 (마이챌린지 표 만들기)
	//챌린지 디테일 정보 3(챌린지 리포트 보기)-> javascript로 구현할 가능성이 높음
	

}
