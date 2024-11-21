package kr.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.post.vo.PostCommVO;
import kr.post.vo.PostVO;
import kr.util.DBUtil;
import kr.util.StringUtil;

public class PostDAO {
	//싱글턴 패턴
	private static PostDAO instance = new PostDAO();
	
	public static PostDAO getInstance() {
		return instance;
	}
	private PostDAO() {}
 
	//글 등록
	public void insertPost(PostVO post)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO post (post_num, us_nickname, post_img, post_title, post_content, us_num) " +
	                 "SELECT post_seq.nextval, ?, ?, ?, ?, ? FROM user_detail ud WHERE ud.us_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, post.getPost_img());
			pstmt.setString(2, post.getUs_nickname());
			pstmt.setString(3, post.getPost_title());
			pstmt.setString(4, post.getPost_content());
			pstmt.setLong(5, post.getUs_num());
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//전체 글 개수/검색 글 개수
	public int getPostCount(String keyfield,String keyword)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = "";
		int count = 0;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//검색처리
			if(keyword!=null && !"".equals(keyword)) {
				if(keyfield.equals("1")) sub_sql += "WHERE us_nickname LIKE '%' || ? || '%'";
				else if(keyfield.equals("2")) sub_sql += "WHERE post_title LIKE '% || ? || '%'";
				else if(keyfield.equals("3")) sub_sql += "WHERE post_content LIKE '% || ? || '%'";
			}
			//sql문 작성
			sql = "SELECT COUNT(*) FROM post JOIN user_detail USING(us_num)" + sub_sql;
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			if(keyword !=null && !"".equals(keyword)) {
				pstmt.setString(1, keyword);
			}
			//sql문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e){
			throw new Exception(e);
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	
	//전체 글 목록/검색 글 목록
	public List<PostVO> getListPost(int start,int end,String keyfield,String keyword)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PostVO> list = null;
		String sql = null;
		String sql_sub = "";
		int cnt = 0;

		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//sql문 작성
			if(keyword != null && !"".equals(keyword)) {
				//1 : 작성자 닉네임, 2 : 제목, 3 : 내용
				if(keyfield.equals("1")) sql_sub += "WHERE us_nickname LIKE '%' || ? || '%'";
				else if(keyfield.equals("2")) sql_sub += "WHERE post_title LIKE '%' || ? || '%'";
				else if(keyfield.equals("3")) sql_sub += "WHERE post_content LIKE '%' || ? || '%'";
			}
			
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM"
					+ "(SELECT * FROM post JOIN user_detail USING(us_num) " + sql_sub 
					+ " ORDER BY post_num DESC)a) WHERE rnum >= ? AND rnum <= ?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			if(keyword != null && !"".equals(keyword)) {
				pstmt.setString(++cnt, keyword);
			}
			pstmt.setInt(++cnt, start);
			pstmt.setInt(++cnt, end);
			
			//sql문 실행
			rs = pstmt.executeQuery();
			list = new ArrayList<PostVO>();
			while(rs.next()) {
				PostVO post = new PostVO();
				
				post.setPost_num(rs.getLong("post_num"));
				post.setPost_title(rs.getString("post_title"));
				post.setPost_date(rs.getDate("post_date"));
				post.setUs_num(rs.getLong("us_num"));
				post.setUs_nickname(rs.getString("us_nickname"));
				post.setUs_img(rs.getString("us_img"));
				post.setPost_view(rs.getLong("post_view"));
				
				list.add(post);
			}
		}catch (Exception e){
			throw new Exception(e);

		}finally {
			DBUtil.executeClose(null, pstmt, conn);
			
		}
		System.out.println(list);
		
		return list;
	}
	
	
	
	//글 상세->한건의 레코드 불러오기
	public PostVO getpost(long post_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostVO post = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성-> 프로필 사진,닉네임,등록일,조회수,제목,이미지,내용
			sql = "SELECT * FROM post JOIN user_detail USING(us_num) WHERE post_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, post_num);
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				post = new PostVO();
				post.setPost_num(post_num);
				post.setUs_img(rs.getString("us_img"));
				post.setPost_content(rs.getString("post_content"));
				post.setPost_img(rs.getString("post_img"));
				post.setUs_nickname(rs.getString("us_nickname"));
				post.setPost_date(rs.getDate("post_date"));
				post.setUs_num(rs.getLong("us_num"));
				post.setPost_title(rs.getString("post_title"));
				post.setPost_modifydate(rs.getDate("post_modifydate"));
				post.setPost_view(rs.getLong("post_view"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return post;
	}
	
	//조회수 증가
	public void viewcount(long post_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null; 
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "UPDATE post SET post_view = post_view+ 1 WHERE post_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, post_num);
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//파일 삭제
	public void deleteFile(long post_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "UPDATE post SET post_img='' WHERE post_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, post_num);
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//글 수정
	public void modifyPost(PostVO post)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sub_sql = null;
		int cnt = 0;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			if(post.getPost_img()!=null && !"".equals(post.getPost_img())) {
				sub_sql += ",post_img=?";
			}
			//sql문 작성
			sql = "UPDATE post SET title=?,content=?,modifydate=SYSDATE" + sub_sql + "WHERE post_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(++cnt, post.getPost_title());
			pstmt.setString(++cnt, post.getPost_content());
			if(post.getPost_img()!=null && !"".equals(post.getPost_img())) {
				pstmt.setLong(++cnt, post.getPost_num());
			}
			pstmt.setLong(++cnt, post.getPost_num());
			//SQL문 실행
			pstmt.executeUpdate();			
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				DBUtil.executeClose(null, pstmt, conn);
			}
	}
	
	//글 삭제
	public void deletePost(long post_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		String sql = null;
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//오토커밋 해제
			conn.setAutoCommit(false);
			//SQL문 작성
			sql = "DELETE FROM post where post_num=?";
			//?에 데이터 바인딩
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setLong(1, post_num);
			pstmt3.executeUpdate();
			//예외 발생 없이 정상적으로 모든 SQL문이 실행
			conn.commit();
		}catch(Exception e) {
			//SQL문이 하나라도 예외가 발생하면 롤백 처리
			conn.rollback();
			throw new Exception (e);
		}finally {
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt, null);
		}
	}
	

	//좋아요 개수
	//회원번호와 게시물 번호를 이용한 좋아요 정보
	//좋아요 등록
	//좋아요 삭제
	//좋아요 목록(=찜 목록)
	//내가 선택한 좋아요 목록 -> 게시판 목록의 정보 보여져야함 List<PostVO>
	//댓글 등록
	public void insertPostReply(PostCommVO postReply) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO comm(com_rownum,com_num,post_num,us_num,com_content,date)"
					+ "VALUES (com_seq.nextval,?,?,?,?,?)";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(1, postReply.getCom_num());
			pstmt.setLong(2, postReply.getPost_num());
			pstmt.setLong(3, postReply.getUs_num());
			pstmt.setString(4, postReply.getCom_content());
			pstmt.setDate(5, postReply.getDate());
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.getConnection();
		}
	}
	//댓글 개수
	public int getPostReplyCount(long post_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT COUNT(*) FROM comm WHERE post_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setLong(0, post_num);		
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.getConnection();
		}
		return count;
	}
	
	//댓글 목록
	//댓글 상세
	//댓글 수정
	//댓글 삭제
	
}
