package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yjf.psyd.bean.SearchPage;
import yjf.psyd.service.PageService;
import yjf.psyd.service.impl.PageServiceImpl;

/**
 * Servlet implementation class RecipeSearchServlet
 */
@WebServlet("/recipeSearch")
public class RecipeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeSearchServlet() {
		super();
	}
	// 分页显示搜索菜谱功能
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置请求编码格式
		req.setCharacterEncoding("utf-8");
		// 设置响应编码格式
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// 1、获取请求信息
		String searchKeyword = req.getParameter("searchKeyword");
		// 菜谱动态分页请求
		String searchCP = req.getParameter("searchCurrentPage");
		if (searchCP == null) {
			searchCP = "1";
		}
		int searchCp = Integer.parseInt(searchCP);
		// 设置网页大小
		int pageSize = 8;

		// 2、处理请求信息
		PageService pages = new PageServiceImpl();
		SearchPage sp = new SearchPage();
		sp = pages.searchPageService(searchCp, searchKeyword);
		// 加入分页信息
		sp.setSearchKeyword(searchKeyword);
		sp.setPageSize(pageSize);
		sp.setCurrentPage(searchCp);
		
		// 3、响应请求结果
		req.setAttribute("searchp", sp);
		// 转发
		req.getRequestDispatcher("/searchList.jsp").forward(req, resp);
	}

}
