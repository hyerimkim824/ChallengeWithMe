package kr.mychallenge.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import kr.mychallenge.vo.MyChallengeVO;
import kr.util.DBUtil;
import kr.util.StringUtil;

//마이 챌린지 메인 페이지 DAO
public class MyChallengeDAO {
	//싱글턴 패턴
	private static MyChallengeDAO instance = new MyChallengeDAO();
	
	public static MyChallengeDAO getInstance() {
		return instance;
	}
	private MyChallengeDAO() {}
	
	
	//유저별 개설 challenge리스트 가져오기
	public List<MyChallengeVO> getListCh(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyChallengeVO> list = null;
		String sql = null;
		
		try {
			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			sql = "SELECT CHALL.ch_num FROM CHALL WHERE CHALL.us_num = ?";
		
			pstmt = conn.prepareStatement(sql);
			
			//?에 바인딩
			pstmt.setLong(1, us_num);
			
			rs= pstmt.executeQuery();
			list = new ArrayList<MyChallengeVO>();
			while(rs.next()) {
				MyChallengeVO mychall = new MyChallengeVO();
				mychall.setCh_num(rs.getLong("ch_num"));
				list.add(mychall);
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}		
		return list;
		
	
		
	}
	
	//유저별 참여 관련 챌린지 리스트
	
	public List<MyChallengeVO> getListPart(long us_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyChallengeVO> list = null;
		String sql = null;
		
		try {
			
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			sql = "SELECT ch_num FROM participant WHERE us_num = ?";
		
			pstmt = conn.prepareStatement(sql);
			
			//?에 바인딩
			pstmt.setLong(1, us_num);
			
			rs= pstmt.executeQuery();
			list = new ArrayList<MyChallengeVO>();
			while(rs.next()) {
				MyChallengeVO mychall = new MyChallengeVO();
				mychall.setCh_num(rs.getLong("ch_num"));
				list.add(mychall);
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}		
		return list;
		
	
		
	}
	
	//챌린지 디테일 정보 가져오기
	public MyChallengeVO getDetailChall(long ch_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyChallengeVO mychall = null;
		String sql = null;
		
		try {
			
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "SELECT * FROM chall WHERE ch_num=?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, ch_num);
			//SQL문 실행
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			   mychall = new MyChallengeVO();
			   mychall.setCh_num(rs.getLong("ch_num"));
			   mychall.setCh_title(rs.getString("ch_title"));
			   mychall.setCh_desc(rs.getString("ch_desc"));
			   mychall.setCh_start(rs.getString("ch_start"));
			   mychall.setCh_end(rs.getString("ch_end"));
			   mychall.setCh_img(rs.getString("ch_img"));
			   mychall.setCh_status(rs.getString("ch_status"));
			   mychall.setAuth_desc(rs.getString("auth_desc"));;
			   mychall.setAh_num(rs.getInt("ah_num"));
   
			   
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}		
		
		return mychall;
		
		
		
	}
	
	//챌린지별 인증 count
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
	/*public Map<String, Integer> achieveAVG(long us_num) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    Map<String, Integer> result = new HashMap<>(); // 결과 저장용 맵

	    try {
	        // 커넥션풀로부터 커넥션 할당
	        conn = DBUtil.getConnection();

	        // SQL문 작성
	        sql = "SELECT " +
	              "    COUNT(*) AS total_participated, " +
	              "    SUM(CASE WHEN p_stat = 'ongoing' THEN 1 ELSE 0 END) AS total_ongoing" +
	              "FROM participant " +
	              "WHERE us_num = ? " +
	              "AND p_date >= ADD_MONTHS(SYSDATE, -1)"; // 날짜 열 이름 수정

	        // PreparedStatement 객체 생성
	        pstmt = conn.prepareStatement(sql);

	        // ?에 바인딩
	        pstmt.setLong(1, us_num);

	        // SQL문 실행
	        rs = pstmt.executeQuery();

	        // 결과 가져오기
	        if (rs.next()) {
	            result.put("totalParticipated", rs.getInt("total_participated")); // 참여한 챌린지 수
	            result.put("totalOngoing", rs.getInt("total_ongoing")); // 잔향즁인 챌린지 수
	        }
	    } catch (Exception e) {
	        throw new Exception(e);
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return result; // 결과 반환
	}
	
	*/
	
	

	//챌린지 개별 달성률
	public List<Integer> achieveOne(long us_num, String ch_start, String ch_end) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Integer> list = new ArrayList<>();
	    String sql = null;

	    // 날짜 기간 계산하기
	    LocalDate startDate = LocalDate.parse(ch_start); // LocalDate로 변환
	    LocalDate endDate = LocalDate.parse(ch_end);     // LocalDate로 변환

	    // 기간 내의 일수를 계산 (끝날짜도 포함해야 하므로 +1)
	    long days = ChronoUnit.DAYS.between(startDate, endDate) + 1;

	    try {
	        // 커넥션풀로부터 커넥션 할당
	        conn = DBUtil.getConnection();

	        // SQL문 작성 (기간에 맞는 데이터 조회)
	        sql = "SELECT a.ch_proved1, a.ah_date FROM AUTH a "
	            + "JOIN CHALL c ON a.ch_num = c.ch_num "
	            + "WHERE a.us_num = ? "
	            + "AND c.ch_start >= TO_DATE(?,'YYYY-MM-DD') "
	            + "AND c.ch_start <= TO_DATE(?,'YYYY-MM-DD') "
	            + "ORDER BY c.ch_start";

	        // PreparedStatement 실행
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setLong(1, us_num);
	        pstmt.setString(2, ch_start);
	        pstmt.setString(3, ch_end);

	        // SQL 실행
	        rs = pstmt.executeQuery();

	        // 날짜별 값 채우기
	        Map<LocalDate, Integer> dateValueMap = new HashMap<>();
	        while (rs.next()) {
	            // 날짜는 `ch_start`로 가져오고, `ch_proved1` 값을 확인
	            LocalDate dbDate = rs.getDate("ah_date").toLocalDate(); // DB에서 가져온 날짜
	            int chProved1 = rs.getInt("ch_proved1");

	            // DB에서 ch_proved1 값이 0 이상일 때 1을 저장, 그 외에는 0
	            dateValueMap.put(dbDate, chProved1 > 0 ? 1 : 0);

	            // 디버깅을 위한 로그 출력
	            System.out.println("ch_start: " + dbDate + ", ch_proved1: " + chProved1);
	        }

	        // 날짜별로 값 리스트에 추가 (1 또는 0)
	        for (long currentIndex = 0; currentIndex < days; currentIndex++) {
	            LocalDate currentDate = startDate.plusDays(currentIndex);

	            // 날짜에 해당하는 값이 있는지 확인
	            if (dateValueMap.containsKey(currentDate)) {
	                list.add(dateValueMap.get(currentDate)); // 해당 날짜에 값이 있으면 1 또는 0 추가
	            } else {
	                list.add(0);  // 해당 날짜에 값이 없다면 0을 추가
	            }
	        }

	    } catch (Exception e) {
	        throw new Exception(e);

	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return list;
	}
	
	//평균 달성률
	
	public Map<String, Integer> achieveMonth(long us_num) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    Map<String, Integer> result = new HashMap<>(); // 결과 저장용 맵

	    try {
	        // 커넥션풀로부터 커넥션 할당
	        conn = DBUtil.getConnection();

	        // SQL문 작성
	        sql = "SELECT " +
	              "    COUNT(*) AS total_participated, " +
	              "    SUM(CASE WHEN p_stat = 'finished' THEN 1 ELSE 0 END) AS total_finished " +
	              "FROM participant " +
	              "WHERE us_num = ? " +
	              "AND p_date >= ADD_MONTHS(SYSDATE, -1)"; // 날짜 열 이름 수정

	        // PreparedStatement 객체 생성
	        pstmt = conn.prepareStatement(sql);

	        // ?에 바인딩
	        pstmt.setLong(1, us_num);

	        // SQL문 실행
	        rs = pstmt.executeQuery();

	        // 결과 가져오기
	        if (rs.next()) {
	            result.put("totalParticipated", rs.getInt("total_participated")); // 참여한 챌린지 수
	            result.put("totalFinished", rs.getInt("total_finished")); // 완료한 챌린지 수
	        }
	    } catch (Exception e) {
	        throw new Exception(e);
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return result; // 결과 반환
	}
	
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
		public Map<String, Integer> getListPartInfo(long us_num,String p_stat)throws Exception{
			Map<String, Integer> count = new HashMap<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			String sql = null;
			String sub_sql= null;
			int count1 =0;
			int count2 =0;
			
			
			
			try {
				
				//커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				
				//오토커밋 해제
				conn.setAutoCommit(false);
			
				//참여 챌린지 작성
				
				sql = "SELECT COUNT(ch_num) FROM participant WHERE p_stat=? AND us_num =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_stat);
				pstmt.setLong(2, us_num);
				pstmt.executeUpdate();
				
				rs1 = pstmt.executeQuery();
				
				while(rs1.next()) {
					count1 = rs1.getInt(1);
				}	
				
				count.put("part_count",count1);
				
				sql = "SELECT COUNT(ch_num) FROM chall WHERE us_num =?";
				pstmt2 = conn.prepareStatement(sql);
				pstmt2.setLong(1, us_num);
				pstmt2.executeUpdate();
				
				//SQL문 실행
				rs2 = pstmt2.executeQuery();
			
				while(rs2.next()) {
					count2 = rs2.getInt(1);
				}			
				
				
				count.put("chall_count",count2);
				
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				DBUtil.executeClose(rs1, pstmt, conn);
				DBUtil.executeClose(rs2, pstmt, conn);
			}		
			
			
			
			return count;
			
		}
		
		
		
	
	//챌린지 디테일 정보 3(챌린지 리포트 보기)-> javascript로 구현할 가능성이 높음
	

}
