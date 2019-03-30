package yjf.psyd.service.impl;

import java.io.File;
import java.util.List;

import yjf.psyd.bean.Recipe;
import yjf.psyd.bean.RecipeStep;
import yjf.psyd.bean.User;
import yjf.psyd.dao.RecipeDao;
import yjf.psyd.dao.impl.RecipeDaoImpl;
import yjf.psyd.service.RecipeService;

public class RecipeServiceImpl implements RecipeService {

	// 声明Dao层对象，多态
	RecipeDao rd = new RecipeDaoImpl();

	// 创建菜谱
	@Override
	public int createRecipeService(String createDate, String title, String info, String material,
			List<String> stepInfos, List<String> categorys, String coverFilePath, List<String> stepFilesPath, User user) {
		return rd.createRecipeDao(createDate, title, info, material, stepInfos, categorys, coverFilePath, stepFilesPath,
				user);
	}

	// 菜谱详情
	@Override
	public Recipe recipeDetailService(String recipeId,User user) {
		return rd.recipeDetailDao(recipeId,user);
	}

	// 菜谱步骤详情
	@Override
	public RecipeStep recipeStepDetailService(String recipeId) {
		return rd.recipeStepDetailDao(recipeId);
	}

	// 删除菜谱
	@Override
	public int DeleteRecipeService(String recipeId) {
		return rd.DeleteRecipeDao(recipeId);
	}

	// 插入收藏菜谱
	@Override
	public int insertCollectionRecipe(String recipeId,User user) {
		return rd.insertCollectionRecipeDao(recipeId,user);
	}

	// 删除收藏菜谱
	@Override
	public int deleteCollectionRecipe(String recipeId, User user) {
		return rd.deleteCollectionRecipeDao(recipeId,user);
	}

	
}
