package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yjf.psyd.bean.Page;
import yjf.psyd.bean.PageDetail;
import yjf.psyd.service.PageService;
import yjf.psyd.service.impl.PageServiceImpl;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
		super();
	}

	// 进入首页先初始化请求Pop Recipe数据
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1、获取请求信息
		int index = 0;
		// 2、处理请求信息
		PageService pages = new PageServiceImpl();
		Page p = new Page();
		// 数据库返回p
		p = pages.indexPopRecipeService(index);
		// 3、响应请求结果
		req.setAttribute("page", p);
		// 转发
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
