package com.mybatis.bean;

public class BillDetail {
	private Integer id;

	private Integer orderid;

	private Integer productid;

	private Integer quantity;

	private Float cost;

	// 增加的字段

	private String productName;// 商品名称

	private String productUnit;// 单位

	private Integer productCount;// 数量(这个没使用)

	private float price;// 单价

	private Product product;// 商品对象

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getProductUnit() {
		return productUnit;
	}

	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}

	public Integer getProductCount() {
		return productCount;
	}

	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	@Override
	public String toString() {
		return "BillDetail [id=" + id + ", orderid=" + orderid + ", productid=" + productid + ", quantity=" + quantity
				+ ", cost=" + cost + "]";
	}

}