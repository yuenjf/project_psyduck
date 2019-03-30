package yjf.psyd.bean;

public class SearchPageDetail {
	private int recipeId;
	private String title;
	private String coverPath;
	private int userId;
	private String username;

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
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

	@Override
	public String toString() {
		return "SearchPageDetail [recipeId=" + recipeId + ", title=" + title + ", coverPath=" + coverPath + ", userId="
				+ userId + ", username=" + username + "]";
	}

	public SearchPageDetail(int recipeId, String title, String coverPath, int userId, String username) {
		this.recipeId = recipeId;
		this.title = title;
		this.coverPath = coverPath;
		this.userId = userId;
		this.username = username;
	}

	public SearchPageDetail() {

	}

}
