package yjf.psyd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yjf.psyd.bean.HomePage;
import yjf.psyd.bean.Page;
import yjf.psyd.service.PageService;
import yjf.psyd.service.impl.PageServiceImpl;

@WebServlet("/homePage")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePageServlet() {
        super();
    }

    // 处理个人中心信息的请求功能
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1、获取请求信息
		String userId = req.getParameter("userId");
		// li为个人中心首页标签页索引
		String li = req.getParameter("li");
		if(li==null) {
			li = "1";
		}
		int Li = Integer.parseInt(li);
		
		// 菜谱动态分页请求
		String createCP = req.getParameter("createCurrentPage");
		if(createCP==null) {
			createCP = "1";
		}
		int createCp = Integer.parseInt(createCP);
		int createPageSize = 6;
		
		// 菜谱收藏分页请求
		String collectionCP = req.getParameter("collectionCurrentPage");
		if(collectionCP==null) {
			collectionCP = "1";
		}
		int collectionCp = Integer.parseInt(collectionCP);
		int collectionPageSize = 6;

		// 2、处理请求信息
		PageService pages = new PageServiceImpl();
		HomePage hp = new HomePage();
		hp = pages.homePageService(userId,createCp,collectionCp);
		// 把String类型userId转换为int类型
		int userID = Integer.parseInt(userId);
		hp.setUserId(userID);
		hp.setLi(Li);
		
		hp.setCreateCurrentPage(createCp);
		hp.setCreatePageSize(createPageSize);
		hp.setCollectionCurrentPage(collectionCp);
		hp.setCollectionPageSize(collectionPageSize);
		// 3、请求响应结果
		req.setAttribute("homep", hp);
		// 转发
		req.getRequestDispatcher("/homepage.jsp").forward(req, resp);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
