package yjf.psyd.dao.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import yjf.psyd.bean.User;
import yjf.psyd.dao.UserDao;
import yjf.psyd.util.DbConnection;

public class UserDaoImpl implements UserDao {

	// 根据用户名和密码查询用户信息
	@Override
	public User checkUserLoginDao(String username, String password) {
		// 声明jdbc对象
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明变量
		User u = null;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "select * from user where username=? and password=?";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值，索引从1 开始 值是什么类型就set什么类型
			ps.setString(1, username);
			ps.setString(2, password);
			// 执行sql语句
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					// 给变量赋值
					u = new User();
					u.setUserId(rs.getInt("id"));
					u.setCreateDate(rs.getString("createDate"));
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setProtrait(rs.getString("protrait"));
					u.setInfo(rs.getString("info"));
				}
//				// 输出u
//				System.out.println(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭链接
			DbConnection.closeDB(conn, ps, rs);
		}
		// 返回结果
		return u;
	}

	// 用户注册
	@Override
	public int userRegisterDao(String createDate, String username, String password) {
		// 声明jdbc对象
		Connection conn = null;
		PreparedStatement ps = null;
		// 声明变量
		int index = -1;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "insert into user values(default,?,?,?,default,default)";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值，索引从1 开始 值是什么类型就set什么类型
			ps.setString(1, createDate);
			ps.setString(2, username);
			ps.setString(3, password);
			// 执行sql语句
			index = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnection.closeDB(conn, ps, null);
		}
		return index;
	}

	// 验证用户名是否存在
	@Override
	public boolean checkUserNameDao(String username) {
		// 声明jdbc对象
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 声明变量
		boolean isExist = false;
		int index = -1;
		try {
			// 获取链接
			conn = DbConnection.getConnection();
			// 创建sql命令
			String sql = "select count(1) from user where username = ?";
			// 创建sql命令对象
			ps = conn.prepareStatement(sql);
			// 给占位符赋值，索引从1 开始 值是什么类型就set什么类型
			ps.setString(1, username);
			// 执行sql语句
			rs=ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
				// 给变量赋值
				index = rs.getInt(1);
				}
			}
			// 判断index的值，如果>0则用户名存在，否则不存在
			if (index > 0) {
				isExist = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnection.closeDB(conn, ps, null);
		}
		return isExist;
	}
}
