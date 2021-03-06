package com.qcacg.common.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class MD5Util {

	private static String salt = "our'qcacg";

	/**
	 * 加salt生成md5 32位加密
	 * @param encryptStr
	 * @return
	 */
	public static String encrypt32(String encryptStr) {
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			byte[] md5Bytes = md5.digest((encryptStr + salt).getBytes());
			StringBuffer hexValue = new StringBuffer();
			for (int i = 0; i < md5Bytes.length; i++) {
				int val = ((int) md5Bytes[i]) & 0xff;
				if (val < 16)
					hexValue.append("0");
				hexValue.append(Integer.toHexString(val));
			}
			encryptStr = hexValue.toString();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return encryptStr;
	}
	/**
	 * 加salt生成md5 16位加密
	 * @param encryptStr
	 * @return
	 */
	public static String encrypt16(String encryptStr) {  
        return encrypt32(encryptStr).substring(8, 24);  
    }
	public static void main(String[] args) {
		System.out.println(encrypt32("123456"));
	}
}
