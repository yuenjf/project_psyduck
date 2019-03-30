package yjf.psyd.dao;

import java.io.File;
import java.util.List;

import yjf.psyd.bean.Recipe;
import yjf.psyd.bean.RecipeStep;
import yjf.psyd.bean.User;

public interface RecipeDao {

	/**
	 * 创建菜谱
	 * 
	 * @param title
	 * @param info
	 * @param material
	 * @param stepInfos
	 * @param categorys
	 * @param coverFilePath
	 * @param stepFiles
	 * @param user
	 * @return
	 */
	int createRecipeDao(String createDate, String title, String info, String material, List<String> stepInfos,
			List<String> categorys, String coverFilePath, List<String> stepFilesPath, User user);

	/**
	 * 菜谱详情
	 * 
	 * @param recipeId
	 * @param user 
	 * @return
	 */
	Recipe recipeDetailDao(String recipeId, User user);

	/**
	 * 菜谱步骤详情
	 * 
	 * @param recipeId
	 * @return
	 */
	RecipeStep recipeStepDetailDao(String recipeId);

	/**
	 * 删除菜谱
	 * 
	 * @param recipeId
	 * @return
	 */
	int DeleteRecipeDao(String recipeId);

	/**
	 * 插入收藏菜谱
	 * 
	 * @param status
	 * @param user
	 * @return
	 */
	int insertCollectionRecipeDao(String status, User user);

	/**
	 * 删除收藏菜谱
	 * 
	 * @param recipeId
	 * @param user
	 * @return
	 */
	int deleteCollectionRecipeDao(String recipeId, User user);

}
