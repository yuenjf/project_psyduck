package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yjf.psyd.bean.CategoryPage;
import yjf.psyd.service.PageService;
import yjf.psyd.service.impl.PageServiceImpl;

@WebServlet("/recipeCategory")
public class RecipeCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecipeCategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1、接收请求信息
		String item = req.getParameter("item");
		String categoryName = req.getParameter("categoryName");
		// 菜谱动态分页请求
		String categoryCP = req.getParameter("categoryCurrentPage");
		if (categoryCP == null) {
			categoryCP = "1";
		}
		int categoryCp = Integer.parseInt(categoryCP);
		// 设置网页大小
		int pageSize = 8;
		
		// 2、处理请求信息
		PageService pages = new PageServiceImpl();
		CategoryPage cp = new CategoryPage();
		cp = pages.categoryPageService(item, categoryCp);
		// 加入分页信息
		cp.setItem(item);
		cp.setCategoryName(categoryName);
		cp.setPageSize(pageSize);
		cp.setCurrentPage(categoryCp);
		
		// 3、请求响应结果
		req.setAttribute("categoryp", cp);
		// 转发
		req.getRequestDispatcher("/categoryList.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
