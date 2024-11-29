package kr.trans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.util.DBUtil;

public class TransDAO {
private static TransDAO instance = new TransDAO();
	
	public static TransDAO getInstance() {
		return instance;
	}
	private TransDAO() {};
	
	public void setTransaction(long to_num, long from_num, long ch_num, int bal) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			
			conn = DBUtil.getConnection();
			sql = "INSERT INTO trans(trans_num,trans_date,trans_bal,trans_stat,trans_type,ch_num,to_num,from_num) VALUES(trans_seq.nextval, SYSDATE, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
	}
}
