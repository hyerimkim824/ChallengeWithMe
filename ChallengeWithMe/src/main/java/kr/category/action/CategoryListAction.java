package kr.category.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.category.dao.CategoryDAO;
import kr.category.vo.CategoryVO;
import kr.controller.Action;
import kr.util.StringUtil;

public class CategoryListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int category = Integer.parseInt(request.getParameter("category"));
		
		CategoryDAO dao = CategoryDAO.getInstance();
		List<CategoryVO> list = dao.getList();
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		
		mapAjax.put("cat_list", list);
		
		return StringUtil.parseJSON(request, mapAjax);
	}

}
