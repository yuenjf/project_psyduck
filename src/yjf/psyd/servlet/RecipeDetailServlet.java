package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import yjf.psyd.bean.Recipe;
import yjf.psyd.bean.User;
import yjf.psyd.service.RecipeService;
import yjf.psyd.service.UserService;
import yjf.psyd.service.impl.RecipeServiceImpl;
import yjf.psyd.service.impl.UserServiceImpl;

@WebServlet("/recipeDetail")
public class RecipeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1、获取请求信息
		String recipeId = req.getParameter("recipeId");
		// 获取session对象，用session判断是否收藏
		HttpSession hs = req.getSession();
		// 把session中的值传到user对象中
		User user = (User) hs.getAttribute("user");

		// 2、处理请求信息
		RecipeService rs = new RecipeServiceImpl();
		Recipe r = rs.recipeDetailService(recipeId, user);
		// 3、响应请求结果
		req.setAttribute("recipe", r);
		// 输出r
//			System.out.println(r);
		// 请求转发
		req.getRequestDispatcher("/recipeStepRetail").forward(req, resp);
		return;

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
