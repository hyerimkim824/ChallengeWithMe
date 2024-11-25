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

	//챌린지 목록
	public List<ChallengeVO> getList() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		ResultSet rs = null;
		List<ChallengeVO> list = null;

		try {
			conn = DBUtil.getConnection();
			sql = "SELECT chall.*, cate.cate_name FROM chall JOIN cate ON chall.cate_num = cate.cate_num";
			pstmt = conn.prepareStatement(sql);

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
	public List<ChallengeVO> getList(int cat_num) throws Exception{
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
			sql = "INSERT INTO chall (ch_num, ch_title, ch_desc, ch_start, ch_end, ch_img, ch_min, ch_person, trans_bal, official, ch_status, us_num, cate_num, ch_max, ch_authd, ah_num, auth_desc) VALUES (chall_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getCh_title());
			pstmt.setString(2, vo.getCh_desc());
			pstmt.setString(3, vo.getCh_start());
			pstmt.setString(4, vo.getCh_end());
			pstmt.setString(5, vo.getCh_img());
			pstmt.setInt(6, vo.getCh_min());
			pstmt.setInt(7, vo.getCh_person());
			pstmt.setInt(8, vo.getTrans_bal());
			pstmt.setInt(9, vo.getOfficial());
			pstmt.setString(10, vo.getCh_status());
			pstmt.setLong(11, vo.getUs_num());
			pstmt.setInt(12, vo.getCate_num());
			pstmt.setInt(13, vo.getCh_max());
			pstmt.setInt(14, vo.getCh_authd());
			pstmt.setInt(15, vo.getAh_num());
			pstmt.setString(16, vo.getAuth_desc());

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
	public void plusLike(ChallengeVO vo) throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			int curr_like = vo.getCh_like();
			long ch_num = vo.getCh_num();

			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_like=? WHERE chall.ch_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, curr_like+1);
			pstmt.setLong(2, ch_num);

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}


	}
	
	public void minusLike(ChallengeVO vo) throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {

			int curr_like = vo.getCh_like();
			long ch_num = vo.getCh_num();

			conn = DBUtil.getConnection();
			sql = "UPDATE chall SET ch_like=? WHERE chall.ch_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, curr_like-1);
			pstmt.setLong(2, ch_num);

			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}


	}

}
