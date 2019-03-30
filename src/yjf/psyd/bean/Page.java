package yjf.psyd.bean;

import java.util.List;

// 分页帮助类
public class Page {
//	当前页	
	private int currentPage;
//	页面大小
	private int pageSize;
//	总数据
	private int totleCount;
//	总页数
	private int totlePage;
//	当前页数据集合
	private List<PageDetail> pageDetail;

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

	public List<PageDetail> getPageDetail() {
		return pageDetail;
	}

	public void setPageDetail(List<PageDetail> pageDetail) {
		this.pageDetail = pageDetail;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totleCount=" + totleCount
				+ ", totlePage=" + totlePage + ", pageDetail=" + pageDetail + "]";
	}

}
