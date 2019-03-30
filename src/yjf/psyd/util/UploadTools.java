package yjf.psyd.util;

import java.util.UUID;

// 文件上传工具类
public class UploadTools {
	public static String getUUIDFileName(String fileName) {
		// 是从右向左查某个指定的字符串在字符串中最后一次出现的位置，拿到.jpg等后缀名
		int suffixIndex = fileName.lastIndexOf('.');
		String suffixName = fileName.substring(suffixIndex);
		String uuidFileName = UUID.randomUUID().toString().replace("-", "") + suffixName;
		return uuidFileName;
	}

	// 测试
	public static void main(String[] args) {
		String newFileName = UploadTools.getUUIDFileName("download.jpg");
		System.out.println(newFileName);
	}
}
