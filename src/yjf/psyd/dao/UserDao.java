package yjf.psyd.dao;

import java.io.File;
import java.sql.Date;
import java.util.List;

import yjf.psyd.bean.User;

//	UserDao接口
public interface UserDao {
	/**
	 * 根据用户名和密码查询用户信息
	 * 
	 * @param username
	 * @param password
	 * @return 返回查询到的用户信息
	 */
	User checkUserLoginDao(String username, String password);

	/**
	 * 用户注册
	 * 
	 * @param createDate
	 * @param username
	 * @param password
	 * @return
	 */
	int userRegisterDao(String createDate, String username, String password);

	/**
	 * 验证用户名是否存在
	 * 
	 * @param username
	 * @return
	 */
	boolean checkUserNameDao(String username);

}
