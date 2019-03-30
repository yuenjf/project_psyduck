package yjf.psyd.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import yjf.psyd.bean.CategoryPage;
import yjf.psyd.bean.CategoryPageDetail;
import yjf.psyd.bean.HomePage;
import yjf.psyd.bean.HomePageDetail;
import yjf.psyd.bean.Page;
import yjf.psyd.bean.PageDetail;
import yjf.psyd.bean.SearchPage;
import yjf.psyd.bean.SearchPageDetail;
import yjf.psyd.bean.User;
import yjf.psyd.dao.PageDao;
import yjf.psyd.util.DbConnection;

public class PageDaoImpl implements PageDao {

	// 请求首页PopRecipe数据
	@Override
	public Page indexPopRecipeDao(int index) {
		// 声明jdbc变量
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明对象、变量
		Page p = new Page();
		int count = -1;
		List<PageDetail> pageDetail = new ArrayList<>();
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "select count(1) from recipe";
			String sql1 = "SELECT * FROM recipe,user_createrecipe  WHERE recipe.id=user_createrecipe.createRecipe ORDER BY recipe.id DESC limit ?,10;";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					p.setTotleCount(rs.getInt(1));
				}
			}
			ps = conn.prepareStatement(sql1);
			// 给占位符赋值
			ps.setInt(1, index);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					PageDetail pd = new PageDetail(rs.getInt("id"), rs.getString("title"), rs.getString("coverPath"),
							rs.getInt("userId"), rs.getString("username"));
					pageDetail.add(pd);
					p.setPageDetail(pageDetail);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
		}
		// 返回结果
		return p;
	}

	// 请求homepage分页数据
	@Override
	public HomePage homePageDao(String userId, int createCp, int collectionCp) {
		// 声明jdbc变量
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明对象、变量
		HomePage hp = new HomePage();
		List<HomePageDetail> createDetail = new ArrayList<>();
		List<HomePageDetail> collectionDetail = new ArrayList<>();
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "SELECT count(1) FROM user,user_createrecipe,recipe where user.id=user_createrecipe.userId and recipe.id = user_createrecipe.createRecipe and user.id = ?;";
			String sql1 = "SELECT * FROM user,user_createrecipe,recipe where user.id=user_createrecipe.userId and recipe.id = user_createrecipe.createRecipe and user.id = ? ORDER BY recipe.id DESC limit ?,6;";
			String sql2 = "SELECT count(1) FROM user,user_collection,recipe where user.id=user_collection.userId and recipe.id = user_collection.collection and user.id = ?;";
			String sql3 = "SELECT * FROM user,user_collection,recipe where user.id=user_collection.userId and recipe.id = user_collection.collection and user.id = ? ORDER BY recipe.id DESC limit ?,6;";
			String sql4 = "SELECT * FROM user WHERE id = ?;";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值
			ps.setString(1, userId);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					hp.setCreateTotleCount(rs.getInt(1));
				}
			}

			ps = conn.prepareStatement(sql1);
			// 给占位符赋值
			ps.setString(1, userId);
			ps.setInt(2, (createCp - 1) * 6);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					HomePageDetail hpd = new HomePageDetail(rs.getInt("recipe.id"), rs.getString("title"),
							rs.getString("coverPath"));
					createDetail.add(hpd);
					hp.setCreateDetail(createDetail);
				}
			}

			ps = conn.prepareStatement(sql2);
			// 给占位符赋值
			ps.setString(1, userId);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					hp.setCollectionTotleCount(rs.getInt(1));
				}
			}

			ps = conn.prepareStatement(sql3);
			// 给占位符赋值
			ps.setString(1, userId);
			ps.setInt(2, (collectionCp - 1) * 6);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					HomePageDetail hpd1 = new HomePageDetail(rs.getInt("recipe.id"), rs.getString("title"),
							rs.getString("coverPath"));
					collectionDetail.add(hpd1);
					hp.setCollectionDetail(collectionDetail);
				}
			}

			ps = conn.prepareStatement(sql4);
			// 给占位符赋值
			ps.setString(1, userId);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {

					hp.setUsername(rs.getString("username"));
					hp.setCreateDate(rs.getString("createDate"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
		}
		// 返回结果
		return hp;
	}

	// 请求category分页数据
	@Override
	public CategoryPage categoryPageDao(String item, int categoryCp) {
		// 声明jdbc变量
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明对象、变量
		CategoryPage cp = new CategoryPage();
		List<CategoryPageDetail> categoryPageDetail = new ArrayList<>();
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "SELECT count(*) FROM recipe,recipe_category,category WHERE recipe.id = recipe_category.recipeId and recipe_category.category = category.id and category.id = ?";
			String sql1 = "SELECT * FROM recipe,user_createrecipe,recipe_category,category WHERE recipe.id = recipe_category.recipeId and recipe_category.category = category.id and recipe.id = user_createrecipe.createRecipe and category.id = ? ORDER BY recipeId DESC LIMIT ?,8";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值
			ps.setString(1, item);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					cp.setTotleCount(rs.getInt(1));
				}
			}
			ps = conn.prepareStatement(sql1);
			// 给占位符赋值
			ps.setString(1, item);
			ps.setInt(2, (categoryCp - 1) * 8);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					CategoryPageDetail cpd = new CategoryPageDetail(rs.getInt("recipeId"), rs.getString("title"),
							rs.getString("coverPath"), rs.getInt("userId"), rs.getString("username"));
					categoryPageDetail.add(cpd);
					cp.setCategoryPageDetail(categoryPageDetail);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
		}
		// 返回结果
		return cp;
	}

	// 请求搜索分页
	@Override
	public SearchPage searchPageDao(int searchCp,String searchKeyword) {
		// 声明jdbc变量
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明对象、变量
		SearchPage sp = new SearchPage();
		List<SearchPageDetail> searchPageDetail = new ArrayList<>();
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "SELECT count(1) FROM recipe,user_createrecipe WHERE title LIKE '%"+searchKeyword+"%' AND recipe.id = user_createrecipe.createRecipe";
			String sql1 = "SELECT * FROM recipe,user_createrecipe WHERE title LIKE '%"+searchKeyword+"%' AND recipe.id = user_createrecipe.createRecipe ORDER BY recipe.id DESC LIMIT ?,8"; 
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					sp.setTotleCount(rs.getInt(1));
				}
			}
			ps = conn.prepareStatement(sql1);
			// 给占位符赋值
			ps.setInt(1, (searchCp - 1) * 8);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					SearchPageDetail spd = new SearchPageDetail(rs.getInt("recipe.id"), rs.getString("title"),
							rs.getString("coverPath"), rs.getInt("userId"), rs.getString("username"));
					searchPageDetail.add(spd);
					sp.setSearchPageDetail(searchPageDetail);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
		}
		// 返回结果
		return sp;
	}
}
