package com.soft.common.util;

import java.io.File;

public class PathUtil {
	
	public static String getRootPath(String path) {
		String classpath = PathUtil.class.getResource("/").getPath();
		if ("/".equals(File.separator)){
			classpath = classpath.replace("/BOOT-INF/classes","/");
		}else{
			classpath = classpath.replaceFirst("/", "").replace("/BOOT-INF/classes","/");
		}
		String filePath = classpath+"META-INF/resources/"+path;
		return filePath;
	}
	
	public static String getClassPath(String path) {
		String classpath =  PathUtil.class.getResource("/").getPath() + path;
		return classpath;
	}
}
