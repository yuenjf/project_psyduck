package yjf.psyd.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import java.util.function.Function;

import javax.print.StreamPrintService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.istack.internal.Nullable;

import yjf.psyd.bean.User;
import yjf.psyd.service.RecipeService;
import yjf.psyd.service.UserService;
import yjf.psyd.service.impl.RecipeServiceImpl;
import yjf.psyd.service.impl.UserServiceImpl;
import yjf.psyd.util.UploadTools;

@WebServlet("/createRecipe")
public class CreateRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateRecipeServlet() {
		super();
	}

	// 处理创建菜谱
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置请求编码格式
		req.setCharacterEncoding("utf-8");
		// 设置响应编码格式
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// 1、获取请求信息
		String createDate = null;
		String title = null;
		String info = null;
		String material = null;
		List<String> stepInfos = new LinkedList<>();
		List<String> categorys = new LinkedList<>();
		String coverFilePath = null;
		List<File> stepFiles = new LinkedList<>();
		List<String> stepFilesPath = new LinkedList<>();
		User user = null;

		// 获取系统当前日期
		Date dateNow = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		createDate = dateFormat.format(dateNow);
//		System.out.println(createDate);

		// 检查前台表单form是否有multipart
		if (ServletFileUpload.isMultipartContent(req)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 通过parseRequest解析form中的所有请求字段，并保存到items集合中
			List<FileItem> items = null;
			try {
				items = upload.parseRequest(req);
			} catch (FileUploadException e1) {
				e1.printStackTrace();
			}
			// 遍历List中的数据
//			Iterator<FileItem> iter = items.iterator();
//			while (iter.hasNext()) {
//				FileItem item = iter.next();
			for (FileItem item : items) {
				String itemName = item.getFieldName();
				// 判断前台字段是普通form表单字段，还是文件字段
				if (item.isFormField()) {
					// 普通上传
					if (itemName.equals("recTitle")) {
						title = item.getString("utf-8");
					} else if (itemName.equals("recInfo")) {
						info = item.getString("utf-8");
					} else if (itemName.equals("recMaterial")) {
						material = item.getString("utf-8");
					} else if (itemName.equals("recCategory")) {
						categorys.add(item.getString("utf-8"));
					} else {
						if (!"".equals(item.getString("utf-8"))) {
							stepInfos.add(item.getString("utf-8"));
						} else {
							stepInfos.add("");
						}

					}
				} else {
					// 文件上传
					String fileName = item.getName();
					// 判断文件名是否为不为空
					if (fileName != null && !"".equals(fileName)) {
						if (itemName.equals("recCover")) {
							// 获取文件内容 并上传
							String path = "D:\\Code\\Eclipse\\psyduck\\WebContent\\upload\\cover";
							// 使用uuid生成随机数，调用工具类
							String uuidFileName = UploadTools.getUUIDFileName(fileName);
							File coverFile = new File(path, uuidFileName);
							// 判断文件夹是否存在，如不存在则创建文件夹
							if (!coverFile.exists()) {
								// 先得到文件的上级目录，并创建上级目录，在创建文件
								coverFile.getParentFile().mkdir();
								try {
									// 创建文件
									coverFile.createNewFile();
								} catch (IOException e) {
									e.printStackTrace();
								}
								try {
									item.write(coverFile);
								} catch (Exception e) {
									e.printStackTrace();
								}
								coverFilePath = "/upload/cover/" + uuidFileName;
//								System.out.println("封面上传成功！路径：" + coverFilePath);
							}
						} else if (itemName.equals("stepFile")) {
							String path = "D:\\Code\\Eclipse\\psyduck\\WebContent\\upload\\stepFile";
							// 使用uuid生成随机数，调用工具类
							String uuidFileName = UploadTools.getUUIDFileName(fileName);
							File stepFile = new File(path, uuidFileName);
							stepFiles.add((File) stepFile);
							stepFilesPath.add("/upload/stepFile/" + uuidFileName);
							if (!stepFile.exists()) {
								// 先得到文件的上级目录，并创建上级目录，在创建文件
								stepFile.getParentFile().mkdir();
								try {
									// 创建文件
									stepFile.createNewFile();
								} catch (IOException e) {
									e.printStackTrace();
								}
								try {
									item.write(stepFile);
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						}
					}
				}
			}
		}
		// 获取session对象
		HttpSession hs = req.getSession();
		// 把session中的值传到user对象中
		user = (User) hs.getAttribute("user");
//		System.out.println(user);
//		if (hs.getAttribute("user") != null) {
//			System.out.println("session不为空");
//		} else {
//			System.out.println("session为空");
//		}
//		System.out.println(title);
//		System.out.println("封面上传成功！路径：" + coverFilePath);
//		for(File stepFilePath : stepFiles) {
//			System.out.println("步骤上传成功！路径：" + stepFilePath);
//		}
//		for (String stepInfo : stepInfos) {
//			System.out.println(stepInfo);
//		}
//		for (String category : categorys) {
//			System.out.println(category);
//		}
		RecipeService us = new RecipeServiceImpl();
		int index = us.createRecipeService(createDate, title, info, material, stepInfos, categorys, coverFilePath,
				stepFilesPath, user);
		// 响应处理结果
		if (index > 0) {
			// 弹窗提示，点击后转跳
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('创建成功！');window.location.href='/psyduck/index'</script>");
		} else {
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('创建失败！请重试！');window.location.href='/psyduck/createRecipe.jsp'</script>");
		}
	}
}
