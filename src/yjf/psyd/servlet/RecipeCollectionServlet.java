package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import yjf.psyd.bean.User;
import yjf.psyd.service.RecipeService;
import yjf.psyd.service.impl.RecipeServiceImpl;

@WebServlet("/recipeCollection")
public class RecipeCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeCollectionServlet() {
		super();
	}
	
	// 处理菜谱收藏功能
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 1、获取请求信息
		String status = req.getParameter("status");
		String RecipeId = req.getParameter("RecipeId");

		// 获取session对象
		HttpSession hs = req.getSession();
		// 把session中的值传到user对象中
		User user = (User) hs.getAttribute("user");

		RecipeService rs = new RecipeServiceImpl();
		// 2、判断status状态
		if (status.equals("false")) {
			// 3、处理请求结果；插入收藏菜谱
			int index = rs.insertCollectionRecipe(RecipeId, user);
			if(index>0) {
				resp.getWriter().write("{\"index\":" + index + "}");
			}
		} else {
			// 3、处理请求结果：删除收藏菜谱
			int index = rs.deleteCollectionRecipe(RecipeId, user);
			if(index>0) {
				resp.getWriter().write("{\"index\":" + index + "}");
			}
		}
	}

}
