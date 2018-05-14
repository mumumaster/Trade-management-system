package com.mybatis.utils;

public interface StateInfo {
	enum Coffee implements StateInfo {
		BLACK_COFFEE("黑色", 1), DECAF_COFFEE("", 2), LATTE("", 3), CAPPUCCINO("", 6);
		// 成员变量
		private String name;
		private int index;

		// 构造方法
		private Coffee(String name, int index) {
			this.name = name;
			this.index = index;
		}

		// 普通方法
		public static String getName(int index) {
			for (Coffee c : Coffee.values()) {
				if (c.getIndex() == index) {
					return c.name;
				}
			}
			return null;
		}

		// get set 方法
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}
	}

	enum ReturnType implements StateInfo {
		response, springMVC
	}

	enum SystemConstants implements StateInfo {
		ERROR_RETURN_PATH(Constants.ERROR_RETURN_PATH,".jsp", 1),
		USER_STATE_ERROR(Constants.USER_STATE_ERROR,"账户被封禁", 2),
		USER_STATE_LOCKED(Constants.USER_STATE_LOCKED,"账户被锁定", 3),
		USER_CODE_UNKNOWN(Constants.USER_CODE_UNKNOWN,"账号不存在", 4),
		USER_PWD_ERROR(Constants.USER_PWD_ERROR,"密码错误", 5),
		SESSION_LOST(Constants.SESSION_LOST,"您由于长时间未操作，登录已失效账号不存在", 6),
		ERROR_JURISDICTION(Constants.ERROR_JURISDICTION,"此账号没有权限访问任何资源", 7),
		NO_JURISDICTION(Constants.NO_JURISDICTION,"您暂时无权限访问该资源", 8),
		NOT_LOGIN(Constants.NOT_LOGIN,"您处于未登录状态，请登录后再访问", 9),
		UNKNOWN_ERROR(Constants.UNKNOWN_ERROR,"未知错误", 10),
		SUCCESS(Constants.SUCCESS,"操作成功", 11),
		DATA_GET_ERROR(Constants.DATA_GET_ERROR,"数据获取失败", 12),
		DATA_UPDATE_ERROR(Constants.DATA_UPDATE_ERROR,"修改信息失败", 13),
		DATA_ERROR(Constants.DATA_ERROR,"数据不合法", 14);
		// 成员变量
		private String code;
		private String message;
		private int index;

		// 构造方法
		private SystemConstants(String code, String message, int index) {
			this.code = code;
			this.message = message;
			this.index = index;
		}

		// 普通方法
		public static String getName(int index) {
			for (Coffee c : Coffee.values()) {
				if (c.getIndex() == index) {
					return c.name;
				}
			}
			return null;
		}

		// get set 方法

		public int getIndex() {
			return index;
		}

		public String getCode() {
			return code;
		}

		public String getMessage() {
			return message;
		}

	}
}
