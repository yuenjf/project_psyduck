package yjf.psyd.bean;

import java.util.List;

public class CategoryPage {
	private String item;
	private String categoryName;

	private int currentPage;
	private int pageSize;
	private int totleCount;
	private int totlePage;
	private List<CategoryPageDetail> categoryPageDetail;

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		// 自动计算总页数
		this.totlePage = this.totleCount % this.pageSize == 0 ? this.totleCount / this.pageSize
				: this.totleCount / this.pageSize + 1;
	}

	public int getTotleCount() {
		return totleCount;
	}

	public void setTotleCount(int totleCount) {
		this.totleCount = totleCount;
	}

	public int getTotlePage() {
		return totlePage;
	}

	public void setTotlePage(int totlePage) {
		this.totlePage = totlePage;
	}

	public List<CategoryPageDetail> getCategoryPageDetail() {
		return categoryPageDetail;
	}

	public void setCategoryPageDetail(List<CategoryPageDetail> categoryPageDetail) {
		this.categoryPageDetail = categoryPageDetail;
	}

	@Override
	public String toString() {
		return "CategoryPage [item=" + item + ", categoryName=" + categoryName + ", currentPage=" + currentPage
				+ ", pageSize=" + pageSize + ", totleCount=" + totleCount + ", totlePage=" + totlePage
				+ ", categoryPageDetail=" + categoryPageDetail + "]";
	}

}
