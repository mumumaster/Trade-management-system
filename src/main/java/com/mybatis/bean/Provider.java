package com.mybatis.bean;

import java.util.Date;

public class Provider {
	private Integer id;

	private String procode;

	private String proname;

	private String prodesc;

	private String procontact;

	private String prophone;

	private String proaddress;

	private String profax;

	private Integer createdby;

	private Date creationdate;

	private Integer modifyby;

	private Date modifydate;

	public Provider() {
		super();
	}

	public Provider(Integer id, String procode, String proname, String prodesc, String procontact, String prophone, String proaddress, String profax, Integer createdby, Date creationdate, Integer modifyby, Date modifydate) {
		super();
		this.id = id;
		this.procode = procode;
		this.proname = proname;
		this.prodesc = prodesc;
		this.procontact = procontact;
		this.prophone = prophone;
		this.proaddress = proaddress;
		this.profax = profax;
		this.createdby = createdby;
		this.creationdate = creationdate;
		this.modifyby = modifyby;
		this.modifydate = modifydate;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProcode() {
		return procode;
	}

	public void setProcode(String procode) {
		this.procode = procode == null ? null : procode.trim();
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname == null ? null : proname.trim();
	}

	public String getProdesc() {
		return prodesc;
	}

	public void setProdesc(String prodesc) {
		this.prodesc = prodesc == null ? null : prodesc.trim();
	}

	public String getProcontact() {
		return procontact;
	}

	public void setProcontact(String procontact) {
		this.procontact = procontact == null ? null : procontact.trim();
	}

	public String getProphone() {
		return prophone;
	}

	public void setProphone(String prophone) {
		this.prophone = prophone == null ? null : prophone.trim();
	}

	public String getProaddress() {
		return proaddress;
	}

	public void setProaddress(String proaddress) {
		this.proaddress = proaddress == null ? null : proaddress.trim();
	}

	public String getProfax() {
		return profax;
	}

	public void setProfax(String profax) {
		this.profax = profax == null ? null : profax.trim();
	}

	public Integer getCreatedby() {
		return createdby;
	}

	public void setCreatedby(Integer createdby) {
		this.createdby = createdby;
	}

	public Date getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(Date creationdate) {
		this.creationdate = creationdate;
	}

	public Integer getModifyby() {
		return modifyby;
	}

	public void setModifyby(Integer modifyby) {
		this.modifyby = modifyby;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
}