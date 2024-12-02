package kr.charge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
