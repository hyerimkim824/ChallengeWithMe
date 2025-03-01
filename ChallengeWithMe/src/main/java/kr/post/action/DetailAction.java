package kr.post.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mypage.dao.MyPageDAO;
import kr.post.dao.PostDAO;
import kr.post.vo.PostVO;
import kr.util.StringUtil;
import kr.xuser.vo.XuserVO;

public class DetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {//로그인이 되지 않은 경우
			return "redirect:/xuser/registerXuserForm.do";
		}
		
        long post_num = Long.parseLong(request.getParameter("post_num"));
       
        PostDAO dao = PostDAO.getInstance();
		//조회수 증가
		dao.viewcount(post_num);
		 
		PostVO post = dao.getpost(post_num);
		
		MyPageDAO Dao = MyPageDAO.getInstance();
		XuserVO user = Dao.getMyInfo(us_num);
		
		String us_nickname = user.getNickname();
		
		//detail.jsp에서 받는 comm_count, like_count 갯수
		int comm_count = dao.getPostReplyCount(post_num);
		int like_count = dao.getLikeCount(post_num);
		
		
		//HTML 태그를 허용하지 않음
		post.setPost_title(StringUtil.useNoHtml(post.getPost_title()));
		//HTML 태그를 허용하지 않으면서 줄바꿈 처리
		post.setPost_content(StringUtil.useBrNoHtml(post.getPost_content()));

		request.setAttribute("us_nickname", us_nickname);
		request.setAttribute("post", post);
		request.setAttribute("comm_count", comm_count);
		request.setAttribute("like_count", like_count);
		
		
		//이미지는 받아와지는데 upload폴더에 사진이 없어서 안나온다고 함
		System.out.println("PostVO us_img: " + post.getUs_img());
		//수정일 체크
		System.out.println("Post Modify Date: " + post.getPost_modifydate());
		//조회수 체크
		System.out.println("Post View Count: " + post.getPost_view());
		//post_num 체크
		System.out.println("post_num: " + post_num);
		
		return "post/detail.jsp";
	}

}