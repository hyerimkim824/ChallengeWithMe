package kr.charge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.charge.vo.ChargeVO;
import kr.util.DBUtil;

public class ChargeDAO {
	
	private static ChargeDAO instance = new ChargeDAO();
	public static ChargeDAO getInstance() {
		return instance;
	}
	private ChargeDAO() {};
	
	public void createChargeRecord(long us_num, int money) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO charge(charge_num, us_num, charge_bal) VALUES(charge_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			pstmt.setInt(2, money);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	public List<ChargeVO> getChargeRecordByUser(long us_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ChargeVO vo = null;
		List<ChargeVO> list = null;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM charge WHERE us_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, us_num);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ChargeVO>();
			while(rs.next()) {
				vo = new ChargeVO();
				vo.setUs_num(us_num);
				vo.setCharge_bal(rs.getInt("charge_bal"));
				vo.setCharge_date(rs.getString("charge_date"));
				
				list.add(vo);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return list;
	}
}
