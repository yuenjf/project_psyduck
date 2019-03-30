package yjf.psyd.service.impl;

import yjf.psyd.bean.CategoryPage;
import yjf.psyd.bean.HomePage;
import yjf.psyd.bean.Page;
import yjf.psyd.bean.PageDetail;
import yjf.psyd.bean.SearchPage;
import yjf.psyd.dao.PageDao;
import yjf.psyd.dao.impl.PageDaoImpl;
import yjf.psyd.service.PageService;

public class PageServiceImpl implements PageService {
	// 声明Dao层对象，多态
	PageDao pd = new PageDaoImpl();

	// 请求首页PopRecipe数据
	@Override
	public Page indexPopRecipeService(int index) {
		return pd.indexPopRecipeDao(index);
	}

	// 请求homePage分页数据
	@Override
	public HomePage homePageService(String userId ,int createCp,int collectionCp) {
		return pd.homePageDao(userId,createCp,collectionCp);
	}

	// 请求category分页数据
	@Override
	public CategoryPage categoryPageService(String item, int categoryCp) {
		return pd.categoryPageDao(item, categoryCp);
	}

	// 菜谱搜索分页显示
	@Override
	public SearchPage searchPageService(int searchCp,String searchKeyword) {
		return pd.searchPageDao(searchCp,searchKeyword);
	}

	
	

}
