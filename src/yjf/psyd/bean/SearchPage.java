package yjf.psyd.bean;

import java.util.List;

public class SearchPage {
	private String searchKeyword;

	private int currentPage;
	private int pageSize;
	private int totleCount;
	private int totlePage;
	private List<SearchPageDetail> searchPageDetail;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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

	public List<SearchPageDetail> getSearchPageDetail() {
		return searchPageDetail;
	}

	public void setSearchPageDetail(List<SearchPageDetail> searchPageDetail) {
		this.searchPageDetail = searchPageDetail;
	}

	@Override
	public String toString() {
		return "SearchPage [searchKeyword=" + searchKeyword + ", currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", totleCount=" + totleCount + ", totlePage=" + totlePage + ", searchPageDetail=" + searchPageDetail
				+ "]";
	}

}
