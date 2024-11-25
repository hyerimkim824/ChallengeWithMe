package kr.mychallenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

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
	
	//달성률(챌린지 1개 달성률)
	public List<Integer> AchieveOne(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> list = new ArrayList<>();
		String sql = null;
	/*
		
		//날짜 기간 계산하기
		//시작 날짜 -> 년,월,일
		String year_start = ch_start.substring(0, 4); // 시작위치를 0에서 4까지로 제한
        String month_start = ch_start.substring(5, 7);// 시작위치를 5에서 7까지로 제한
        String day_start = ch_start.substring(8); 
        
      //시작 날짜 -> 년,월,일
      	String year_end = ch_end.substring(0, 4); // 시작위치를 0에서 4까지로 제한
        String month_end = ch_end.substring(5, 7);// 시작위치를 5에서 7까지로 제한
        String day_end = ch_end.substring(8); 
        
        //총 일수 계산
        LocalDate startDate = LocalDate.of(Integer.parseInt(year_start), Integer.parseInt(month_start), Integer.parseInt(day_start));
        LocalDate endDate = LocalDate.of(Integer.parseInt(year_end), Integer.parseInt(month_end), Integer.parseInt(day_end));

        // Period를 사용하여 두 날짜 간의 차이 계산
        Period period = Period.between(startDate, endDate);
        
        // 총 일수 계산
        int days = period.getDays();
        */
		
		try {
			

			//커넥션풀로부터 커넥션 할당
			 conn = DBUtil.getConnection();
			 
			 sql = "SELECT ch_proved FROM AUTH WHERE us_num=? ";
			 
			 //preparedStatement 객체 생성
			 pstmt= conn.prepareStatement(sql);
			 
			 pstmt.setLong(1,us_num);
			 
			 //SQL문 실행
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
	
				 list.add(rs.getInt("ch_proved"));
				 
			 }
			 
			 
		}catch(Exception e) {
			throw new Exception(e);
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
		
	
	}
	
	//달성률(한달 평균 달성률)
	
	//달성률(1년 평균 달성률)
	
	//선호도
	
		public List<Integer> preference(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> list = new ArrayList<>();
		String sql = null;

		
		try {
			

			//커넥션풀로부터 커넥션 할당
			 conn = DBUtil.getConnection();
			 
			 sql = "SELECT cate_num FROM PREF WHERE us_num=? ";
			 
			 //preparedStatement 객체 생성
			 pstmt= conn.prepareStatement(sql);
			 
			 pstmt.setLong(1,us_num);
			 
			 //SQL문 실행
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
	
				 list.add(rs.getInt("cate_num"));
				 
			 }
			 
			 
		}catch(Exception e) {
			throw new Exception(e);
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
		
	
	}
	
	
	
	//전체 챌린지 표시
	
	//챌린지 디테일 정보 2 (마이챌린지 표 만들기)
	//챌린지 디테일 정보 3(챌린지 리포트 보기)-> javascript로 구현할 가능성이 높음
	

}
