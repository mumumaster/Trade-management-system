package com.mybatis.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Pattern;

public class Resources implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4276542922844633258L;

	private Integer id;

	@Pattern(regexp = "(^[a-zA-Z0-9_\\u4e00-\\u9fa5]{4,16}$)", message = "资源名称只能是4-16位数字和字母的组合！")
	private String name;

	private Integer type;

	private String url;

	private Integer parentid;

	private Integer chirdenCount;

	private Integer isavailable;
	
	private List<Resources> menuChirden = new ArrayList<Resources>();

	@Override
	public String toString() {
		return "Resources [id=" + id + ", name=" + name + ", type=" + type + ", url=" + url + ", parentid=" + parentid
				+ ", chirdenCount=" + chirdenCount + ", isavailable=" + isavailable + ", menuChirden=" + menuChirden
				+ "]";
	}

	public List<Resources> getMenuChirden() {
		return menuChirden;
	}

	public void setMenuChirden(List<Resources> menuChirden) {
		this.menuChirden = menuChirden;
	}

	public Integer getChirdenCount() {
		return chirdenCount;
	}

	public void setChirdenCount(Integer chirdenCount) {
		this.chirdenCount = chirdenCount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public Integer getIsavailable() {
		return isavailable;
	}

	public void setIsavailable(Integer isavailable) {
		this.isavailable = isavailable;
	}
}