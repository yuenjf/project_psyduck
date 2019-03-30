package yjf.psyd.dao;

import yjf.psyd.bean.CategoryPage;
import yjf.psyd.bean.HomePage;
import yjf.psyd.bean.Page;
import yjf.psyd.bean.SearchPage;

public interface PageDao {

	/**
	 * 请求首页PopRecipe数据
	 * 
	 * @param currentPage
	 * @return
	 */
	Page indexPopRecipeDao(int index);

	/**
	 * 请求homepage分页数据
	 * 
	 * @param userId
	 * @param collectionCp
	 * @param currentPage
	 * @return
	 */
	HomePage homePageDao(String userId, int createCp, int collectionCp);

	/**
	 * 请求category分页数据
	 * 
	 * @param item
	 * @param categoryCp
	 * @return
	 */
	CategoryPage categoryPageDao(String item, int categoryCp);

	/**
	 * 菜谱搜索分页显示
	 * 
	 * @param searchKeyword
	 * @return
	 */
	SearchPage searchPageDao(int searchCp,String searchKeyword);

}
