package yjf.psyd.bean;

public class HomePageDetail {
	private int recipeId;
	private String title;
	private String coverPath;

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

	@Override
	public String toString() {
		return "HomePageDetail [recipeId=" + recipeId + ", title=" + title + ", coverPath=" + coverPath + "]";
	}

	public HomePageDetail(int recipeId, String title, String coverPath) {
		this.recipeId = recipeId;
		this.title = title;
		this.coverPath = coverPath;
	}

	public HomePageDetail() {

	}

}
