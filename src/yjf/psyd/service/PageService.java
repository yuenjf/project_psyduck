package yjf.psyd.service;

import yjf.psyd.bean.CategoryPage;
import yjf.psyd.bean.HomePage;
import yjf.psyd.bean.Page;
import yjf.psyd.bean.PageDetail;
import yjf.psyd.bean.SearchPage;

public interface PageService {

	/**
	 * 请求首页PopRecipe数据
	 * 
	 * @param index
	 * @return
	 */
	Page indexPopRecipeService(int index);

	/**
	 * 请求homePage分页数据
	 * 
	 * @param userId
	 * @param collectionCp
	 * @param currentPage
	 * @param cPage
	 * @return
	 */
	HomePage homePageService(String userId, int createCp, int collectionCp);

	/**
	 * 请求category分页数据
	 * 
	 * @param item
	 * @param categoryCp
	 * @return
	 */
	CategoryPage categoryPageService(String item, int categoryCp);

	/**
	 * 菜谱搜索分页显示
	 * 
	 * @param searchKeyword
	 * @return
	 */
	SearchPage searchPageService(int searchCp,String searchKeyword);

}
