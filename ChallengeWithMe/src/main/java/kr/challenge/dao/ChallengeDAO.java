package kr.challenge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import kr.challenge.vo.ChallengeVO;
import kr.util.DBUtil;

public class ChallengeDAO {
	private static ChallengeDAO instance = new ChallengeDAO();

	public static ChallengeDAO getInstance() {
		return instance;
	}
	private ChallengeDAO() {}

	public int getListCount(String keyfield, String keyword, String cate_num, int official, int visi, String status) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		String sub_sql = "";
		int cnt = 1; // 초기값 1로 설정
		int count = 0;

		try {
			// 커넥션 풀에서 연결 가져오기
			conn = DBUtil.getConnection();

			// 검색 조건 처리
			if (keyword != null && !"".equals(keyword)) {
				if ("0".equals(keyfield)) {
					sub_sql = " AND (c.ch_title LIKE '%' || ? || '%' OR us.us_nickname LIKE '%' || ? || '%')";
				} 
				else if ("1".equals(keyfield)) {
					sub_sql = " AND c.ch_title LIKE '%' || ? || '%'";
				}
				else if ("2".equals(keyfield)) {
					sub_sql = " AND us.us_nickname LIKE '%' || ? || '%'";
				}
				else {
					throw new IllegalArgumentException("Invalid keyfield value");
				}
			}
			
			
			
			// 카테고리 조건 처리
			if (cate_num != null && !"0".equals(cate_num)) {
			    sub_sql += " AND cat.cate_num=?";
			}
			
			if((status != null && !"".equals(status))) {
				sub_sql += " AND c.ch_status=?";
			}

			// 최종 SQL 생성
			sql = "SELECT COUNT(*) FROM chall c "
			        + "JOIN user_detail us ON c.us_num = us.us_num "
			        + "JOIN cate cat ON c.cate_num = cat.cate_num WHERE c.official=? AND ch_visi=?" + sub_sql;
			// PreparedStatement 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(cnt++, official);
			pstmt.setInt(cnt++, visi);
			// 파라미터 바인딩
			if (keyword != null && !"".equals(keyword)) {
				if(keyfield.equals("0")) {
					pstmt.setString(cnt++, keyword);
					pstmt.setString(cnt++, keyword);
				}else {
					pstmt.setString(cnt++, keyword);
				}
			}
			if (cate_num != null) {
				pstmt.setInt(cnt++, Integer.parseInt(cate_num));  // cate_num 바인딩
			}
			if (status != null) {
				pstmt.setString(cnt++, status); 
			}

			// SQL 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return count;
	}

	//챌린지 목록
	public List<ChallengeVO> getList(int start, int end, String keyfield, String keyword, String cat_num, int official, int visi, String status) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sub_sql = "";

		ResultSet rs = null;
		List<ChallengeVO> list = null;
		int cnt = 1;

