package yjf.psyd.bean;

import java.util.List;

public class HomePage {
	private int userId;
	private String username;
	private String createDate;
	private int li;

	// 菜谱动态分页
	private int createCurrentPage;
	private int createPageSize;
	private int createTotleCount;
	private int createTotlePage;
	private List<HomePageDetail> createDetail;

	// 收藏菜谱分页
	private int collectionCurrentPage;
	private int collectionPageSize;
	private int collectionTotleCount;
	private int collectionTotlePage;
	private List<HomePageDetail> collectionDetail;

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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getLi() {
		return li;
	}

	public void setLi(int li) {
		this.li = li;
	}

	public int getCreateCurrentPage() {
		return createCurrentPage;
	}

	public void setCreateCurrentPage(int createCurrentPage) {
		this.createCurrentPage = createCurrentPage;
	}

	public int getCreatePageSize() {
		return createPageSize;
	}

	public void setCreatePageSize(int createPageSize) {
		this.createPageSize = createPageSize;
		// 自动计算总页数
		this.createTotlePage = this.createTotleCount % this.createPageSize == 0
				? this.createTotleCount / this.createPageSize
				: this.createTotleCount / this.createPageSize + 1;
	}

	public int getCreateTotleCount() {
		return createTotleCount;
	}

	public void setCreateTotleCount(int createTotleCount) {
		this.createTotleCount = createTotleCount;
	}

	public int getCreateTotlePage() {
		return createTotlePage;
	}

	public void setCreateTotlePage(int createTotlePage) {
		this.createTotlePage = createTotlePage;
	}

	public List<HomePageDetail> getCreateDetail() {
		return createDetail;
	}

	public void setCreateDetail(List<HomePageDetail> createDetail) {
		this.createDetail = createDetail;
	}

	public int getCollectionCurrentPage() {
		return collectionCurrentPage;
	}

	public void setCollectionCurrentPage(int collectionCurrentPage) {
		this.collectionCurrentPage = collectionCurrentPage;
	}

	public int getCollectionPageSize() {
		return collectionPageSize;
	}

	public void setCollectionPageSize(int collectionPageSize) {
		this.collectionPageSize = collectionPageSize;
		// 自动计算总页数
		this.collectionTotlePage = this.collectionTotleCount % this.collectionPageSize == 0
				? this.collectionTotleCount / this.collectionPageSize
				: this.collectionTotleCount / this.collectionPageSize + 1;
	}

	public int getCollectionTotleCount() {
		return collectionTotleCount;
	}

	public void setCollectionTotleCount(int collectionTotleCount) {
		this.collectionTotleCount = collectionTotleCount;
	}

	public int getCollectionTotlePage() {
		return collectionTotlePage;
	}

	public void setCollectionTotlePage(int collectionTotlePage) {
		this.collectionTotlePage = collectionTotlePage;
	}

	public List<HomePageDetail> getCollectionDetail() {
		return collectionDetail;
	}

	public void setCollectionDetail(List<HomePageDetail> collectionDetail) {
		this.collectionDetail = collectionDetail;
	}

	@Override
	public String toString() {
		return "HomePage [userId=" + userId + ", username=" + username + ", createDate=" + createDate + ", li=" + li
				+ ", createCurrentPage=" + createCurrentPage + ", createPageSize=" + createPageSize
				+ ", createTotleCount=" + createTotleCount + ", createTotlePage=" + createTotlePage + ", createDetail="
				+ createDetail + ", collectionCurrentPage=" + collectionCurrentPage + ", collectionPageSize="
				+ collectionPageSize + ", collectionTotleCount=" + collectionTotleCount + ", collectionTotlePage="
				+ collectionTotlePage + ", collectionDetail=" + collectionDetail + "]";
	}

}
