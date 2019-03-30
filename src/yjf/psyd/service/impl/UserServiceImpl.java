package yjf.psyd.service.impl;

import java.io.File;
import java.sql.Date;
import java.util.List;

import yjf.psyd.bean.User;
import yjf.psyd.dao.UserDao;
import yjf.psyd.dao.impl.UserDaoImpl;
import yjf.psyd.service.UserService;

public class UserServiceImpl implements UserService {
	// 声明Dao层对象，多态
	UserDao ud = new UserDaoImpl();

	// 用户登录
	@Override
	public User checkUserLoginService(String username, String password) {
		return ud.checkUserLoginDao(username, password);
	}

	// 用户注册
	@Override
	public int userRegisterService(String createDate, String username, String password) {
		return ud.userRegisterDao(createDate, username, password);
	}

	// 验证用户名是否存在
	@Override
	public boolean checkUserNameService(String username) {
		return ud.checkUserNameDao(username);
	}

}