		try {
			conn = DBUtil.getConnection();

			if(keyword != null && !"".equals(keyword)) {
				if(keyfield.equals("0")) sub_sql += " AND (chall.ch_title LIKE '%' || ? || '%' OR us.us_nickname LIKE '%' || ? || '%')";
				else if(keyfield.equals("1")) sub_sql += " AND chall.ch_title LIKE '%' || ? || '%'";
				else if(keyfield.equals("2")) sub_sql += " AND us.us_nickname LIKE '%' || ? || '%'";

			}

			if (cat_num != null && !"0".equals(cat_num)) {
			    sub_sql += " AND cate.cate_num=?";
			}
			
			if((status != null && !"".equals(status))) {
				sub_sql += " AND chall.ch_status=?";
			}

			sql = "SELECT * FROM (SELECT chall.*, cate.cate_name, us.us_nickname, rownum AS rnum"
			        + " FROM chall JOIN cate ON chall.cate_num = cate.cate_num JOIN user_detail us ON chall.us_num = us.us_num WHERE chall.official=? AND ch_visi=?" + sub_sql
			        + " ORDER BY ch_num DESC) WHERE rnum >= ? AND rnum <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(cnt++, official);
			pstmt.setInt(cnt++, visi);

			if (keyword != null && !"".equals(keyword)) {
				if(keyfield.equals("0")) {
					pstmt.setString(cnt++, keyword);
					pstmt.setString(cnt++, keyword);
				}else {
					pstmt.setString(cnt++, keyword);
				}
			}
			if (cat_num != null) {
				pstmt.setInt(cnt++, Integer.parseInt(cat_num));  
			}
			if (status != null) {
				pstmt.setString(cnt++, status); 
			}
			pstmt.setInt(cnt++, start);
			pstmt.setInt(cnt++, end);


			rs = pstmt.executeQuery();
			list = new ArrayList<ChallengeVO>();

			while(rs.next()) {
				ChallengeVO vo = new ChallengeVO();
				vo.setCh_num(Long.parseLong(rs.getString("ch_num")));
				vo.setCh_title(rs.getString("ch_title"));
				vo.setCh_desc(rs.getString("ch_desc"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_img(rs.getString("ch_img"));
				vo.setCh_min(rs.getInt("ch_min"));
				vo.setCh_max(rs.getInt("ch_max"));
				vo.setCh_like(rs.getInt("ch_like"));
				vo.setCh_view(rs.getInt("ch_view"));
				vo.setCh_person(rs.getInt("ch_person"));
				vo.setCh_visi(rs.getInt("ch_visi"));
				vo.setTrans_bal(rs.getInt("trans_bal"));
				vo.setOfficial(rs.getInt("official"));
				vo.setCh_status(rs.getString("ch_status"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCate_num(rs.getInt("cate_num"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCh_authd(rs.getInt("ch_authd"));
				vo.setAh_num(rs.getInt("ah_num"));


				list.add(vo);

			}

		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return list;
	}

	//챌린지 카테고리별 목록 
	public List<ChallengeVO> getListByCat(int cat_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		ResultSet rs = null;
		List<ChallengeVO> list = null;

		try {
			conn = DBUtil.getConnection();
			sql = "SELECT chall.*, cate.cate_name FROM chall JOIN cate ON chall.cate_num = cate.cate_num WHERE chall.cate_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cat_num);

			rs = pstmt.executeQuery();
			list = new ArrayList<ChallengeVO>();

			while(rs.next()) {
				ChallengeVO vo = new ChallengeVO();
				vo.setCh_num(Long.parseLong(rs.getString("ch_num")));
				vo.setCh_title(rs.getString("ch_title"));
				vo.setCh_desc(rs.getString("ch_desc"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_img(rs.getString("ch_img"));
				vo.setCh_min(rs.getInt("ch_min"));
				vo.setCh_max(rs.getInt("ch_max"));
				vo.setCh_like(rs.getInt("ch_like"));
				vo.setCh_view(rs.getInt("ch_view"));
				vo.setCh_person(rs.getInt("ch_person"));
				vo.setCh_visi(rs.getInt("ch_visi"));
				vo.setTrans_bal(rs.getInt("trans_bal"));
				vo.setOfficial(rs.getInt("official"));
				vo.setCh_status(rs.getString("ch_status"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCate_num(rs.getInt("cate_num"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCh_authd(rs.getInt("ch_authd"));
				vo.setAh_num(rs.getInt("ah_num"));

				list.add(vo);

			}

		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return list;
	}
	
	
	
	//챌린지 개설
	public void createChallenge(ChallengeVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO chall (ch_num, ch_title, ch_desc, ch_start, ch_end, ch_img, ch_min, ch_person, ch_visi, trans_bal, official, ch_status, us_num, cate_num, ch_max, ch_authd, ah_num, auth_desc, join_code, auth2_start, auth5_game) VALUES (chall_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getCh_title());
			pstmt.setString(2, vo.getCh_desc());
			pstmt.setString(3, vo.getCh_start());
			pstmt.setString(4, vo.getCh_end());
			pstmt.setString(5, vo.getCh_img());
			pstmt.setInt(6, vo.getCh_min());
			pstmt.setInt(7, vo.getCh_person());
			pstmt.setInt(8, vo.getCh_visi());
			pstmt.setInt(9, vo.getTrans_bal());
			pstmt.setInt(10, vo.getOfficial());
			pstmt.setString(11, vo.getCh_status());
			pstmt.setLong(12, vo.getUs_num());
			pstmt.setInt(13, vo.getCate_num());
			pstmt.setInt(14, vo.getCh_max());
			pstmt.setInt(15, vo.getCh_authd());
			pstmt.setInt(16, vo.getAh_num());
			pstmt.setString(17, vo.getAuth_desc());
			pstmt.setString(18, vo.getJoin_code());
			pstmt.setInt(19, vo.getAuth2_start());
			pstmt.setInt(20, vo.getAuth5_game());
			
			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}



	}

	//챌린지 상세
	public ChallengeVO getChallengeDetail(long ch_num)throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ChallengeVO vo = null;


		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM chall JOIN user_detail USING(us_num) JOIN cate ON chall.cate_num = cate.cate_num WHERE chall.ch_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, ch_num);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ChallengeVO();
				vo.setCh_num(ch_num);
				vo.setCh_title(rs.getString("ch_title"));
				vo.setCh_desc(rs.getString("ch_desc"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_img(rs.getString("ch_img"));
				vo.setCh_min(rs.getInt("ch_min"));
				vo.setCh_max(rs.getInt("ch_max"));
				vo.setCh_like(rs.getInt("ch_like"));
				vo.setCh_view(rs.getInt("ch_view"));
				vo.setCh_person(rs.getInt("ch_person"));
				vo.setCh_visi(rs.getInt("ch_visi"));
				vo.setTrans_bal(rs.getInt("trans_bal"));
				vo.setOfficial(rs.getInt("official"));
				vo.setCh_status(rs.getString("ch_status"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCate_num(rs.getInt("cate_num"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCh_authd(rs.getInt("ch_authd"));
				vo.setAh_num(rs.getInt("ah_num"));
				vo.setAuth_desc(rs.getString("auth_desc"));

				vo.setUs_nickname(rs.getString("us_nickname"));
				vo.setUs_img(rs.getString("us_img"));
				
				if(rs.getString("join_code") != null) {
					vo.setJoin_code(rs.getString("join_code"));
				}

				vo.calDate_diff();
			}
		}catch(Exception e) {
			throw new Exception(e);
		}
		finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return vo;
	}

	public void plusView(ChallengeVO vo) throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			int curr_view = vo.getCh_view();
			long ch_num = vo.getCh_num();

			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_view=? WHERE chall.ch_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, curr_view+1);
			pstmt.setLong(2, ch_num);

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}

	}
	public void updateLike(ChallengeVO vo, boolean isPlus) throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			int curr_like = vo.getCh_like();
			long ch_num = vo.getCh_num();

			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_like=? WHERE chall.ch_num=?";
			pstmt = conn.prepareStatement(sql);

			if(isPlus) {
				pstmt.setInt(1, curr_like+1);
			}else {
				if(curr_like == 0) {
					pstmt.setInt(1, 0);
				}else {
					pstmt.setInt(1, curr_like-1);
				}
			}
			pstmt.setLong(2, ch_num);

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}


	}
	
	public void updateChallenge(ChallengeVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_desc=?, auth_desc=?, ch_img=? WHERE ch_num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCh_desc());
			pstmt.setString(2, vo.getAuth_desc());
			pstmt.setString(3, vo.getCh_img());
			pstmt.setLong(4, vo.getCh_num());

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	public List<ChallengeVO> showPopularChallenge(int official) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ChallengeVO> list = null;
		try {
			conn= DBUtil.getConnection();
			sql = "SELECT * FROM (SELECT chall.*, cate.cate_name, rownum AS rnum FROM chall JOIN cate ON chall.cate_num=cate.cate_num WHERE chall.official=? AND chall.ch_status!='finished' ORDER BY ch_view DESC) WHERE rnum >= 1 AND rnum <= 10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, official);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ChallengeVO>();
			
			while(rs.next()) {
				ChallengeVO vo = new ChallengeVO();
				vo.setCh_num(rs.getLong("ch_num"));
				vo.setCh_title(rs.getString("ch_title"));
				vo.setCh_desc(rs.getString("ch_desc"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_img(rs.getString("ch_img"));
				vo.setCh_min(rs.getInt("ch_min"));
				vo.setCh_max(rs.getInt("ch_max"));
				vo.setCh_like(rs.getInt("ch_like"));
				vo.setCh_view(rs.getInt("ch_view"));
				vo.setCh_person(rs.getInt("ch_person"));
				vo.setCh_visi(rs.getInt("ch_visi"));
				vo.setTrans_bal(rs.getInt("trans_bal"));
				vo.setOfficial(rs.getInt("official"));
				vo.setCh_status(rs.getString("ch_status"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCate_num(rs.getInt("cate_num"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCh_authd(rs.getInt("ch_authd"));
				vo.setAh_num(rs.getInt("ah_num"));
				vo.setAuth_desc(rs.getString("auth_desc"));
				
				list.add(vo);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return list;
	}
	
	public String createRandomCode() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		String random_code = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT join_code FROM chall";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				
			boolean isUnique = false;
			
			while (!isUnique) {
			    random_code = generateRandomString(); 
			    rs.beforeFirst(); 
			    isUnique = true; 

			    while (rs.next()) {
			        if (random_code.equals(rs.getString("join_code"))) {
			            isUnique = false; // 중복 발견
			            break;
			        }
			    }
			}
			
		}catch(Exception e) {
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return random_code;
	}
	
	public static String generateRandomString() {
        
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder result = new StringBuilder();

      
        for (int i = 0; i < 7; i++) {
            int index = random.nextInt(characters.length());
            result.append(characters.charAt(index));
        }

        return result.toString();
    }
	
	public ChallengeVO getPrivateChallenge(String join_code)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ChallengeVO vo = null;


		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM chall JOIN user_detail USING(us_num) JOIN cate ON chall.cate_num = cate.cate_num WHERE chall.join_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, join_code);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ChallengeVO();
				vo.setCh_num(rs.getLong("ch_num"));
				vo.setCh_title(rs.getString("ch_title"));
				vo.setCh_desc(rs.getString("ch_desc"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_img(rs.getString("ch_img"));
				vo.setCh_min(rs.getInt("ch_min"));
				vo.setCh_max(rs.getInt("ch_max"));
				vo.setCh_like(rs.getInt("ch_like"));
				vo.setCh_view(rs.getInt("ch_view"));
				vo.setCh_person(rs.getInt("ch_person"));
				vo.setCh_visi(rs.getInt("ch_visi"));
				vo.setTrans_bal(rs.getInt("trans_bal"));
				vo.setOfficial(rs.getInt("official"));
				vo.setCh_status(rs.getString("ch_status"));
				vo.setUs_num(rs.getLong("us_num"));
				vo.setCate_num(rs.getInt("cate_num"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCh_authd(rs.getInt("ch_authd"));
				vo.setAh_num(rs.getInt("ah_num"));
				vo.setAuth_desc(rs.getString("auth_desc"));

				vo.setUs_nickname(rs.getString("us_nickname"));
				vo.setUs_img(rs.getString("us_img"));

				vo.calDate_diff();
			}
		}catch(Exception e) {
			throw new Exception(e);
		}
		finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return vo;
	}
	
	public void updatePeopleNum(ChallengeVO vo, boolean isPlus) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			int curr_person = vo.getCh_person();
			long ch_num = vo.getCh_num();

			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_person=? WHERE chall.ch_num=?";
			pstmt = conn.prepareStatement(sql);

			if(isPlus) {
				pstmt.setInt(1, curr_person+1);
			}else {
				if(curr_person == 0) {
					pstmt.setInt(1, 0);
				}else {
					pstmt.setInt(1, curr_person-1);
				}
			}
			pstmt.setLong(2, ch_num);

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//관리자 정보 가져오는 메서드 구현 되기 전 사용
	public int checkAdmin(long us_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int admin = 0;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT admin FROM xuser WHERE us_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				admin = rs.getInt("admin");
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return admin;
	}
	
	
	public List<ChallengeVO> getAllChallenge()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ChallengeVO> list = null;
		ChallengeVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM chall";
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ChallengeVO>();
			
			while(rs.next()) {
				vo = new ChallengeVO();
				vo.setCh_num(rs.getLong("ch_num"));
				vo.setCh_start(rs.getString("ch_start"));
				vo.setCh_end(rs.getString("ch_end"));
				vo.setCh_status(rs.getString("ch_status"));
				list.add(vo);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public void updateStatus()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		
		try {
			List<ChallengeVO> list = getAllChallenge();
			
			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_status=? WHERE ch_num=?";
			pstmt = conn.prepareStatement(sql);
			
			for(ChallengeVO vo : list) {	
				pstmt.setString(1, vo.getCh_status());
				pstmt.setLong(2, vo.getCh_num());
				pstmt.executeUpdate();
			}
			
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
	}



}