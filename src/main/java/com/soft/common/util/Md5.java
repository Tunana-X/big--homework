package com.soft.common.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 字符串加密工具类
 * @author cc
 *
 */
public class Md5 {
	/**
	 * 密码加密
	 * @param password
	 * @return
	 */
	public static String makeMd5(String password){
		if (password==null || "".equals(password)) {
			return password;
		}
		return DigestUtils.md5Hex(password);
	}
	
	public static void main(String[] args){
        System.out.println(makeMd5("111111"));//96e79218965eb72c92a549dd5a330112
    }
	
}
