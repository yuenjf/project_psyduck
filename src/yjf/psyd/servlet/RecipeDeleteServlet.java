package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yjf.psyd.service.RecipeService;
import yjf.psyd.service.impl.RecipeServiceImpl;

@WebServlet("/recipeDelete")
public class RecipeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeDeleteServlet() {
		super();
	}

	// 处理删除菜谱功能
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1、获取请求信息
		String recipeId = req.getParameter("recipeId");
		String userId = req.getParameter("userId");
		// 2、出来请求结果
		RecipeService rs = new RecipeServiceImpl();
		int index = rs.DeleteRecipeService(recipeId);
		// 3、响应请求结果
		if (index > 0) {
			req.getRequestDispatcher("/homePage").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
