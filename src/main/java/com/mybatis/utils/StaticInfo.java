package com.mybatis.utils;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class StaticInfo implements Serializable{
	private static final long serialVersionUID = 5282223927952953942L;
	public static final Map<String, String> TYPE_MAP= new HashMap<String, String>();
	static {
		TYPE_MAP.put(".jpg", "");
		TYPE_MAP.put(".doc", "");
		TYPE_MAP.put(".docx", "");
		TYPE_MAP.put(".gif", "");
		TYPE_MAP.put(".png", "");
	}
}
