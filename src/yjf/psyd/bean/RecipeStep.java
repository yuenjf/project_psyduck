package yjf.psyd.bean;

import java.util.List;

public class RecipeStep {
	private List<String> info;
	private List<String> filePath;
	
	public List<String> getInfo() {
		return info;
	}
	public void setInfo(List<String> info) {
		this.info = info;
	}
	public List<String> getFilePath() {
		return filePath;
	}
	public void setFilePath(List<String> filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "RecipeStep [info=" + info + ", filePath=" + filePath + "]";
	}

	
}
