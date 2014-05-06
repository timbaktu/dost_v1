package com.dost.hibernate;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;

public class DbGeneric implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6567774336505738077L;
	@Column(name="createdate")
	private Date createDate;
	@Column(name="createby")
	private String createBy;
	@Column(name="updatedate")
	private Date updateDate;
	@Column(name="updateby")
	private String updateBy;
	@Column(name="deleted")
	private String deleted;
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	
	
}
