package yjf.psyd.bean;

import java.sql.Date;
import java.util.List;

public class User {
	private int userId;
	private String createDate;
	private String username;
	private String password;
	private String protrait;
	private String info;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProtrait() {
		return protrait;
	}

	public void setProtrait(String protrait) {
		this.protrait = protrait;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", createDate=" + createDate + ", username=" + username + ", password="
				+ password + ", protrait=" + protrait + ", info=" + info + "]";
	}

}