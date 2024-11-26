package kr.post.action;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.post.dao.PostDAO;
import kr.post.vo.PostCommVO;
import kr.util.PagingUtil;
import kr.util.StringUtil;

public class ListReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		String rowCount = request.getParameter("rowCount");
		if(rowCount==null) rowCount = "5";
		
		long post_num = Long.parseLong(
				         request.getParameter("post_num"));
		
		PostDAO dao = PostDAO.getInstance();
		//전체개수
		int count = dao.getPostReplyCount(post_num);
		
		
		/*
		 * 페이징 처리
		 * 필요한 변수
		 * 1. 화면에 보여질 페이지 그룹   : Math.ceil(현재 페이지/5(한 화면에 나타낼 데이터 수))
		 * 2. 화면에 보여질 첫번째 페이지 : 1*5(rowCount)    = 1
		 * 3. 화면에 보여질 마지막 페이지 : 5(rowCount)-(5-1)= 1
		 * 4. 총 페이지 수            : Math.ceil(count(전체개수)/10(한 페이지에 나타낼 페이지 수))
		 * 
		 */
		
		
		
		
		//currentPage,count,rowCount
		PagingUtil page = 
				new PagingUtil(Integer.parseInt(pageNum),count,Integer.parseInt(rowCount));
		List<PostCommVO> list = null;
		if(count > 0) {
			list = dao.getListPostReply(page.getStartRow(),page.getEndRow(), post_num);
		}else {
			list = Collections.emptyList();
		}
		
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		Map<String,Object> mapAjax = 
				               new HashMap<String,Object>();
		mapAjax.put("count", count);
		mapAjax.put("list", list);
		//로그인한 사람이 작성자인지 체크하기 위해서 로그인한 회원번호 전송
		mapAjax.put("us_num", us_num);
		
		//JSON 데이터로 변환
		return StringUtil.parseJSON(request, mapAjax);

	}

}
