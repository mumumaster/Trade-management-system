package com.mybatis.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Pattern;

public class User {
	private Long id;

	@Pattern(regexp = "(^[a-zA-Z][a-zA-Z0-9_-]{5,16}$)", message = "编号必须是以英文字母开头6-16位数字和字母的组合，黑客你好！")
	private String usercode;

	@Pattern(regexp = "(^[a-zA-Z][a-zA-Z0-9_-]{5,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)", message = "用户名必须是以英文字母开头6-16位数字和字母的组合或者2-5位中文，黑客你好！")
	private String username;

	@Pattern(regexp = "(^[a-zA-Z][a-zA-Z0-9_-]{5,16}$)", message = "密码必须是以英文字母开头6-16位数字和字母的组合，黑客你好！")
	private String userpassword;

	private Integer gender;

	private Date birthday;

	private String phone;

	private String address;
	
	private Integer userrole;

	private Long createdby;

	private Date creationdate;

	private Long modifyby;

	private Date modifydate;

	private String idpicpath;

	private String workpicpath;

	private Integer userstate;

	private String roleName;

	private String birthdayStr;
	
	private List<Resources> menuInfo;

	public List<Resources> getMenuInfo() {
		return menuInfo;
	}

	public void setMenuInfo(List<Resources> menuInfo) {
		this.menuInfo = menuInfo;
	}

	public Integer getUserrole() {
		return userrole;
	}

	public void setUserrole(Integer userrole) {
		this.userrole = userrole;
	}

	public String getBirthdayStr() {

		birthdayStr = new SimpleDateFormat("yyyy-MM-dd").format(getBirthday());
		return birthdayStr;
	}

	public void setBirthdayStr(String birthdayStr) {
		this.birthdayStr = birthdayStr;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode == null ? null : usercode.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword == null ? null : userpassword.trim();
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public Long getCreatedby() {
		return createdby;
	}

	public void setCreatedby(Long createdby) {
		this.createdby = createdby;
	}

	public Date getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(Date creationdate) {
		this.creationdate = creationdate;
	}

	public Long getModifyby() {
		return modifyby;
	}

	public void setModifyby(Long modifyby) {
		this.modifyby = modifyby;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public String getIdpicpath() {
		return idpicpath;
	}

	public void setIdpicpath(String idpicpath) {
		this.idpicpath = idpicpath == null ? null : idpicpath.trim();
	}

	public String getWorkpicpath() {
		return workpicpath;
	}

	public void setWorkpicpath(String workpicpath) {
		this.workpicpath = workpicpath == null ? null : workpicpath.trim();
	}

	public Integer getUserstate() {
		return userstate;
	}

	public void setUserstate(Integer userstate) {
		this.userstate = userstate;
	}
}