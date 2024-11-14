package kr.category.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.category.vo.CategoryVO;
import kr.util.DBUtil;

public class CategoryDAO {
	//싱글턴 패턴
	private static CategoryDAO instance = new CategoryDAO();

	public static CategoryDAO getInstance() {
		return instance;
	}
	private CategoryDAO() {}

	//카테고리 목록 확인
	public List<CategoryVO> getList() throws Exception{

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		List<CategoryVO> list = null;

		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM cate";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			list = new ArrayList<CategoryVO>();
			while(rs.next()) {
				CategoryVO vo = new CategoryVO();
				vo.setCate_num(rs.getLong("cate_num"));
				vo.setCate_img(rs.getString("cate_img"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCate_desc(rs.getString("cate_desc"));

				list.add(vo);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return list;
	}
	
	public CategoryVO getDetail(int cat_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		CategoryVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM cate WHERE cate_num=" + cat_num;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			vo = new CategoryVO();
			
			if(rs.next()) {				
				vo.setCate_num(rs.getLong("cate_num"));
				vo.setCate_img(rs.getString("cate_img"));
				vo.setCate_name(rs.getString("cate_name"));
				vo.setCate_desc(rs.getString("cate_desc"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return vo;
	}

}
