package yjf.psyd.service;

import java.io.File;
import java.util.List;

import yjf.psyd.bean.Recipe;
import yjf.psyd.bean.RecipeStep;
import yjf.psyd.bean.User;

public interface RecipeService {

	/**
	 * 创建菜谱
	 * 
	 * @param title
	 * @param info
	 * @param material
	 * @param material2
	 * @param stepInfos
	 * @param categorys
	 * @param coverFilePath
	 * @param stepFiles
	 * @param user
	 * @return
	 */
	int createRecipeService(String createDate, String title, String info, String material, List<String> stepInfos,
			List<String> categorys, String coverFilePath, List<String> stepFilesPath, User user);

	/**
	 * 菜谱详情
	 * 
	 * @param recipeId
	 * @param user 
	 * @return
	 */
	Recipe recipeDetailService(String recipeId, User user);

	/**
	 * 菜谱步骤详情
	 * 
	 * @param recipeId
	 * @return
	 */
	RecipeStep recipeStepDetailService(String recipeId);

	/**
	 * 删除菜谱
	 * 
	 * @param recipeId
	 * @return
	 */
	int DeleteRecipeService(String recipeId);

	/**
	 * 插入收藏菜谱
	 * 
	 * @param status
	 * @param user
	 * @return
	 */
	int insertCollectionRecipe(String recipeId, User user);

	/**
	 * 删除收藏菜谱
	 * 
	 * @param recipeId
	 * @param user
	 * @return
	 */
	int deleteCollectionRecipe(String recipeId, User user);

}
