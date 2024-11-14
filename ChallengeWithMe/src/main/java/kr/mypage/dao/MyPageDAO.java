package kr.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;
import kr.xuser.vo.XuserVO;

public class MyPageDAO {
	// 싱글턴 패턴
		private static MyPageDAO instance = new MyPageDAO();
		
		public static MyPageDAO getInstance() {
			return instance;
		}
		private MyPageDAO() {};
		
	// 마이페이지 상세정보
	public XuserVO getMyInfo(long us_num)throws Exception{
		Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    XuserVO xuser = null;
	    String sql = null;
	    
	    try {
	        con = DBUtil.getConnection();
	        sql = "SELECT * FROM xuser JOIN user_detail USING(us_num) WHERE us_num=?";
	        
	        ps = con.prepareStatement(sql);
	        ps.setLong(1, us_num);
	        
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            xuser = new XuserVO();
	            xuser.setUs_num(rs.getLong("us_num"));
	            xuser.setId(rs.getString("us_id"));
	            xuser.setRank(rs.getInt("us_rank"));
	            xuser.setBan(rs.getInt("us_ban"));
	            xuser.setWallet(rs.getString("us_wallet"));
	            xuser.setBirth(rs.getString("us_birth"));
	            xuser.setGen(rs.getInt("us_gen"));
	            xuser.setTel(rs.getString("us_tel"));
	            xuser.setPasswd(rs.getString("us_pw"));
	            xuser.setNickname(rs.getString("us_nickname"));
	            xuser.setDate(rs.getString("us_date"));
	            xuser.setRdate(rs.getString("us_rdate"));
	            xuser.setImg(rs.getString("us_img"));
	            xuser.setEmail(rs.getString("us_email"));
	            xuser.setName(rs.getString("us_name"));
	            xuser.setAddress1(rs.getString("us_address1"));
	            xuser.setAddress2(rs.getString("us_address2"));
	        }
	    } catch (Exception e) {
	        throw new Exception(e);
	    } finally {
	        DBUtil.executeClose(rs, ps, con);
	    }
	    return xuser;
	}
	
	// 프로필 사진 수정
	public void updateImg(String img, long us_num)throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		
		try {
			con = DBUtil.getConnection();
			sql = "UPDATE user_detail SET photo=? WHERE us_num=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, sql);
			ps.setLong(2, us_num);
			
			ps.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, ps, con);
		}
	}
	
}
