package yjf.psyd.dao.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import yjf.psyd.bean.Recipe;
import yjf.psyd.bean.RecipeStep;
import yjf.psyd.bean.User;
import yjf.psyd.dao.RecipeDao;
import yjf.psyd.util.DbConnection;

public class RecipeDaoImpl implements RecipeDao {

	// 创建菜谱
	@Override
	public int createRecipeDao(String createDate, String title, String info, String material, List<String> stepInfos,
			List<String> categorys, String coverFilePath, List<String> stepFilesPath, User user) {
		// 声明jdbc变量
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明变量
		int index = -1;
		int currentId = -1;
		int stepSize = -1;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "insert into recipe values(default,?,?,?,?,?)";
			String sql1 = "insert into user_createRecipe values(default,?,?,?)";
			String sql2 = "insert into recipe_category values(default,?,?)";
			String sql3 = "insert into recipe_step values(default,?,?,?)";

			// 创建sql命令对象
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			// 给占位符赋值
			ps.setString(1, createDate);
			ps.setString(2, title);
			ps.setString(3, coverFilePath);
			ps.setString(4, info);
			ps.setString(5, material);
			index = ps.executeUpdate();
			// 利用JDBC的getGeneratedKeys获得INSERT插入后生成的主键ID
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				currentId = rs.getInt(1);
			}

			// sql1
			if (index == 1) {
				ps = conn.prepareStatement(sql1);
				ps.setInt(1, user.getUserId());
				ps.setInt(2, currentId);
				ps.setString(3, user.getUsername());
				index = ps.executeUpdate();
			} else {
				index = -1;
			}

			// sql2
			if (index == 1) {
				ps = conn.prepareStatement(sql2);
				for (String category : categorys) {
					ps.setInt(1, currentId);
					ps.setString(2, category);
					index = ps.executeUpdate();
				}
			} else {
				index = -1;
			}

			// sql3
			if (index == 1) {
				ps = conn.prepareStatement(sql3);
				List<String> fileList = new LinkedList<>();
				int insert_index = 0;
				for (String stepFilePath : stepFilesPath) {
					fileList.add(stepFilePath.toString());
				}
				for (String stepInfo : stepInfos) {
					ps.setInt(1, currentId);
					ps.setString(2, stepInfo);
					if (insert_index >= fileList.size()) {
						ps.setString(3, "");
					} else {
						ps.setString(3, fileList.get(insert_index));
					}
					insert_index++;
					index = ps.executeUpdate();
				}
			} else {
				index = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnection.closeDB(conn, ps, rs);
		}
		return index;
	}

	// 菜谱详情
	@Override
	public Recipe recipeDetailDao(String recipeId,User user) {
		// 声明jdbc对象
		Connection conn = null;
		PreparedStatement ps = null, ps1 = null;
		ResultSet rs = null, rs1 = null;
		// 声明对象
		int index = -1;
		Recipe r = new Recipe();
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "select * from recipe where id=?";
			String sql1 = "select * from user,user_createrecipe where user.id=user_createrecipe.userId and createRecipe=?";
			String sql2 = "select * from user_collection where userId=? and collection = ?;";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值
			ps.setString(1, recipeId);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					// 给变量赋值
					r.setRecipeId(rs.getInt("id"));
					r.setCreateDate(rs.getString("createDate"));
					r.setTitle(rs.getString("title"));
					r.setCoverPath(rs.getString("coverPath"));
					r.setInfo(rs.getString("info"));
					r.setMaterial(rs.getString("material"));
				}
			}
			
			// 当登录用户点进菜谱，如果收藏过菜谱，收藏按钮显示已收藏
			ps = conn.prepareStatement(sql2);
			// 判断，如果没登录，user为空，不需要返回isExistCollection
			if(user!=null) {
				// 给占位符赋值
				ps.setInt(1, user.getUserId());
				ps.setString(2, recipeId);
				// 执行sql语句
				rs = ps.executeQuery();
				if (rs != null) {
					while (rs.next()) {
						// 给变量赋值
						r.setIsExistCollection(rs.getInt("id"));
					}
				}
			}

			ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, recipeId);
			rs1 = ps1.executeQuery();
			if (rs1 != null) {
				while (rs1.next()) {
					r.setUserId(rs1.getInt("userId"));
					r.setUsername(rs1.getString("username"));
				}
			}
			// 输出r
//			System.out.println(r);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
			DbConnection.closeDB(null, ps1, rs1);
		}
		// 返回结果
		return r;
	}

	// 菜谱步骤详情
	@Override
	public RecipeStep recipeStepDetailDao(String recipeId) {
		// 声明jdbc变量
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明对象
		RecipeStep recs = new RecipeStep();
		List<String> info = new LinkedList<>();
		List<String> stepPath = new LinkedList<>();
		int index = 0;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "SELECT * FROM `recipe_step` where recipeId=?";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值
			ps.setString(1, recipeId);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					// 给变量赋值
					info.add(rs.getString("info"));
					stepPath.add(rs.getString("filePath"));
					index++;
				}
				recs.setInfo(info);
				recs.setFilePath(stepPath);
			}
			// 输出r
//			System.out.println(r);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
		}
		// 返回结果
		return recs;
	}

	// 删除菜谱
	@Override
	public int DeleteRecipeDao(String recipeId) {
		// 声明jdbc对象
		Connection conn = null;
		PreparedStatement ps = null;
		// 声明变量
		int index = -1;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "DELETE a,b,c,d FROM recipe a INNER JOIN recipe_category b ON a.id = b.recipeId INNER JOIN recipe_step c ON a.id = c.recipeId INNER JOIN user_createrecipe d ON a.id = d.createRecipe WHERE a.id = ?;";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值，索引从1 开始 值是什么类型就set什么类型
			ps.setString(1, recipeId);
			// 执行sql语句
			index = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnection.closeDB(conn, ps, null);
		}
		return index;
	}

	// 插入收藏菜谱
	@Override
	public int insertCollectionRecipeDao(String recipeId, User user) {
		// 声明jdbc对象
		Connection conn = null;
		PreparedStatement ps = null;
		// 声明变量
		int index = -1;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "insert into user_collection values(default,?,?)";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 判断，如果没登录，user为空，不需要返回isExistCollection
			if(user!=null) {
				// 给占位符赋值
				ps.setInt(1, user.getUserId());
				ps.setString(2, recipeId);
				// 执行sql语句
				index = ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnection.closeDB(conn, ps, null);
		}
		return index;
	}

	// 删除收藏菜谱
	@Override
	public int deleteCollectionRecipeDao(String recipeId, User user) {
			// 声明jdbc对象
			Connection conn = null;
			PreparedStatement ps = null;
			// 声明变量
			int index = -1;
			try {
				// 获取链接
				conn = DbConnection.getConnection();
				// 创建sql命令
				String sql = "DELETE FROM user_collection where userId = ? and collection = ?";
				// 创建sql命令对象
				ps = conn.prepareStatement(sql);
				// 给占位符赋值
				ps.setInt(1, user.getUserId());
				ps.setString(2, recipeId);
				// 执行sql语句
				index = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DbConnection.closeDB(conn, ps, null);
			}
			return index;
	}
}
