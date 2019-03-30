package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yjf.psyd.bean.Recipe;
import yjf.psyd.bean.RecipeStep;
import yjf.psyd.service.RecipeService;
import yjf.psyd.service.impl.RecipeServiceImpl;

@WebServlet("/recipeStepRetail")
public class RecipeStepDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeStepDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1、获取请求信息
		String recipeId = req.getParameter("recipeId");
		// 2、处理请求信息
		RecipeService rs = new RecipeServiceImpl();
		RecipeStep recs = rs.recipeStepDetailService(recipeId);
		// 3、响应请求结果
		req.setAttribute("recipeStep", recs);
		// 输入recs
//		System.out.println(recs);
		
//		recs.getInfo().size();
		// 转发
		req.getRequestDispatcher("/recipe.jsp").forward(req, resp);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
