package kr.adminWalletDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.adminWallet.vo.AdminWalletVO;
import kr.util.DBUtil;

public class AdminWalletDAO {
	private static AdminWalletDAO instance = new AdminWalletDAO();

	public static AdminWalletDAO getInstance() {
		return instance;
	}
	
	public AdminWalletVO getAdminWallet() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		AdminWalletVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM admin_wallet WHERE adw_num=99";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new AdminWalletVO();
				vo.setAdw_num(rs.getLong("adw_num"));
				vo.setAdw_bal(rs.getInt("adw_bal"));
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return vo;
	}
	
	
	public boolean updateBalance(AdminWalletVO vo, boolean isDeposit, int price) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE admin_wallet SET adw_bal=? WHERE adw_num=99";
			pstmt = conn.prepareStatement(sql);
			if(isDeposit) {
				pstmt.setInt(1, vo.getAdw_bal() + price);
			}else {
				if(vo.getAdw_bal() < price) {
					return false;
				}else {
					pstmt.setInt(1, vo.getAdw_bal() - price);
				}
			}
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return true;
	}
	
	
	private AdminWalletDAO() {}
}
