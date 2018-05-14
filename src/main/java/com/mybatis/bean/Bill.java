package com.mybatis.bean;

import javax.validation.constraints.Pattern;

public class Bill {
	private Integer id;

	@Pattern(regexp="(^[a-zA-Z][a-zA-Z0-9_-]{5,16}$)",message="用户名必须是以英文字母开头6-16位数字和字母的组合，黑客你好！")
	private String orderid;

	private Float cost;

	private Integer providerid;

	private Integer ispayment;

	private String sname;
	
	private String proName;
	

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid == null ? null : orderid.trim();
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public Integer getProviderid() {
		return providerid;
	}

	public void setProviderid(Integer providerid) {
		this.providerid = providerid;
	}

	public Integer getIspayment() {
		return ispayment;
	}

	public void setIspayment(Integer ispayment) {
		this.ispayment = ispayment;
	}
}