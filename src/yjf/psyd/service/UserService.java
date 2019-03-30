package yjf.psyd.service;

import java.io.File;
import java.sql.Date;
import java.util.List;

import yjf.psyd.bean.User;

//	UserService接口
public interface UserService {
	// 返回User，接收两个参数，servlet把接收到的两个参数传递给service
	/**
	 * 校验用户登录
	 * 
	 * @param username
	 * @param password
	 * @return 返回查询到的用户信息
	 */
	User checkUserLoginService(String username, String password);

	/**
	 * 用户注册
	 * 
	 * @param createDate
	 * @param username
	 * @param password
	 * @return
	 */
	int userRegisterService(String createDate, String username, String password);

	/**
	 * 验证用户名是否存在
	 * 
	 * @param username
	 * @return
	 */
	boolean checkUserNameService(String username);

}
