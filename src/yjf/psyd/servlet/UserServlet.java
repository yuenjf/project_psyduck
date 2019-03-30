package yjf.psyd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import yjf.psyd.bean.User;
import yjf.psyd.service.UserService;
import yjf.psyd.service.impl.UserServiceImpl;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置请求编码格式
		req.setCharacterEncoding("utf-8");
		// 设置响应编码格式
		resp.setContentType("text/html;charset=utf-8");
		// 获取操作符
		String oper = req.getParameter("oper");
		if ("register".equals(oper)) {
			// 调用注册方法
			userRegister(req, resp);
		} else if ("login".equals(oper)) {
			// 调用登录方法
			checkUserLogin(req, resp);
		} else if ("out".equals(oper)) {
			// 调用退出方法
			userOut(req, resp);
		} else if ("checkUserName".equals(oper)) {
			// 调用验证用用户名是否存在方法
			checkUserName(req, resp);
		} else {
			System.out.println("没有找到对应的操作符：" + oper);
		}
	}

	// 利用ajax请求验证用户名是否存在
	private void checkUserName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取请求信息
		String username = req.getParameter("username");
		// 处理请求信息
		UserService us = new UserServiceImpl();
		boolean isExist = us.checkUserNameService(username);
		// 响应请求结果
		if (isExist) {
			resp.getWriter().write("{\"valid\":false}");
		} else {
			resp.getWriter().write("{\"valid\":true}");
		}
	}

	// 处理用户注册
	private void userRegister(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取请求信息
		String createDate = null;
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// 获取系统当前日期
		Date dateNow = new Date(System.currentTimeMillis());
		createDate = dateNow.toString();
		// 处理请求信息
		// 获取service层对象
		UserService us = new UserServiceImpl();
		int index = us.userRegisterService(createDate, username, password);
//		System.out.println(index);
		// 响应处理结果
		if (index > 0) {
			// 弹窗提示，点击后转跳
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('注册成功，请登录！');window.location.href='/psyduck/index'</script>");
			// 重定向
//			resp.sendRedirect("/psyduck/login.jsp");
		}
	}

	// 处理用户登录
	private void checkUserLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 1、获取请求信息
		String username = req.getParameter("username");
		String password = req.getParameter("password");
//		System.out.println(username + ":" + password);
		// 2、处理请求信息
		// 获取service层对象
		UserService us = new UserServiceImpl();
		// 校验
		User u = us.checkUserLoginService(username, password);
//		System.out.println(u);
		// 3、响应处理结果
		if (u != null) {
			// 获取session对象
//			System.out.println(u);
			HttpSession hs = req.getSession();
			// 将用户信息存储到session中
			hs.setAttribute("user", u);
			// 重定向，/表示服务器根目录,写绝对路径。相对路径的话servlet的别名中包含别目录，会造成重定向资源失败
			resp.sendRedirect("/psyduck/index");
			return;
		} else {
			// 失败
			// 请求转发，/表示项目根目录。
			// 弹窗提示，点击后转跳
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('登录失败，请重试！');window.location.href='/psyduck/index'</script>");
			// 请求转发
//			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			return;
		}
	}

	// 处理用户退出
	private void userOut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取session对象
		HttpSession hs = req.getSession();
		// 强制销毁session
		hs.invalidate();
		// 重定向要主页面
		resp.sendRedirect("/psyduck/index");
	}
}
