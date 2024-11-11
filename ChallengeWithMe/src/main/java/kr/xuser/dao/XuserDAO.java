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
			sql = "INSERT INTO xuser (us_num, id) "
					+ "VALUES(?, ?)";
			
			ps2 = con.prepareStatement(sql);
			ps2.setLong(1, num);
			ps2.setString(2, xuser.getId());
			ps2.executeUpdate();
			
			// user_detail테이블 회원 개인정보 등록
			sql = "INSERT INTO user_detail (us_num, us_name, us_birth, us_gen, us_tel, us_pw, us_nickname, us_email) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			ps3 = con.prepareStatement(sql);
			ps3.setLong(++i, num);
			ps3.setString(++i, xuser.getName());
			ps3.setString(++i, xuser.getBirth());
			ps3.setInt(++i, xuser.getGen());
			ps3.setString(++i, xuser.getTel());
			ps3.setString(++i, xuser.getPasswd());
			ps3.setString(++i, xuser.getNickname());
			ps3.setString(++i, xuser.getEmail());
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
	
	// ID, 전화번호 중복체크 및 로그인 처리
	public void checkUser(String id, String tel)throws Exception{
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		
		try {
			con = DBUtil.getConnection();
			sql = "SELECT * FROM xuser LEFT OUTER JOIN "
					+ "user_detail USING(user_num) WHERE id=? ";
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, ps, con);
		}
		
	}
	// 비밀번호 변경
	
	// 회원 상세 정보
	
	// 회원 정보 상세
	
	// 회원 정보 수정
	
	// 회원 탈퇴
	
	// 
}
