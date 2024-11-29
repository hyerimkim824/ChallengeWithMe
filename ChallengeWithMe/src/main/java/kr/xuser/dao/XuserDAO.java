package kr.xuser.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;
import kr.xuser.vo.XuserVO;

public class XuserDAO {
	// 싱글턴 패턴
	private static XuserDAO instance = new XuserDAO();
	
	public static XuserDAO getInstance() {
		return instance;
	}
	private XuserDAO() {};
	
	// 회원가입
	public void insertUser(XuserVO xuser)throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		ResultSet rs = null;
		String sql = null;
		long num = 0;
		int i = 0;
		
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			
			// Xuser테이블 회원 번호 생성
			sql = "SELECT xuser_seq.nextval FROM dual";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getLong(1);
			}
			// Xuser테이블 회원 번호 아이디 등록
			sql = "INSERT INTO xuser (us_num, us_id) "
					+ "VALUES(?, ?)";
			
			ps2 = con.prepareStatement(sql);
			ps2.setLong(1, num);
			ps2.setString(2, xuser.getId());
			ps2.executeUpdate();
			
			// user_detail테이블 회원 개인정보 등록
			sql = "INSERT INTO user_detail (us_num, us_name, us_birth, us_gen, us_tel, us_pw, us_nickname, us_email, us_zipcode, us_address1, us_address2) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps3 = con.prepareStatement(sql);
			ps3.setLong(++i, num);
			ps3.setString(++i, xuser.getName());
			ps3.setString(++i, xuser.getBirth());
			ps3.setInt(++i, xuser.getGen());
			ps3.setString(++i, xuser.getTel());
			ps3.setString(++i, xuser.getPasswd());
			ps3.setString(++i, xuser.getNickname());
			ps3.setString(++i, xuser.getEmail());
			ps3.setString(++i, xuser.getZipcode());
			ps3.setString(++i, xuser.getAddress1());
			ps3.setString(++i, xuser.getAddress2());
			ps3.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			con.rollback();
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, ps3, null);
			DBUtil.executeClose(null, ps2, null);
			DBUtil.executeClose(rs, ps, con);
		}
	}
	
	// ID 중복체크 및 로그인 처리
	public XuserVO checkUser(String id)throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		XuserVO xuser = null;
		String sql = null;
		
		try {
			con = DBUtil.getConnection();
			sql = "SELECT * FROM xuser LEFT OUTER JOIN "
					+ "user_detail USING(us_num) WHERE us_id=? ";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				xuser = new XuserVO();
				xuser.setUs_num(rs.getLong("us_num"));
				xuser.setId(rs.getString("us_id"));
				xuser.setBan(rs.getInt("us_ban"));
				xuser.setPasswd(rs.getString("us_pw"));
				xuser.setImg(rs.getString("us_img"));
				xuser.setEmail(rs.getString("us_email"));
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, ps, con);
		}
		return xuser;
	}
	
	// 이메일 가입 체크
	public boolean checkEmail(String email)throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		
		
		try {
			con = DBUtil.getConnection();
			sql = "SELECT * FROM user_detail WHERE us_email=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				// 이메일이 이미 존재하면 true 반환
				return true;
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, ps, con);
		}
		return false;
	}
	
	// 잔고 업데이트
	public boolean updateWallet(long us_num, String us_wallet) throws Exception {
	    Connection con = null;
	    PreparedStatement ps = null;
	    String sql = null;

	    try {
	        con = DBUtil.getConnection();
	        sql = "UPDATE xuser SET us_wallet=? WHERE us_num=?";
	        
	        ps = con.prepareStatement(sql);
	        ps.setString(1, us_wallet);
	        ps.setLong(2, us_num);
	        
	        ps.executeUpdate();
	        
	    } catch (Exception e) {
	        throw new Exception(e);
	    } finally {
	        DBUtil.executeClose(null, ps, con);
	    }
	    return false;
	}
	
	// 닉네임 중복 체크
		public boolean checkNick(String nick) throws Exception {
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    String sql = null;

		    try {
		        con = DBUtil.getConnection();
		        sql = "SELECT * FROM user_detail WHERE us_nickname=?";
		        
		        ps = con.prepareStatement(sql);
		        ps.setString(1, nick);
		        
		        rs = ps.executeQuery();
		        if (rs.next()) {
		            // 닉네임이 이미 존재하면 true 반환
		            return true;
		        }
		    } catch (Exception e) {
		        throw new Exception(e);
		    } finally {
		        DBUtil.executeClose(rs, ps, con);
		    }
		    return false;
		}
	
	
	
}
