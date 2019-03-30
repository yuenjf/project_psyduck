package yjf.psyd.bean;

import java.sql.Date;

public class Recipe {
	private int recipeId;
	private String createDate;
	private String title;
	private String coverPath;
	private String info;
	private String material;
	private int userId;
	private String username;
	// 判断是否收藏
	private int isExistCollection;

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getIsExistCollection() {
		return isExistCollection;
	}

	public void setIsExistCollection(int isExistCollection) {
		this.isExistCollection = isExistCollection;
	}

	@Override
	public String toString() {
		return "Recipe [recipeId=" + recipeId + ", createDate=" + createDate + ", title=" + title + ", coverPath="
				+ coverPath + ", info=" + info + ", material=" + material + ", userId=" + userId + ", username="
				+ username + ", isExistCollection=" + isExistCollection + "]";
	}

}
