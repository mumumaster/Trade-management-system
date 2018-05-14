package com.mybatis.utils;

import java.io.InputStream;
import java.util.Properties;

public class PropertiesHelper {
	public static void main(String[] args) throws Exception {
		Properties  ps = new Properties();
		try(InputStream in = PropertiesHelper.class.getClassLoader().getResourceAsStream("dbconfig.properties")){
			ps.load(in);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(ps.get("jdbc.user"));	
		System.out.println(ps.getProperty("jdbc.jdbcUrl"));	
		System.out.println("\n");
		
		
		//测试
		String url=ps.getProperty("jdbc.jdbcUrl");
		//调用加密方法
		byte[] encrypt =DES3LEncrypt.encrypt("12345678:"+url);
		String encodedString =new String(encrypt,"utf-8");
		System.out.println("加密之后的字符串:"+encodedString);
		
		//调用解密方法
		String decrypt = DES3LEncrypt.decrypt(encodedString);
		decrypt =  decrypt.substring(decrypt.indexOf(':')+1);
		System.out.println("\n解密之后的正确字符串"+decrypt);
			
		
	}
}
